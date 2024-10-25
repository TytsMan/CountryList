//
//  CountriesListView.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

import SwiftUI
import UIKit

struct CountriesListView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        UINavigationController(
            rootViewController: CountriesListViewController(
                store: CountriesListViewController.Store(
                    initialState: CountriesList.State(),
                    reducer: {
                        CountriesList(
                            countriesRepository: Dependencies.shared.countryRepository
                        )
                    }
                )
            )
        )
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}
