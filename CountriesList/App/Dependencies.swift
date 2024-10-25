//
//  Dependencies.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

import Networking

final class Dependencies {
    
    static let shared = Dependencies()
    
    private init() { }
    
    lazy var networkClient: NetworkingClient = {
        NetworkingClient(
            config: Config(
                scheme: "",
                host: "",
                header: nil,
                token: nil
            )
        )
    }()
    
    lazy var countryRepository: CountriesRepository = {
        CountriesRepository(
            networkClient: networkClient
        )
    }()
}
