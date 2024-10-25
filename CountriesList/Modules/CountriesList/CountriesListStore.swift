//
//  CountriesListStore.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

import ComposableArchitecture

@Reducer
struct CountriesList {
    @ObservableState
    struct State: Equatable {
        @CasePathable
        @dynamicMemberLookup
        enum ListState: Equatable {
            case `default`
            case loading
            case placeholder(PlaceholderView.ViewModel)
            case countries([CountriesListCell.ViewModel])
        }
        
        var countries: [Country] = []
        var listState: ListState = .default
    }
    
    enum Action {
        case onLoad
        case onDisappear
        case searchTextChanged(String)
        case countriesReceived(Result<[Country], Error>)
    }
    
    private enum CancelID { case countriesLoading }
    
    let countriesRepository: CountriesFetchRepository
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onLoad:
                state.listState = .loading
                return .run { send in
                    let result = await countriesRepository.fetchCountries()
                    await send(.countriesReceived(result))
                }
                .cancellable(id: CancelID.countriesLoading)
                
            case .onDisappear:
                return .cancel(id: CancelID.countriesLoading)
                
            case let .searchTextChanged(searchText):
                if searchText.isEmpty {
                    state.listState = .countries(state.countries.map(CountriesListCell.ViewModel.init))
                } else {
                    let filteredCountries = filterCountries(state.countries, by: searchText)
                    if !filteredCountries.isEmpty {
                        state.listState = .countries(filteredCountries.map(CountriesListCell.ViewModel.init))
                    } else {
                        state.listState = .placeholder(
                            .init(
                                title: "No entries",
                                text: "No countries were found for '\(searchText)'.",
                                image: "exclamationmark.icloud"
                            )
                        )
                    }
                }
                return .none
                
            case let .countriesReceived(result):
                switch result {
                case let .success(countries):
                    state.countries = countries
                    if !countries.isEmpty {
                        state.listState = .countries(countries.map(CountriesListCell.ViewModel.init))
                    } else {
                        state.listState = .placeholder(
                            .init(
                                title: "No entries",
                                text: "No countries were fetched.",
                                image: "externaldrive.fill.badge.wifi"
                            )
                        )
                    }
                case let .failure(error):
                    state.countries = []
                    state.listState = .placeholder(
                        .init(
                            title: "Error",
                            text: error.localizedDescription,
                            image: "exclamationmark.triangle.fill"
                        )
                    )
                }
                return .none
            }
        }._printChanges()
    }
    
    func filterCountries(_ countries: [Country], by searchText: String) -> [Country] {
        let searchText = searchText.trimmingCharacters(in: .whitespaces)
        return countries
            .filter { country in
                country.name.contains(searchText)
                || country.capital.contains(searchText)
            }
    }
}
