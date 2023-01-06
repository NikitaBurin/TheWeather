//
//  ViewController.swift
//  TheWeather
//
//  Created by Никита Бурин on 28.12.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var networkWeatherManager = NetworkWetherManager()
    var mainView = View()
    lazy var locationmanager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationmanager.requestLocation()
            }
        }
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        }
    
    
    @objc func searchButton() {
        self.presentSearchAlertController(title: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
        }
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.mainView.cityLabel.text = weather.cityName
            self.mainView.tempLabel.text = "\(weather.tempString) °C"
            self.mainView.tempFeelsLikeLabel.text = "Feels like \(weather.feelsLiketempString) °C"
            self.mainView.weatherImage.image = UIImage(systemName: weather.systemIconNameString)   
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
    
        networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
                // Error handling
                print("Error requesting location")
            }

    }

    
