//
//  CountriesFetchEndpoint.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

import Networking

struct CountriesFetchEndpoint { }

extension CountriesFetchEndpoint: Endpoint {
    
    typealias Response = CountriesFetchResponse
    
    var scheme: String? {
        "https"
    }
    
    var host: String? {
        "gist.githubusercontent.com"
    }
    var path: String {
        "/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
    }
    
    var method: Networking.RequestMethod {
        .get
    }
}
