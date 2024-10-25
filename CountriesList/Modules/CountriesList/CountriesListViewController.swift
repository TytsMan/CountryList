//
//  CountriesListViewController.swift
//  CountriesList
//
//  Created by divan on 10/22/24.
//

import UIKit
import SnapKit
import ComposableArchitecture

class CountriesListViewController: UIViewController {
    typealias Store = StoreOf<CountriesList>
    private typealias DataSource = UITableViewDiffableDataSource<Int, CountriesListCell.ViewModel>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, CountriesListCell.ViewModel>
    
    private let store: Store
    private lazy var dataSource = makeDataSource()
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type country name"
        return search
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    private lazy var activityIndicatorView = UIActivityIndicatorView()
    
    init(store: Store) {
        self.store = store
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindState()
        store.send(.onLoad)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        store.send(.onDisappear)
    }
    
    private func setupUI() {
        title = "Countries List"
        navigationItem.searchController = searchController
        view.backgroundColor = .yellow
        
        tableView.register(cellType: CountriesListCell.self)
        tableView.dataSource = makeDataSource()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.directionalHorizontalEdges.bottom.equalToSuperview()
        }
        
        activityIndicatorView.isHidden = true
        tableView.addSubview(activityIndicatorView)
        activityIndicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func bindState() {
        observe { [weak self] in
            guard let self else { return }
            
            setLoadingState(store.listState == .loading)
            applySnapshot(viewModels: store.listState.countries ?? [])
            setPlaceholder(viewModel: store.listState.placeholder)
        }
    }
    
    private func makeDataSource() -> DataSource {
        DataSource(
            tableView: tableView
        ) { tableView, indexPath, viewModel in
            let cell: CountriesListCell = tableView.dequeue(for: indexPath)
            cell.configure(with: viewModel)
            return cell
        }
    }
    
    private func applySnapshot(viewModels: [CountriesListCell.ViewModel], animated: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModels)
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
    
    private func setLoadingState(_ isLoading: Bool) {
        activityIndicatorView.isHidden = !isLoading
        if isLoading {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
    }
    
    private func setPlaceholder(viewModel: PlaceholderView.ViewModel?) {
        if let viewModel {
            tableView.backgroundView = PlaceholderView(viewModel: viewModel)
        } else {
            tableView.backgroundView = nil
        }
    }
}

extension CountriesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        store.send(.searchTextChanged(searchText))
    }
}

extension CountriesListViewController {
    static func createVC() -> CountriesListViewController {
        CountriesListViewController(
            store: CountriesListViewController.Store(
                initialState: CountriesList.State(),
                reducer: {
                    CountriesList(
                        countriesRepository: Dependencies.shared.countryRepository
                    )
                }
            )
        )
    }
}

#if DEBUG

#Preview(body: {
    UINavigationController(
        rootViewController: CountriesListViewController(
            store: CountriesListViewController.Store(
                initialState: CountriesList.State(),
                reducer: {
                    CountriesList(
                        countriesRepository: CountriesRepositoryMock()
                    )
                }
            )
        )
    )
})

#endif
