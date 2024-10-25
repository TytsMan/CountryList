//
//  Currency.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

struct Currency : Decodable, Hashable {
    let code : String
    let name : String
    let symbol : String?
}
