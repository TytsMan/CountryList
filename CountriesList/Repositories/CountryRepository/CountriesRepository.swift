//
//  CountriesRepository.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

import Foundation
import Networking

protocol CountriesFetchRepository {
    func fetchCountries() async -> Result<[Country], any Error>
}

struct CountriesRepository {
    private let networkClient: NetworkingClient
    
    init(
        networkClient: NetworkingClient
    ) {
        self.networkClient = networkClient
    }
}

extension CountriesRepository: CountriesFetchRepository {
    func fetchCountries(
    ) async -> Result<[Country], any Error> {
        let endpoint = CountriesFetchEndpoint()
        let response = await networkClient.request(endpoint: endpoint)
        return response
            .map { data in data.compactMap { $0 } }
            .mapError { $0 }
    }
}

#if DEBUG

struct CountriesRepositoryMock: CountriesFetchRepository {
    func fetchCountries() async -> Result<[Country], any Error> {
        let data = countriesRepositoryJSONResponse.data(using: .utf8)!
        let countries = try! JSONDecoder().decode([Country].self, from: data)
        return .success(countries)
    }
}

let countriesRepositoryJSONResponse = """
[
  {
    "capital": "Kabul",
    "code": "AF",
    "currency": {
      "code": "AFN",
      "name": "Afghan afghani",
      "symbol": "؋"
    },
    "flag": "https://restcountries.eu/data/afg.svg",
    "language": {
      "code": "ps",
      "name": "Pashto"
    },
    "name": "Afghanistan",
    "region": "AS"
  },
  {
    "capital": "Mariehamn",
    "code": "AX",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/ala.svg",
    "language": {
      "code": "sv",
      "name": "Swedish"
    },
    "name": "Åland Islands",
    "region": "EU"
  },
  {
    "capital": "Tirana",
    "code": "AL",
    "currency": {
      "code": "ALL",
      "name": "Albanian lek",
      "symbol": "L"
    },
    "flag": "https://restcountries.eu/data/alb.svg",
    "language": {
      "code": "sq",
      "name": "Albanian"
    },
    "name": "Albania",
    "region": "EU"
  },
  {
    "capital": "Algiers",
    "code": "DZ",
    "currency": {
      "code": "DZD",
      "name": "Algerian dinar",
      "symbol": "د.ج"
    },
    "flag": "https://restcountries.eu/data/dza.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Algeria",
    "region": "AF"
  },
  {
    "capital": "Pago Pago",
    "code": "AS",
    "currency": {
      "code": "USD",
      "name": "United State Dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/asm.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "American Samoa",
    "region": "OC"
  },
  {
    "capital": "Andorra la Vella",
    "code": "AD",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/and.svg",
    "language": {
      "code": "ca",
      "name": "Catalan"
    },
    "name": "Andorra",
    "region": "EU"
  },
  {
    "capital": "Luanda",
    "code": "AO",
    "currency": {
      "code": "AOA",
      "name": "Angolan kwanza",
      "symbol": "Kz"
    },
    "flag": "https://restcountries.eu/data/ago.svg",
    "language": {
      "code": "pt",
      "name": "Portuguese"
    },
    "name": "Angola",
    "region": "AF"
  },
  {
    "capital": "The Valley",
    "code": "AI",
    "currency": {
      "code": "XCD",
      "name": "East Caribbean dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/aia.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Anguilla",
    "region": "NA"
  },
  {
    "capital": "Saint John's",
    "code": "AG",
    "currency": {
      "code": "XCD",
      "name": "East Caribbean dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/atg.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Antigua and Barbuda",
    "region": "NA"
  },
  {
    "capital": "Buenos Aires",
    "code": "AR",
    "currency": {
      "code": "ARS",
      "name": "Argentine peso",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/arg.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Argentina",
    "region": "SA"
  },
  {
    "capital": "Yerevan",
    "code": "AM",
    "currency": {
      "code": "AMD",
      "name": "Armenian dram",
      "symbol": null
    },
    "flag": "https://restcountries.eu/data/arm.svg",
    "language": {
      "code": "hy",
      "name": "Armenian"
    },
    "name": "Armenia",
    "region": "AS"
  },
  {
    "capital": "Oranjestad",
    "code": "AW",
    "currency": {
      "code": "AWG",
      "name": "Aruban florin",
      "symbol": "ƒ"
    },
    "flag": "https://restcountries.eu/data/abw.svg",
    "language": {
      "code": "nl",
      "name": "Dutch"
    },
    "name": "Aruba",
    "region": "SA"
  },
  {
    "capital": "Canberra",
    "code": "AU",
    "currency": {
      "code": "AUD",
      "name": "Australian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/aus.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Australia",
    "region": "OC"
  },
  {
    "capital": "Vienna",
    "code": "AT",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/aut.svg",
    "language": {
      "code": "de",
      "name": "German"
    },
    "name": "Austria",
    "region": "EU"
  },
  {
    "capital": "Baku",
    "code": "AZ",
    "currency": {
      "code": "AZN",
      "name": "Azerbaijani manat",
      "symbol": null
    },
    "flag": "https://restcountries.eu/data/aze.svg",
    "language": {
      "code": "az",
      "name": "Azerbaijani"
    },
    "name": "Azerbaijan",
    "region": "AS"
  },
  {
    "capital": "Nassau",
    "code": "BS",
    "currency": {
      "code": "BSD",
      "name": "Bahamian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/bhs.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Bahamas",
    "region": "NA"
  },
  {
    "capital": "Manama",
    "code": "BH",
    "currency": {
      "code": "BHD",
      "name": "Bahraini dinar",
      "symbol": ".د.ب"
    },
    "flag": "https://restcountries.eu/data/bhr.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Bahrain",
    "region": "AS"
  },
  {
    "capital": "Dhaka",
    "code": "BD",
    "currency": {
      "code": "BDT",
      "name": "Bangladeshi taka",
      "symbol": "৳"
    },
    "flag": "https://restcountries.eu/data/bgd.svg",
    "language": {
      "code": "bn",
      "name": "Bengali"
    },
    "name": "Bangladesh",
    "region": "AS"
  },
  {
    "capital": "Bridgetown",
    "code": "BB",
    "currency": {
      "code": "BBD",
      "name": "Barbadian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/brb.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Barbados",
    "region": "NA"
  },
  {
    "capital": "Minsk",
    "code": "BY",
    "currency": {
      "code": "BYN",
      "name": "New Belarusian ruble",
      "symbol": "Br"
    },
    "flag": "https://restcountries.eu/data/blr.svg",
    "language": {
      "code": "be",
      "name": "Belarusian"
    },
    "name": "Belarus",
    "region": "EU"
  },
  {
    "capital": "Brussels",
    "code": "BE",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/bel.svg",
    "language": {
      "code": "nl",
      "name": "Dutch"
    },
    "name": "Belgium",
    "region": "EU"
  },
  {
    "capital": "Belmopan",
    "code": "BZ",
    "currency": {
      "code": "BZD",
      "name": "Belize dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/blz.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Belize",
    "region": "NA"
  },
  {
    "capital": "Porto-Novo",
    "code": "BJ",
    "currency": {
      "code": "XOF",
      "name": "West African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/ben.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Benin",
    "region": "AF"
  },
  {
    "capital": "Hamilton",
    "code": "BM",
    "currency": {
      "code": "BMD",
      "name": "Bermudian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/bmu.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Bermuda",
    "region": "NA"
  },
  {
    "capital": "Thimphu",
    "code": "BT",
    "currency": {
      "code": "BTN",
      "name": "Bhutanese ngultrum",
      "symbol": "Nu."
    },
    "flag": "https://restcountries.eu/data/btn.svg",
    "language": {
      "code": "dz",
      "name": "Dzongkha"
    },
    "name": "Bhutan",
    "region": "AS"
  },
  {
    "capital": "Sucre",
    "code": "BO",
    "currency": {
      "code": "BOB",
      "name": "Bolivian boliviano",
      "symbol": "Bs."
    },
    "flag": "https://restcountries.eu/data/bol.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Bolivia (Plurinational State of)",
    "region": "SA"
  },
  {
    "capital": "Kralendijk",
    "code": "BQ",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/bes.svg",
    "language": {
      "code": "nl",
      "name": "Dutch"
    },
    "name": "Bonaire, Sint Eustatius and Saba",
    "region": "SA"
  },
  {
    "capital": "Sarajevo",
    "code": "BA",
    "currency": {
      "code": "BAM",
      "name": "Bosnia and Herzegovina convertible mark",
      "symbol": null
    },
    "flag": "https://restcountries.eu/data/bih.svg",
    "language": {
      "code": "bs",
      "name": "Bosnian"
    },
    "name": "Bosnia and Herzegovina",
    "region": "EU"
  },
  {
    "capital": "Gaborone",
    "code": "BW",
    "currency": {
      "code": "BWP",
      "name": "Botswana pula",
      "symbol": "P"
    },
    "flag": "https://restcountries.eu/data/bwa.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Botswana",
    "region": "AF"
  },
  {
    "capital": "",
    "code": "BV",
    "currency": {
      "code": "NOK",
      "name": "Norwegian krone",
      "symbol": "kr"
    },
    "flag": "https://restcountries.eu/data/bvt.svg",
    "language": {
      "code": "no",
      "name": "Norwegian"
    },
    "name": "Bouvet Island",
    "region": "AN"
  },
  {
    "capital": "Brasília",
    "code": "BR",
    "currency": {
      "code": "BRL",
      "name": "Brazilian real",
      "symbol": "R$"
    },
    "flag": "https://restcountries.eu/data/bra.svg",
    "language": {
      "code": "pt",
      "name": "Portuguese"
    },
    "name": "Brazil",
    "region": "SA"
  },
  {
    "capital": "Diego Garcia",
    "code": "IO",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/iot.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "British Indian Ocean Territory",
    "region": "AF"
  },
  {
    "capital": "",
    "code": "UM",
    "currency": {
      "code": "USD",
      "name": "United States Dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/umi.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "United States Minor Outlying Islands",
    "region": "NA"
  },
  {
    "capital": "Road Town",
    "code": "VG",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/vgb.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Virgin Islands (British)",
    "region": "NA"
  },
  {
    "capital": "Charlotte Amalie",
    "code": "VI",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/vir.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Virgin Islands (U.S.)",
    "region": "NA"
  },
  {
    "capital": "Bandar Seri Begawan",
    "code": "BN",
    "currency": {
      "code": "BND",
      "name": "Brunei dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/brn.svg",
    "language": {
      "code": "ms",
      "name": "Malay"
    },
    "name": "Brunei Darussalam",
    "region": "AS"
  },
  {
    "capital": "Sofia",
    "code": "BG",
    "currency": {
      "code": "BGN",
      "name": "Bulgarian lev",
      "symbol": "лв"
    },
    "flag": "https://restcountries.eu/data/bgr.svg",
    "language": {
      "code": "bg",
      "name": "Bulgarian"
    },
    "name": "Bulgaria",
    "region": "EU"
  },
  {
    "capital": "Ouagadougou",
    "code": "BF",
    "currency": {
      "code": "XOF",
      "name": "West African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/bfa.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Burkina Faso",
    "region": "AF"
  },
  {
    "capital": "Bujumbura",
    "code": "BI",
    "currency": {
      "code": "BIF",
      "name": "Burundian franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/bdi.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Burundi",
    "region": "AF"
  },
  {
    "capital": "Phnom Penh",
    "code": "KH",
    "currency": {
      "code": "KHR",
      "name": "Cambodian riel",
      "symbol": "៛"
    },
    "flag": "https://restcountries.eu/data/khm.svg",
    "language": {
      "code": "km",
      "name": "Khmer"
    },
    "name": "Cambodia",
    "region": "AS"
  },
  {
    "capital": "Yaoundé",
    "code": "CM",
    "currency": {
      "code": "XAF",
      "name": "Central African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/cmr.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Cameroon",
    "region": "AF"
  },
  {
    "capital": "Ottawa",
    "code": "CA",
    "currency": {
      "code": "CAD",
      "name": "Canadian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/can.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Canada",
    "region": "NA"
  },
  {
    "capital": "Praia",
    "code": "CV",
    "currency": {
      "code": "CVE",
      "name": "Cape Verdean escudo",
      "symbol": "Esc"
    },
    "flag": "https://restcountries.eu/data/cpv.svg",
    "language": {
      "code": "pt",
      "iso639_2": "por",
      "name": "Portuguese",
      "nativeName": "Português"
    },
    "name": "Cabo Verde",
    "region": "AF"
  },
  {
    "capital": "George Town",
    "code": "KY",
    "currency": {
      "code": "KYD",
      "name": "Cayman Islands dollar",
      "symbol": "$"
    },
    "demonym": "Caymanian",
    "flag": "https://restcountries.eu/data/cym.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Cayman Islands",
    "region": "NA"
  },
  {
    "capital": "Bangui",
    "code": "CF",
    "currency": {
      "code": "XAF",
      "name": "Central African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/caf.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Central African Republic",
    "region": "AF"
  },
  {
    "capital": "N'Djamena",
    "code": "TD",
    "currency": {
      "code": "XAF",
      "name": "Central African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/tcd.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Chad",
    "region": "AF"
  },
  {
    "capital": "Santiago",
    "code": "CL",
    "currency": {
      "code": "CLP",
      "name": "Chilean peso",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/chl.svg",
    "language": {
      "code": "es",
      "iso639_2": "spa",
      "name": "Spanish",
      "nativeName": "Español"
    },
    "name": "Chile",
    "region": "SA"
  },
  {
    "capital": "Beijing",
    "code": "CN",
    "currency": {
      "code": "CNY",
      "name": "Chinese yuan",
      "symbol": "¥"
    },
    "flag": "https://restcountries.eu/data/chn.svg",
    "language": {
      "code": "zh",
      "name": "Chinese"
    },
    "name": "China",
    "region": "AS"
  },
  {
    "capital": "Flying Fish Cove",
    "code": "CX",
    "currency": {
      "code": "AUD",
      "name": "Australian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/cxr.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Christmas Island",
    "region": "OC"
  },
  {
    "capital": "West Island",
    "code": "CC",
    "currency": {
      "code": "AUD",
      "name": "Australian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/cck.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Cocos (Keeling) Islands",
    "region": "OC"
  },
  {
    "capital": "Bogotá",
    "code": "CO",
    "currency": {
      "code": "COP",
      "name": "Colombian peso",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/col.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Colombia",
    "region": "SA"
  },
  {
    "capital": "Moroni",
    "code": "KM",
    "currency": {
      "code": "KMF",
      "name": "Comorian franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/com.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Comoros",
    "region": "AF"
  },
  {
    "capital": "Brazzaville",
    "code": "CG",
    "currency": {
      "code": "XAF",
      "name": "Central African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/cog.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Congo",
    "region": "AF"
  },
  {
    "capital": "Kinshasa",
    "code": "CD",
    "currency": {
      "code": "CDF",
      "name": "Congolese franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/cod.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Congo (Democratic Republic of the)",
    "region": "AF"
  },
  {
    "capital": "Avarua",
    "code": "CK",
    "currency": {
      "code": "NZD",
      "name": "New Zealand dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/cok.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Cook Islands",
    "region": "OC"
  },
  {
    "capital": "San José",
    "code": "CR",
    "currency": {
      "code": "CRC",
      "name": "Costa Rican colón",
      "symbol": "₡"
    },
    "flag": "https://restcountries.eu/data/cri.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Costa Rica",
    "region": "NA"
  },
  {
    "capital": "Zagreb",
    "code": "HR",
    "currency": {
      "code": "HRK",
      "name": "Croatian kuna",
      "symbol": "kn"
    },
    "flag": "https://restcountries.eu/data/hrv.svg",
    "language": {
      "code": "hr",
      "name": "Croatian"
    },
    "name": "Croatia",
    "region": "EU"
  },
  {
    "capital": "Havana",
    "code": "CU",
    "currency": {
      "code": "CUC",
      "name": "Cuban convertible peso",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/cub.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Cuba",
    "region": "NA"
  },
  {
    "capital": "Willemstad",
    "code": "CW",
    "currency": {
      "code": "ANG",
      "name": "Netherlands Antillean guilder",
      "symbol": "ƒ"
    },
    "flag": "https://restcountries.eu/data/cuw.svg",
    "language": {
      "code": "nl",
      "name": "Dutch"
    },
    "name": "Curaçao",
    "region": "SA"
  },
  {
    "capital": "Nicosia",
    "code": "CY",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/cyp.svg",
    "language": {
      "code": "tr",
      "name": "Turkish"
    },
    "name": "Cyprus",
    "region": "EU"
  },
  {
    "capital": "Prague",
    "code": "CZ",
    "currency": {
      "code": "CZK",
      "name": "Czech koruna",
      "symbol": "Kč"
    },
    "flag": "https://restcountries.eu/data/cze.svg",
    "language": {
      "code": "cs",
      "name": "Czech"
    },
    "name": "Czech Republic",
    "region": "EU"
  },
  {
    "capital": "Copenhagen",
    "code": "DK",
    "currency": {
      "code": "DKK",
      "name": "Danish krone",
      "symbol": "kr"
    },
    "flag": "https://restcountries.eu/data/dnk.svg",
    "language": {
      "code": "da",
      "name": "Danish"
    },
    "name": "Denmark",
    "region": "EU"
  },
  {
    "capital": "Djibouti",
    "code": "DJ",
    "currency": {
      "code": "DJF",
      "name": "Djiboutian franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/dji.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Djibouti",
    "region": "AF"
  },
  {
    "capital": "Roseau",
    "code": "DM",
    "currency": {
      "code": "XCD",
      "name": "East Caribbean dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/dma.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Dominica",
    "region": "NA"
  },
  {
    "capital": "Santo Domingo",
    "code": "DO",
    "currency": {
      "code": "DOP",
      "name": "Dominican peso",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/dom.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Dominican Republic",
    "region": "NA"
  },
  {
    "capital": "Quito",
    "code": "EC",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/ecu.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Ecuador",
    "region": "SA"
  },
  {
    "capital": "Cairo",
    "code": "EG",
    "currency": {
      "code": "EGP",
      "name": "Egyptian pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/egy.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Egypt",
    "region": "AF"
  },
  {
    "capital": "San Salvador",
    "code": "SV",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/slv.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "El Salvador",
    "region": "NA"
  },
  {
    "capital": "Malabo",
    "code": "GQ",
    "currency": {
      "code": "XAF",
      "name": "Central African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/gnq.svg",
    "language": {
      "code": "es",
      "iso639_2": "spa",
      "name": "Spanish",
      "nativeName": "Español"
    },
    "name": "Equatorial Guinea",
    "region": "AF"
  },
  {
    "capital": "Asmara",
    "code": "ER",
    "currency": {
      "code": "ERN",
      "name": "Eritrean nakfa",
      "symbol": "Nfk"
    },
    "flag": "https://restcountries.eu/data/eri.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Eritrea",
    "region": "AF"
  },
  {
    "capital": "Tallinn",
    "code": "EE",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/est.svg",
    "language": {
      "code": "et",
      "name": "Estonian"
    },
    "name": "Estonia",
    "region": "EU"
  },
  {
    "capital": "Addis Ababa",
    "code": "ET",
    "currency": {
      "code": "ETB",
      "name": "Ethiopian birr",
      "symbol": "Br"
    },
    "flag": "https://restcountries.eu/data/eth.svg",
    "language": {
      "code": "am",
      "name": "Amharic"
    },
    "name": "Ethiopia",
    "region": "AF"
  },
  {
    "capital": "Stanley",
    "code": "FK",
    "currency": {
      "code": "FKP",
      "name": "Falkland Islands pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/flk.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Falkland Islands (Malvinas)",
    "region": "SA"
  },
  {
    "capital": "Tórshavn",
    "code": "FO",
    "currency": {
      "code": "DKK",
      "name": "Danish krone",
      "symbol": "kr"
    },
    "flag": "https://restcountries.eu/data/fro.svg",
    "language": {
      "code": "fo",
      "name": "Faroese"
    },
    "name": "Faroe Islands",
    "region": "EU"
  },
  {
    "capital": "Suva",
    "code": "FJ",
    "currency": {
      "code": "FJD",
      "name": "Fijian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/fji.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Fiji",
    "region": "OC"
  },
  {
    "capital": "Helsinki",
    "code": "FI",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/fin.svg",
    "language": {
      "code": "fi",
      "iso639_2": "fin",
      "name": "Finnish",
      "nativeName": "suomi"
    },
    "name": "Finland",
    "region": "EU"
  },
  {
    "capital": "Paris",
    "code": "FR",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "demonym": "French",
    "flag": "https://restcountries.eu/data/fra.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "France",
    "region": "EU"
  },
  {
    "capital": "Cayenne",
    "code": "GF",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/guf.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "French Guiana",
    "region": "SA"
  },
  {
    "capital": "Papeetē",
    "code": "PF",
    "currency": {
      "code": "XPF",
      "name": "CFP franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/pyf.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "French Polynesia",
    "region": "OC"
  },
  {
    "capital": "Port-aux-Français",
    "code": "TF",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/atf.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "French Southern Territories",
    "region": "AF"
  },
  {
    "capital": "Libreville",
    "code": "GA",
    "currency": {
      "code": "XAF",
      "name": "Central African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/gab.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Gabon",
    "region": "AF"
  },
  {
    "capital": "Banjul",
    "code": "GM",
    "currency": {
      "code": "GMD",
      "name": "Gambian dalasi",
      "symbol": "D"
    },
    "flag": "https://restcountries.eu/data/gmb.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Gambia",
    "region": "AF"
  },
  {
    "capital": "Tbilisi",
    "code": "GE",
    "currency": {
      "code": "GEL",
      "name": "Georgian Lari",
      "symbol": "ლ"
    },
    "flag": "https://restcountries.eu/data/geo.svg",
    "language": {
      "code": "ka",
      "name": "Georgian"
    },
    "name": "Georgia",
    "region": "AS"
  },
  {
    "capital": "Berlin",
    "code": "DE",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/deu.svg",
    "language": {
      "code": "de",
      "name": "German"
    },
    "name": "Germany",
    "region": "EU"
  },
  {
    "capital": "Accra",
    "code": "GH",
    "currency": {
      "code": "GHS",
      "name": "Ghanaian cedi",
      "symbol": "₵"
    },
    "flag": "https://restcountries.eu/data/gha.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Ghana",
    "region": "AF"
  },
  {
    "capital": "Gibraltar",
    "code": "GI",
    "currency": {
      "code": "GIP",
      "name": "Gibraltar pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/gib.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Gibraltar",
    "region": "EU"
  },
  {
    "capital": "Athens",
    "code": "GR",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/grc.svg",
    "language": {
      "code": "el",
      "name": "Greek (modern)"
    },
    "name": "Greece",
    "region": "EU"
  },
  {
    "capital": "Nuuk",
    "code": "GL",
    "currency": {
      "code": "DKK",
      "name": "Danish krone",
      "symbol": "kr"
    },
    "flag": "https://restcountries.eu/data/grl.svg",
    "language": {
      "code": "kl",
      "name": "Kalaallisut"
    },
    "name": "Greenland",
    "region": "NA"
  },
  {
    "capital": "St. George's",
    "code": "GD",
    "currency": {
      "code": "XCD",
      "name": "East Caribbean dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/grd.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Grenada",
    "region": "NA"
  },
  {
    "capital": "Basse-Terre",
    "code": "GP",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/glp.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Guadeloupe",
    "region": "NA"
  },
  {
    "capital": "Hagåtña",
    "code": "GU",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/gum.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Guam",
    "region": "OC"
  },
  {
    "capital": "Guatemala City",
    "code": "GT",
    "currency": {
      "code": "GTQ",
      "name": "Guatemalan quetzal",
      "symbol": "Q"
    },
    "flag": "https://restcountries.eu/data/gtm.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Guatemala",
    "region": "NA"
  },
  {
    "capital": "St. Peter Port",
    "code": "GG",
    "currency": {
      "code": "GBP",
      "name": "British pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/ggy.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Guernsey",
    "region": "EU"
  },
  {
    "capital": "Conakry",
    "code": "GN",
    "currency": {
      "code": "GNF",
      "name": "Guinean franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/gin.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Guinea",
    "region": "AF"
  },
  {
    "capital": "Bissau",
    "code": "GW",
    "currency": {
      "code": "XOF",
      "name": "West African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/gnb.svg",
    "language": {
      "code": "pt",
      "name": "Portuguese"
    },
    "name": "Guinea-Bissau",
    "region": "AF"
  },
  {
    "capital": "Georgetown",
    "code": "GY",
    "currency": {
      "code": "GYD",
      "name": "Guyanese dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/guy.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Guyana",
    "region": "SA"
  },
  {
    "capital": "Port-au-Prince",
    "code": "HT",
    "currency": {
      "code": "HTG",
      "name": "Haitian gourde",
      "symbol": "G"
    },
    "flag": "https://restcountries.eu/data/hti.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Haiti",
    "region": "Americas"
  },
  {
    "capital": "",
    "code": "HM",
    "currency": {
      "code": "AUD",
      "name": "Australian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/hmd.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Heard Island and McDonald Islands",
    "region": ""
  },
  {
    "capital": "Rome",
    "code": "VA",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/vat.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Holy See",
    "region": "EU"
  },
  {
    "capital": "Tegucigalpa",
    "code": "HN",
    "currency": {
      "code": "HNL",
      "name": "Honduran lempira",
      "symbol": "L"
    },
    "flag": "https://restcountries.eu/data/hnd.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Honduras",
    "region": "NA"
  },
  {
    "capital": "City of Victoria",
    "code": "HK",
    "currency": {
      "code": "HKD",
      "name": "Hong Kong dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/hkg.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Hong Kong",
    "region": "AS"
  },
  {
    "capital": "Budapest",
    "code": "HU",
    "currency": {
      "code": "HUF",
      "name": "Hungarian forint",
      "symbol": "Ft"
    },
    "flag": "https://restcountries.eu/data/hun.svg",
    "language": {
      "code": "hu",
      "name": "Hungarian"
    },
    "name": "Hungary",
    "region": "EU"
  },
  {
    "capital": "Reykjavík",
    "code": "IS",
    "currency": {
      "code": "ISK",
      "name": "Icelandic króna",
      "symbol": "kr"
    },
    "flag": "https://restcountries.eu/data/isl.svg",
    "language": {
      "code": "is",
      "name": "Icelandic"
    },
    "name": "Iceland",
    "region": "EU"
  },
  {
    "capital": "New Delhi",
    "code": "IN",
    "currency": {
      "code": "INR",
      "name": "Indian rupee",
      "symbol": "₹"
    },
    "flag": "https://restcountries.eu/data/ind.svg",
    "language": {
      "code": "hi",
      "name": "Hindi"
    },
    "name": "India",
    "region": "AS"
  },
  {
    "capital": "Jakarta",
    "code": "ID",
    "currency": {
      "code": "IDR",
      "name": "Indonesian rupiah",
      "symbol": "Rp"
    },
    "flag": "https://restcountries.eu/data/idn.svg",
    "language": {
      "code": "id",
      "name": "Indonesian"
    },
    "name": "Indonesia",
    "region": "AS"
  },
  {
    "capital": "Yamoussoukro",
    "code": "CI",
    "currency": {
      "code": "XOF",
      "name": "West African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/civ.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Côte d'Ivoire",
    "region": "AF"
  },
  {
    "capital": "Tehran",
    "code": "IR",
    "currency": {
      "code": "IRR",
      "name": "Iranian rial",
      "symbol": "﷼"
    },
    "flag": "https://restcountries.eu/data/irn.svg",
    "language": {
      "code": "fa",
      "name": "Persian (Farsi)"
    },
    "name": "Iran (Islamic Republic of)",
    "region": "AS"
  },
  {
    "capital": "Baghdad",
    "code": "IQ",
    "currency": {
      "code": "IQD",
      "name": "Iraqi dinar",
      "symbol": "ع.د"
    },
    "flag": "https://restcountries.eu/data/irq.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Iraq",
    "region": "AS"
  },
  {
    "capital": "Dublin",
    "code": "IE",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/irl.svg",
    "language": {
      "code": "ga",
      "name": "Irish"
    },
    "name": "Ireland",
    "region": "EU"
  },
  {
    "capital": "Douglas",
    "code": "IM",
    "currency": {
      "code": "GBP",
      "name": "British pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/imn.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Isle of Man",
    "region": "EU"
  },
  {
    "capital": "Jerusalem",
    "code": "IL",
    "currency": {
      "code": "ILS",
      "name": "Israeli new shekel",
      "symbol": "₪"
    },
    "flag": "https://restcountries.eu/data/isr.svg",
    "language": {
      "code": "he",
      "name": "Hebrew (modern)"
    },
    "name": "Israel",
    "region": "AS"
  },
  {
    "capital": "Rome",
    "code": "IT",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/ita.svg",
    "language": {
      "code": "it",
      "name": "Italian"
    },
    "name": "Italy",
    "region": "EU"
  },
  {
    "capital": "Kingston",
    "code": "JM",
    "currency": {
      "code": "JMD",
      "name": "Jamaican dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/jam.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Jamaica",
    "region": "NA"
  },
  {
    "capital": "Tokyo",
    "code": "JP",
    "currency": {
      "code": "JPY",
      "name": "Japanese yen",
      "symbol": "¥"
    },
    "flag": "https://restcountries.eu/data/jpn.svg",
    "language": {
      "code": "ja",
      "name": "Japanese"
    },
    "name": "Japan",
    "region": "AS"
  },
  {
    "capital": "Saint Helier",
    "code": "JE",
    "currency": {
      "code": "GBP",
      "name": "British pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/jey.svg",
    "language": {
      "code": "en",
      "iso639_2": "eng",
      "name": "English",
      "nativeName": "English"
    },
    "name": "Jersey",
    "region": "EU"
  },
  {
    "capital": "Amman",
    "code": "JO",
    "currency": {
      "code": "JOD",
      "name": "Jordanian dinar",
      "symbol": "د.ا"
    },
    "flag": "https://restcountries.eu/data/jor.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Jordan",
    "region": "AS"
  },
  {
    "capital": "Astana",
    "code": "KZ",
    "currency": {
      "code": "KZT",
      "name": "Kazakhstani tenge",
      "symbol": null
    },
    "flag": "https://restcountries.eu/data/kaz.svg",
    "language": {
      "code": "kk",
      "name": "Kazakh"
    },
    "name": "Kazakhstan",
    "region": "AS"
  },
  {
    "capital": "Nairobi",
    "code": "KE",
    "currency": {
      "code": "KES",
      "name": "Kenyan shilling",
      "symbol": "Sh"
    },
    "flag": "https://restcountries.eu/data/ken.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Kenya",
    "region": "AF"
  },
  {
    "capital": "South Tarawa",
    "code": "KI",
    "currency": {
      "code": "AUD",
      "name": "Australian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/kir.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Kiribati",
    "region": "OC"
  },
  {
    "capital": "Kuwait City",
    "code": "KW",
    "currency": {
      "code": "KWD",
      "name": "Kuwaiti dinar",
      "symbol": "د.ك"
    },
    "flag": "https://restcountries.eu/data/kwt.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Kuwait",
    "region": "AS"
  },
  {
    "capital": "Bishkek",
    "code": "KG",
    "currency": {
      "code": "KGS",
      "name": "Kyrgyzstani som",
      "symbol": "с"
    },
    "flag": "https://restcountries.eu/data/kgz.svg",
    "language": {
      "code": "ky",
      "name": "Kyrgyz"
    },
    "name": "Kyrgyzstan",
    "region": "AS"
  },
  {
    "capital": "Vientiane",
    "code": "LA",
    "currency": {
      "code": "LAK",
      "name": "Lao kip",
      "symbol": "₭"
    },
    "flag": "https://restcountries.eu/data/lao.svg",
    "language": {
      "code": "lo",
      "name": "Lao"
    },
    "name": "Lao People's Democratic Republic",
    "region": "AS"
  },
  {
    "capital": "Riga",
    "code": "LV",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/lva.svg",
    "language": {
      "code": "lv",
      "name": "Latvian"
    },
    "name": "Latvia",
    "region": "EU"
  },
  {
    "capital": "Beirut",
    "code": "LB",
    "currency": {
      "code": "LBP",
      "name": "Lebanese pound",
      "symbol": "ل.ل"
    },
    "flag": "https://restcountries.eu/data/lbn.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Lebanon",
    "region": "AS"
  },
  {
    "capital": "Maseru",
    "code": "LS",
    "currency": {
      "code": "LSL",
      "name": "Lesotho loti",
      "symbol": "L"
    },
    "flag": "https://restcountries.eu/data/lso.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Lesotho",
    "region": "AF"
  },
  {
    "capital": "Monrovia",
    "code": "LR",
    "currency": {
      "code": "LRD",
      "name": "Liberian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/lbr.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Liberia",
    "region": "AF"
  },
  {
    "capital": "Tripoli",
    "code": "LY",
    "currency": {
      "code": "LYD",
      "name": "Libyan dinar",
      "symbol": "ل.د"
    },
    "flag": "https://restcountries.eu/data/lby.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Libya",
    "region": "AF"
  },
  {
    "capital": "Vaduz",
    "code": "LI",
    "currency": {
      "code": "CHF",
      "name": "Swiss franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/lie.svg",
    "language": {
      "code": "de",
      "name": "German"
    },
    "name": "Liechtenstein",
    "region": "EU"
  },
  {
    "capital": "Vilnius",
    "code": "LT",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/ltu.svg",
    "language": {
      "code": "lt",
      "name": "Lithuanian"
    },
    "name": "Lithuania",
    "region": "EU"
  },
  {
    "capital": "Luxembourg",
    "code": "LU",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/lux.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Luxembourg",
    "region": "EU"
  },
  {
    "capital": "",
    "code": "MO",
    "currency": {
      "code": "MOP",
      "name": "Macanese pataca",
      "symbol": "P"
    },
    "flag": "https://restcountries.eu/data/mac.svg",
    "language": {
      "code": "zh",
      "name": "Chinese"
    },
    "name": "Macao",
    "region": "AS"
  },
  {
    "capital": "Skopje",
    "code": "MK",
    "currency": {
      "code": "MKD",
      "name": "Macedonian denar",
      "symbol": "ден"
    },
    "flag": "https://restcountries.eu/data/mkd.svg",
    "language": {
      "code": "mk",
      "name": "Macedonian"
    },
    "name": "Macedonia (the former Yugoslav Republic of)",
    "region": "EU"
  },
  {
    "capital": "Antananarivo",
    "code": "MG",
    "currency": {
      "code": "MGA",
      "name": "Malagasy ariary",
      "symbol": "Ar"
    },
    "flag": "https://restcountries.eu/data/mdg.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Madagascar",
    "region": "AF"
  },
  {
    "capital": "Lilongwe",
    "code": "MW",
    "currency": {
      "code": "MWK",
      "name": "Malawian kwacha",
      "symbol": "MK"
    },
    "flag": "https://restcountries.eu/data/mwi.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Malawi",
    "region": "AF"
  },
  {
    "capital": "Kuala Lumpur",
    "code": "MY",
    "currency": {
      "code": "MYR",
      "name": "Malaysian ringgit",
      "symbol": "RM"
    },
    "flag": "https://restcountries.eu/data/mys.svg",
    "language": {
      "code": null,
      "name": "Malaysian"
    },
    "name": "Malaysia",
    "region": "AS"
  },
  {
    "capital": "Malé",
    "code": "MV",
    "currency": {
      "code": "MVR",
      "name": "Maldivian rufiyaa",
      "symbol": ".ރ"
    },
    "flag": "https://restcountries.eu/data/mdv.svg",
    "language": {
      "code": "dv",
      "name": "Divehi"
    },
    "name": "Maldives",
    "region": "AS"
  },
  {
    "capital": "Bamako",
    "code": "ML",
    "currency": {
      "code": "XOF",
      "name": "West African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/mli.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Mali",
    "region": "AF"
  },
  {
    "capital": "Valletta",
    "code": "MT",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/mlt.svg",
    "language": {
      "code": "mt",
      "name": "Maltese"
    },
    "name": "Malta",
    "region": "EU"
  },
  {
    "capital": "Majuro",
    "code": "MH",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/mhl.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Marshall Islands",
    "region": "OC"
  },
  {
    "capital": "Fort-de-France",
    "code": "MQ",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/mtq.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Martinique",
    "region": "Americas"
  },
  {
    "capital": "Nouakchott",
    "code": "MR",
    "currency": {
      "code": "MRO",
      "name": "Mauritanian ouguiya",
      "symbol": "UM"
    },
    "flag": "https://restcountries.eu/data/mrt.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Mauritania",
    "region": "AF"
  },
  {
    "capital": "Port Louis",
    "code": "MU",
    "currency": {
      "code": "MUR",
      "name": "Mauritian rupee",
      "symbol": "₨"
    },
    "flag": "https://restcountries.eu/data/mus.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Mauritius",
    "region": "AF"
  },
  {
    "capital": "Mamoudzou",
    "code": "YT",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/myt.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Mayotte",
    "region": "AF"
  },
  {
    "capital": "Mexico City",
    "code": "MX",
    "currency": {
      "code": "MXN",
      "name": "Mexican peso",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/mex.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Mexico",
    "region": "NA"
  },
  {
    "capital": "Palikir",
    "code": "FM",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/fsm.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Micronesia (Federated States of)",
    "region": "OC"
  },
  {
    "capital": "Chișinău",
    "code": "MD",
    "currency": {
      "code": "MDL",
      "name": "Moldovan leu",
      "symbol": "L"
    },
    "flag": "https://restcountries.eu/data/mda.svg",
    "language": {
      "code": "ro",
      "name": "Romanian"
    },
    "name": "Moldova (Republic of)",
    "region": "EU"
  },
  {
    "capital": "Monaco",
    "code": "MC",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/mco.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Monaco",
    "region": "EU"
  },
  {
    "capital": "Ulan Bator",
    "code": "MN",
    "currency": {
      "code": "MNT",
      "name": "Mongolian tögrög",
      "symbol": "₮"
    },
    "flag": "https://restcountries.eu/data/mng.svg",
    "language": {
      "code": "mn",
      "name": "Mongolian"
    },
    "name": "Mongolia",
    "region": "AS"
  },
  {
    "capital": "Podgorica",
    "code": "ME",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/mne.svg",
    "language": {
      "code": "sr",
      "name": "Serbian"
    },
    "name": "Montenegro",
    "region": "EU"
  },
  {
    "capital": "Plymouth",
    "code": "MS",
    "currency": {
      "code": "XCD",
      "name": "East Caribbean dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/msr.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Montserrat",
    "region": "NA"
  },
  {
    "capital": "Rabat",
    "code": "MA",
    "currency": {
      "code": "MAD",
      "name": "Moroccan dirham",
      "symbol": "د.م."
    },
    "flag": "https://restcountries.eu/data/mar.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Morocco",
    "region": "AF"
  },
  {
    "capital": "Maputo",
    "code": "MZ",
    "currency": {
      "code": "MZN",
      "name": "Mozambican metical",
      "symbol": "MT"
    },
    "flag": "https://restcountries.eu/data/moz.svg",
    "language": {
      "code": "pt",
      "name": "Portuguese"
    },
    "name": "Mozambique",
    "region": "AF"
  },
  {
    "capital": "Naypyidaw",
    "code": "MM",
    "currency": {
      "code": "MMK",
      "name": "Burmese kyat",
      "symbol": "Ks"
    },
    "flag": "https://restcountries.eu/data/mmr.svg",
    "language": {
      "code": "my",
      "name": "Burmese"
    },
    "name": "Myanmar",
    "region": "AS"
  },
  {
    "capital": "Windhoek",
    "code": "NA",
    "currency": {
      "code": "NAD",
      "name": "Namibian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/nam.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Namibia",
    "region": "AF"
  },
  {
    "capital": "Yaren",
    "code": "NR",
    "currency": {
      "code": "AUD",
      "name": "Australian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/nru.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Nauru",
    "region": "OC"
  },
  {
    "capital": "Kathmandu",
    "code": "NP",
    "currency": {
      "code": "NPR",
      "name": "Nepalese rupee",
      "symbol": "₨"
    },
    "flag": "https://restcountries.eu/data/npl.svg",
    "language": {
      "code": "ne",
      "name": "Nepali"
    },
    "name": "Nepal",
    "region": "AS"
  },
  {
    "capital": "Amsterdam",
    "code": "NL",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/nld.svg",
    "language": {
      "code": "nl",
      "name": "Dutch"
    },
    "name": "Netherlands",
    "region": "EU"
  },
  {
    "capital": "Nouméa",
    "code": "NC",
    "currency": {
      "code": "XPF",
      "name": "CFP franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/ncl.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "New Caledonia",
    "region": "OC"
  },
  {
    "capital": "Wellington",
    "code": "NZ",
    "currency": {
      "code": "NZD",
      "name": "New Zealand dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/nzl.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "New Zealand",
    "region": "OC"
  },
  {
    "capital": "Managua",
    "code": "NI",
    "currency": {
      "code": "NIO",
      "name": "Nicaraguan córdoba",
      "symbol": "C$"
    },
    "flag": "https://restcountries.eu/data/nic.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Nicaragua",
    "region": "NA"
  },
  {
    "capital": "Niamey",
    "code": "NE",
    "currency": {
      "code": "XOF",
      "name": "West African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/ner.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Niger",
    "region": "AF"
  },
  {
    "capital": "Abuja",
    "code": "NG",
    "currency": {
      "code": "NGN",
      "name": "Nigerian naira",
      "symbol": "₦"
    },
    "flag": "https://restcountries.eu/data/nga.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Nigeria",
    "region": "AF"
  },
  {
    "capital": "Alofi",
    "code": "NU",
    "currency": {
      "code": "NZD",
      "name": "New Zealand dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/niu.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Niue",
    "region": "OC"
  },
  {
    "capital": "Kingston",
    "code": "NF",
    "currency": {
      "code": "AUD",
      "name": "Australian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/nfk.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Norfolk Island",
    "region": "OC"
  },
  {
    "capital": "Pyongyang",
    "code": "KP",
    "currency": {
      "code": "KPW",
      "name": "North Korean won",
      "symbol": "₩"
    },
    "flag": "https://restcountries.eu/data/prk.svg",
    "language": {
      "code": "ko",
      "name": "Korean"
    },
    "name": "Korea (Democratic People's Republic of)",
    "region": "AS"
  },
  {
    "capital": "Saipan",
    "code": "MP",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/mnp.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Northern Mariana Islands",
    "region": "OC"
  },
  {
    "capital": "Oslo",
    "code": "NO",
    "currency": {
      "code": "NOK",
      "name": "Norwegian krone",
      "symbol": "kr"
    },
    "flag": "https://restcountries.eu/data/nor.svg",
    "language": {
      "code": "no",
      "name": "Norwegian"
    },
    "name": "Norway",
    "region": "EU"
  },
  {
    "capital": "Muscat",
    "code": "OM",
    "currency": {
      "code": "OMR",
      "name": "Omani rial",
      "symbol": "ر.ع."
    },
    "flag": "https://restcountries.eu/data/omn.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Oman",
    "region": "AS"
  },
  {
    "capital": "Islamabad",
    "code": "PK",
    "currency": {
      "code": "PKR",
      "name": "Pakistani rupee",
      "symbol": "₨"
    },
    "flag": "https://restcountries.eu/data/pak.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Pakistan",
    "region": "AS"
  },
  {
    "capital": "Ngerulmud",
    "code": "PW",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/plw.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Palau",
    "region": "OC"
  },
  {
    "capital": "Ramallah",
    "code": "PS",
    "currency": {
      "code": "ILS",
      "name": "Israeli new sheqel",
      "symbol": "₪"
    },
    "flag": "https://restcountries.eu/data/pse.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Palestine, State of",
    "region": "AS"
  },
  {
    "capital": "Panama City",
    "code": "PA",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/pan.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Panama",
    "region": "NA"
  },
  {
    "capital": "Port Moresby",
    "code": "PG",
    "currency": {
      "code": "PGK",
      "name": "Papua New Guinean kina",
      "symbol": "K"
    },
    "flag": "https://restcountries.eu/data/png.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Papua New Guinea",
    "region": "OC"
  },
  {
    "capital": "Asunción",
    "code": "PY",
    "currency": {
      "code": "PYG",
      "name": "Paraguayan guaraní",
      "symbol": "₲"
    },
    "flag": "https://restcountries.eu/data/pry.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Paraguay",
    "region": "SA"
  },
  {
    "capital": "Lima",
    "code": "PE",
    "currency": {
      "code": "PEN",
      "name": "Peruvian sol",
      "symbol": "S/."
    },
    "flag": "https://restcountries.eu/data/per.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Peru",
    "region": "SA"
  },
  {
    "capital": "Manila",
    "code": "PH",
    "currency": {
      "code": "PHP",
      "name": "Philippine peso",
      "symbol": "₱"
    },
    "flag": "https://restcountries.eu/data/phl.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Philippines",
    "region": "AS"
  },
  {
    "capital": "Adamstown",
    "code": "PN",
    "currency": {
      "code": "NZD",
      "name": "New Zealand dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/pcn.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Pitcairn",
    "region": "OC"
  },
  {
    "capital": "Warsaw",
    "code": "PL",
    "currency": {
      "code": "PLN",
      "name": "Polish złoty",
      "symbol": "zł"
    },
    "flag": "https://restcountries.eu/data/pol.svg",
    "language": {
      "code": "pl",
      "name": "Polish"
    },
    "name": "Poland",
    "region": "EU"
  },
  {
    "capital": "Lisbon",
    "code": "PT",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/prt.svg",
    "language": {
      "code": "pt",
      "name": "Portuguese"
    },
    "name": "Portugal",
    "region": "EU"
  },
  {
    "capital": "San Juan",
    "code": "PR",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/pri.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Puerto Rico",
    "region": "NA"
  },
  {
    "capital": "Doha",
    "code": "QA",
    "currency": {
      "code": "QAR",
      "name": "Qatari riyal",
      "symbol": "ر.ق"
    },
    "flag": "https://restcountries.eu/data/qat.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Qatar",
    "region": "AS"
  },
  {
    "capital": "Pristina",
    "code": "XK",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/kos.svg",
    "language": {
      "code": "sq",
      "name": "Albanian"
    },
    "name": "Republic of Kosovo",
    "region": "EU"
  },
  {
    "capital": "Saint-Denis",
    "code": "RE",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/reu.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Réunion",
    "region": "AF"
  },
  {
    "capital": "Bucharest",
    "code": "RO",
    "currency": {
      "code": "RON",
      "name": "Romanian leu",
      "symbol": "lei"
    },
    "flag": "https://restcountries.eu/data/rou.svg",
    "language": {
      "code": "ro",
      "name": "Romanian"
    },
    "name": "Romania",
    "region": "EU"
  },
  {
    "capital": "Moscow",
    "code": "RU",
    "currency": {
      "code": "RUB",
      "name": "Russian ruble",
      "symbol": "₽"
    },
    "flag": "https://restcountries.eu/data/rus.svg",
    "language": {
      "code": "ru",
      "name": "Russian"
    },
    "name": "Russian Federation",
    "region": "EU"
  },
  {
    "capital": "Kigali",
    "code": "RW",
    "currency": {
      "code": "RWF",
      "name": "Rwandan franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/rwa.svg",
    "language": {
      "code": "rw",
      "name": "Kinyarwanda"
    },
    "name": "Rwanda",
    "region": "AF"
  },
  {
    "capital": "Gustavia",
    "code": "BL",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/blm.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Saint Barthélemy",
    "region": "NA"
  },
  {
    "capital": "Jamestown",
    "code": "SH",
    "currency": {
      "code": "SHP",
      "name": "Saint Helena pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/shn.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Saint Helena, Ascension and Tristan da Cunha",
    "region": "AF"
  },
  {
    "capital": "Basseterre",
    "code": "KN",
    "currency": {
      "code": "XCD",
      "name": "East Caribbean dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/kna.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Saint Kitts and Nevis",
    "region": "NA"
  },
  {
    "capital": "Castries",
    "code": "LC",
    "currency": {
      "code": "XCD",
      "name": "East Caribbean dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/lca.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Saint Lucia",
    "region": "NA"
  },
  {
    "capital": "Marigot",
    "code": "MF",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/maf.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Saint Martin (French part)",
    "region": "NA"
  },
  {
    "capital": "Saint-Pierre",
    "code": "PM",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/spm.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Saint Pierre and Miquelon",
    "region": "NA"
  },
  {
    "capital": "Kingstown",
    "code": "VC",
    "currency": {
      "code": "XCD",
      "name": "East Caribbean dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/vct.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Saint Vincent and the Grenadines",
    "region": "NA"
  },
  {
    "capital": "Apia",
    "code": "WS",
    "currency": {
      "code": "WST",
      "name": "Samoan tālā",
      "symbol": "T"
    },
    "flag": "https://restcountries.eu/data/wsm.svg",
    "language": {
      "code": "sm",
      "name": "Samoan"
    },
    "name": "Samoa",
    "region": "OC"
  },
  {
    "capital": "City of San Marino",
    "code": "SM",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/smr.svg",
    "language": {
      "code": "it",
      "name": "Italian"
    },
    "name": "San Marino",
    "region": "EU"
  },
  {
    "capital": "São Tomé",
    "code": "ST",
    "currency": {
      "code": "STD",
      "name": "São Tomé and Príncipe dobra",
      "symbol": "Db"
    },
    "flag": "https://restcountries.eu/data/stp.svg",
    "language": {
      "code": "pt",
      "name": "Portuguese"
    },
    "name": "Sao Tome and Principe",
    "region": "AF"
  },
  {
    "capital": "Riyadh",
    "code": "SA",
    "currency": {
      "code": "SAR",
      "name": "Saudi riyal",
      "symbol": "ر.س"
    },
    "flag": "https://restcountries.eu/data/sau.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Saudi Arabia",
    "region": "AS"
  },
  {
    "capital": "Dakar",
    "code": "SN",
    "currency": {
      "code": "XOF",
      "name": "West African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/sen.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Senegal",
    "region": "AF"
  },
  {
    "capital": "Belgrade",
    "code": "RS",
    "currency": {
      "code": "RSD",
      "name": "Serbian dinar",
      "symbol": "дин."
    },
    "flag": "https://restcountries.eu/data/srb.svg",
    "language": {
      "code": "sr",
      "name": "Serbian"
    },
    "name": "Serbia",
    "region": "EU"
  },
  {
    "capital": "Victoria",
    "code": "SC",
    "currency": {
      "code": "SCR",
      "name": "Seychellois rupee",
      "symbol": "₨"
    },
    "flag": "https://restcountries.eu/data/syc.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Seychelles",
    "region": "AF"
  },
  {
    "capital": "Freetown",
    "code": "SL",
    "currency": {
      "code": "SLL",
      "name": "Sierra Leonean leone",
      "symbol": "Le"
    },
    "flag": "https://restcountries.eu/data/sle.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Sierra Leone",
    "region": "AF"
  },
  {
    "capital": "Singapore",
    "code": "SG",
    "currency": {
      "code": "SGD",
      "name": "Singapore dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/sgp.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Singapore",
    "region": "AS"
  },
  {
    "capital": "Philipsburg",
    "code": "SX",
    "currency": {
      "code": "ANG",
      "name": "Netherlands Antillean guilder",
      "symbol": "ƒ"
    },
    "flag": "https://restcountries.eu/data/sxm.svg",
    "language": {
      "code": "nl",
      "name": "Dutch"
    },
    "name": "Sint Maarten (Dutch part)",
    "region": "Americas"
  },
  {
    "capital": "Bratislava",
    "code": "SK",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/svk.svg",
    "language": {
      "code": "sk",
      "name": "Slovak"
    },
    "name": "Slovakia",
    "region": "EU"
  },
  {
    "capital": "Ljubljana",
    "code": "SI",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/svn.svg",
    "language": {
      "code": "sl",
      "name": "Slovene"
    },
    "name": "Slovenia",
    "region": "EU"
  },
  {
    "capital": "Honiara",
    "code": "SB",
    "currency": {
      "code": "SBD",
      "name": "Solomon Islands dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/slb.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Solomon Islands",
    "region": "OC"
  },
  {
    "capital": "Mogadishu",
    "code": "SO",
    "currency": {
      "code": "SOS",
      "name": "Somali shilling",
      "symbol": "Sh"
    },
    "flag": "https://restcountries.eu/data/som.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Somalia",
    "region": "AF"
  },
  {
    "capital": "Pretoria",
    "code": "ZA",
    "currency": {
      "code": "ZAR",
      "name": "South African rand",
      "symbol": "R"
    },
    "flag": "https://restcountries.eu/data/zaf.svg",
    "language": {
      "code": "en",
      "iso639_2": "eng",
      "name": "English",
      "nativeName": "English"
    },
    "name": "South Africa",
    "region": "AF"
  },
  {
    "capital": "King Edward Point",
    "code": "GS",
    "currency": {
      "code": "GBP",
      "name": "British pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/sgs.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "South Georgia and the South Sandwich Islands",
    "region": "NA"
  },
  {
    "capital": "Seoul",
    "code": "KR",
    "currency": {
      "code": "KRW",
      "name": "South Korean won",
      "symbol": "₩"
    },
    "flag": "https://restcountries.eu/data/kor.svg",
    "language": {
      "code": "ko",
      "name": "Korean"
    },
    "name": "Korea (Republic of)",
    "region": "AS"
  },
  {
    "capital": "Juba",
    "code": "SS",
    "currency": {
      "code": "SSP",
      "name": "South Sudanese pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/ssd.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "South Sudan",
    "region": "AF"
  },
  {
    "capital": "Madrid",
    "code": "ES",
    "currency": {
      "code": "EUR",
      "name": "Euro",
      "symbol": "€"
    },
    "flag": "https://restcountries.eu/data/esp.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Spain",
    "region": "EU"
  },
  {
    "capital": "Colombo",
    "code": "LK",
    "currency": {
      "code": "LKR",
      "name": "Sri Lankan rupee",
      "symbol": "Rs"
    },
    "flag": "https://restcountries.eu/data/lka.svg",
    "language": {
      "code": "si",
      "iso639_2": "sin",
      "name": "Sinhalese",
      "nativeName": "සිංහල"
    },
    "name": "Sri Lanka",
    "region": "AS"
  },
  {
    "capital": "Khartoum",
    "code": "SD",
    "currency": {
      "code": "SDG",
      "name": "Sudanese pound",
      "symbol": "ج.س."
    },
    "flag": "https://restcountries.eu/data/sdn.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Sudan",
    "region": "AF"
  },
  {
    "capital": "Paramaribo",
    "code": "SR",
    "currency": {
      "code": "SRD",
      "name": "Surinamese dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/sur.svg",
    "language": {
      "code": "nl",
      "name": "Dutch"
    },
    "name": "Suriname",
    "region": "SA"
  },
  {
    "capital": "Longyearbyen",
    "code": "SJ",
    "currency": {
      "code": "NOK",
      "name": "Norwegian krone",
      "symbol": "kr"
    },
    "flag": "https://restcountries.eu/data/sjm.svg",
    "language": {
      "code": "no",
      "name": "Norwegian"
    },
    "name": "Svalbard and Jan Mayen",
    "region": "EU"
  },
  {
    "capital": "Lobamba",
    "code": "SZ",
    "currency": {
      "code": "SZL",
      "name": "Swazi lilangeni",
      "symbol": "L"
    },
    "flag": "https://restcountries.eu/data/swz.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Swaziland",
    "region": "AF"
  },
  {
    "capital": "Stockholm",
    "code": "SE",
    "currency": {
      "code": "SEK",
      "name": "Swedish krona",
      "symbol": "kr"
    },
    "flag": "https://restcountries.eu/data/swe.svg",
    "language": {
      "code": "sv",
      "name": "Swedish"
    },
    "name": "Sweden",
    "region": "EU"
  },
  {
    "capital": "Bern",
    "code": "CH",
    "currency": {
      "code": "CHF",
      "name": "Swiss franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/che.svg",
    "language": {
      "code": "de",
      "name": "German"
    },
    "name": "Switzerland",
    "region": "EU"
  },
  {
    "capital": "Damascus",
    "code": "SY",
    "currency": {
      "code": "SYP",
      "name": "Syrian pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/syr.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Syrian Arab Republic",
    "region": "AS"
  },
  {
    "capital": "Taipei",
    "code": "TW",
    "currency": {
      "code": "TWD",
      "name": "New Taiwan dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/twn.svg",
    "language": {
      "code": "zh",
      "name": "Chinese"
    },
    "name": "Taiwan",
    "region": "AS"
  },
  {
    "capital": "Dushanbe",
    "code": "TJ",
    "currency": {
      "code": "TJS",
      "name": "Tajikistani somoni",
      "symbol": "ЅМ"
    },
    "flag": "https://restcountries.eu/data/tjk.svg",
    "language": {
      "code": "tg",
      "name": "Tajik"
    },
    "name": "Tajikistan",
    "region": "AS"
  },
  {
    "capital": "Dodoma",
    "code": "TZ",
    "currency": {
      "code": "TZS",
      "name": "Tanzanian shilling",
      "symbol": "Sh"
    },
    "flag": "https://restcountries.eu/data/tza.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Tanzania, United Republic of",
    "region": "AF"
  },
  {
    "capital": "Bangkok",
    "code": "TH",
    "currency": {
      "code": "THB",
      "name": "Thai baht",
      "symbol": "฿"
    },
    "flag": "https://restcountries.eu/data/tha.svg",
    "language": {
      "code": "th",
      "name": "Thai"
    },
    "name": "Thailand",
    "region": "AS"
  },
  {
    "capital": "Dili",
    "code": "TL",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/tls.svg",
    "language": {
      "code": "pt",
      "name": "Portuguese"
    },
    "name": "Timor-Leste",
    "region": "AS"
  },
  {
    "capital": "Lomé",
    "code": "TG",
    "currency": {
      "code": "XOF",
      "name": "West African CFA franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/tgo.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Togo",
    "region": "AF"
  },
  {
    "capital": "Fakaofo",
    "code": "TK",
    "currency": {
      "code": "NZD",
      "name": "New Zealand dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/tkl.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Tokelau",
    "region": "OC"
  },
  {
    "capital": "Nuku'alofa",
    "code": "TO",
    "currency": {
      "code": "TOP",
      "name": "Tongan paʻanga",
      "symbol": "T$"
    },
    "flag": "https://restcountries.eu/data/ton.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Tonga",
    "region": "OC"
  },
  {
    "capital": "Port of Spain",
    "code": "TT",
    "currency": {
      "code": "TTD",
      "name": "Trinidad and Tobago dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/tto.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Trinidad and Tobago",
    "region": "SA"
  },
  {
    "capital": "Tunis",
    "code": "TN",
    "currency": {
      "code": "TND",
      "name": "Tunisian dinar",
      "symbol": "د.ت"
    },
    "flag": "https://restcountries.eu/data/tun.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Tunisia",
    "region": "AF"
  },
  {
    "capital": "Ankara",
    "code": "TR",
    "currency": {
      "code": "TRY",
      "name": "Turkish lira",
      "symbol": null
    },
    "flag": "https://restcountries.eu/data/tur.svg",
    "language": {
      "code": "tr",
      "name": "Turkish"
    },
    "name": "Turkey",
    "region": "AS"
  },
  {
    "capital": "Ashgabat",
    "code": "TM",
    "currency": {
      "code": "TMT",
      "name": "Turkmenistan manat",
      "symbol": "m"
    },
    "flag": "https://restcountries.eu/data/tkm.svg",
    "language": {
      "code": "tk",
      "name": "Turkmen"
    },
    "name": "Turkmenistan",
    "region": "AS"
  },
  {
    "capital": "Cockburn Town",
    "code": "TC",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/tca.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Turks and Caicos Islands",
    "region": "NA"
  },
  {
    "capital": "Funafuti",
    "code": "TV",
    "currency": {
      "code": "AUD",
      "name": "Australian dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/tuv.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Tuvalu",
    "region": "OC"
  },
  {
    "capital": "Kampala",
    "code": "UG",
    "currency": {
      "code": "UGX",
      "name": "Ugandan shilling",
      "symbol": "Sh"
    },
    "flag": "https://restcountries.eu/data/uga.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Uganda",
    "region": "AF"
  },
  {
    "capital": "Kiev",
    "code": "UA",
    "currency": {
      "code": "UAH",
      "name": "Ukrainian hryvnia",
      "symbol": "₴"
    },
    "flag": "https://restcountries.eu/data/ukr.svg",
    "language": {
      "code": "uk",
      "name": "Ukrainian"
    },
    "name": "Ukraine",
    "region": "EU"
  },
  {
    "capital": "Abu Dhabi",
    "code": "AE",
    "currency": {
      "code": "AED",
      "name": "United Arab Emirates dirham",
      "symbol": "د.إ"
    },
    "flag": "https://restcountries.eu/data/are.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "United Arab Emirates",
    "region": "AS"
  },
  {
    "capital": "London",
    "code": "GB",
    "currency": {
      "code": "GBP",
      "name": "British pound",
      "symbol": "£"
    },
    "flag": "https://restcountries.eu/data/gbr.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "United Kingdom of Great Britain and Northern Ireland",
    "region": "EU"
  },
  {
    "capital": "Washington, D.C.",
    "code": "US",
    "currency": {
      "code": "USD",
      "name": "United States dollar",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/usa.svg",
    "language": {
      "code": "en",
      "iso639_2": "eng",
      "name": "English",
      "nativeName": "English"
    },
    "name": "United States of America",
    "region": "NA"
  },
  {
    "capital": "Montevideo",
    "code": "UY",
    "currency": {
      "code": "UYU",
      "name": "Uruguayan peso",
      "symbol": "$"
    },
    "flag": "https://restcountries.eu/data/ury.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Uruguay",
    "region": "SA"
  },
  {
    "capital": "Tashkent",
    "code": "UZ",
    "currency": {
      "code": "UZS",
      "name": "Uzbekistani so'm",
      "symbol": null
    },
    "flag": "https://restcountries.eu/data/uzb.svg",
    "language": {
      "code": "uz",
      "name": "Uzbek"
    },
    "name": "Uzbekistan",
    "region": "AS"
  },
  {
    "capital": "Port Vila",
    "code": "VU",
    "currency": {
      "code": "VUV",
      "name": "Vanuatu vatu",
      "symbol": "Vt"
    },
    "flag": "https://restcountries.eu/data/vut.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Vanuatu",
    "region": "OC"
  },
  {
    "capital": "Caracas",
    "code": "VE",
    "currency": {
      "code": "VEF",
      "name": "Venezuelan bolívar",
      "symbol": "Bs F"
    },
    "flag": "https://restcountries.eu/data/ven.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Venezuela (Bolivarian Republic of)",
    "region": "SA"
  },
  {
    "capital": "Hanoi",
    "code": "VN",
    "currency": {
      "code": "VND",
      "name": "Vietnamese đồng",
      "symbol": "₫"
    },
    "flag": "https://restcountries.eu/data/vnm.svg",
    "language": {
      "code": "vi",
      "name": "Vietnamese"
    },
    "name": "Viet Nam",
    "region": "AS"
  },
  {
    "capital": "Mata-Utu",
    "code": "WF",
    "currency": {
      "code": "XPF",
      "name": "CFP franc",
      "symbol": "Fr"
    },
    "flag": "https://restcountries.eu/data/wlf.svg",
    "language": {
      "code": "fr",
      "name": "French"
    },
    "name": "Wallis and Futuna",
    "region": "OC"
  },
  {
    "capital": "El Aaiún",
    "code": "EH",
    "currency": {
      "code": "MAD",
      "name": "Moroccan dirham",
      "symbol": "د.م."
    },
    "flag": "https://restcountries.eu/data/esh.svg",
    "language": {
      "code": "es",
      "name": "Spanish"
    },
    "name": "Western Sahara",
    "region": "AF"
  },
  {
    "capital": "Sana'a",
    "code": "YE",
    "currency": {
      "code": "YER",
      "name": "Yemeni rial",
      "symbol": "﷼"
    },
    "flag": "https://restcountries.eu/data/yem.svg",
    "language": {
      "code": "ar",
      "name": "Arabic"
    },
    "name": "Yemen",
    "region": "AS"
  },
  {
    "capital": "Lusaka",
    "code": "ZM",
    "currency": {
      "code": "ZMW",
      "name": "Zambian kwacha",
      "symbol": "ZK"
    },
    "flag": "https://restcountries.eu/data/zmb.svg",
    "language": {
      "code": "en",
      "name": "English"
    },
    "name": "Zambia",
    "region": "AF"
  },
  {
    "capital": "Harare",
    "code": "ZW",
    "currency": {
      "code": "BWP",
      "name": "Botswana pula",
      "symbol": "P"
    },
    "flag": "https://restcountries.eu/data/zwe.svg",
    "language": {
      "code": "en",
      "iso639_2": "eng",
      "name": "English",
      "nativeName": "English"
    },
    "name": "Zimbabwe",
    "region": "AF"
  }
]
"""

#endif
