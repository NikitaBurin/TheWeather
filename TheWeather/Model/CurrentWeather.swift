//
//  CurrentWeather.swift
//  TheWeather
//
//  Created by Никита Бурин on 31.12.2022.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temp: Double
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    
    let feelsLiketemp: Double
    var feelsLiketempString: String {
        return String(format: "%.0f", feelsLiketemp)
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default: return "nosign"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData){
        cityName = currentWeatherData.name
        temp = currentWeatherData.main.temp
        feelsLiketemp = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
    
    
}
