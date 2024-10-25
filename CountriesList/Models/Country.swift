//
//  Country.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

struct Country: Decodable, Hashable {
    let capital: String
    let code: String
    let currency: Currency
    let flag: String
    let language: Language
    let name: String
    let region: String
    let demonym: String?
}
