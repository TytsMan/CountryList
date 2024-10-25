//
//  CountriesListCellViewModel.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

extension CountriesListCell {
    struct ViewModel: Hashable {
        let countryName: String
        let region: String
        let code: String
        let capitalName: String
        
        init(
            countryName: String,
            region: String,
            code: String,
            capitalName: String
        ) {
            self.countryName = countryName
            self.region = region
            self.code = code
            self.capitalName = capitalName
        }
        
        init(country: Country) {
            countryName = country.name
            region = country.region
            code = country.code
            capitalName = country.capital
        }
    }
}
