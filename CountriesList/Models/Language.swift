//
//  Language.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

struct Language: Codable, Hashable {
    let code: String?
    let name: String
    let iso6392: String?
    let nativeName: String?

    enum CodingKeys: String, CodingKey {
        case code, name
        case iso6392 = "iso639_2"
        case nativeName
    }
}
