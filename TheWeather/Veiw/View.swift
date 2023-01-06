//
//  View.swift
//  TheWeather
//
//  Created by Никита Бурин on 28.12.2022.
//



import UIKit

class View: UIView {
        
    var weatherImage: UIImageView = {
        let weatherImage = UIImageView()
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.image = UIImage(systemName: "sun.max")
        weatherImage.tintColor = .white
        weatherImage.layer.cornerRadius = 20
        return weatherImage
    }()
    
    var tempLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "°C"
        temp.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 40)
        temp.textColor = .white
        return temp
    }()
    
    var tempFeelsLikeLabel: UILabel = {
        let feels = UILabel()
        feels.translatesAutoresizingMaskIntoConstraints = false
        feels.text = "Feels like"
        feels.textColor = .white
        feels.font = UIFont(name: "AvenirNext-Regular", size: 16)
        return feels
    }()
    
    var cityLabel: UILabel = {
        let city = UILabel()
        city.translatesAutoresizingMaskIntoConstraints = false
        city.text = "Dmitrov"
        city.textColor = .white
        city.font = UIFont(name: "Copperplate-Bold", size: 50)
        city.numberOfLines = 0
        city.textAlignment = .center
        return city
    }()
    
    var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = button.bounds.size.width/2
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 2
        button.addTarget(nil, action: #selector(ViewController().searchButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        self.addSubview(weatherImage)
        self.addSubview(tempLabel)
        self.addSubview(tempFeelsLikeLabel)
        self.addSubview(searchButton)
        self.addSubview(cityLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([

            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            weatherImage.heightAnchor.constraint(equalToConstant: 100),
            weatherImage.widthAnchor.constraint(equalToConstant: 100),
            
            tempLabel.centerXAnchor.constraint(equalTo: weatherImage.centerXAnchor),
            tempLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 20),

            tempFeelsLikeLabel.centerXAnchor.constraint(equalTo: tempLabel.centerXAnchor, constant: 40),
            tempFeelsLikeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 1),

            cityLabel.centerXAnchor.constraint(equalTo: tempLabel.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: tempFeelsLikeLabel.bottomAnchor, constant: 20),
            cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            cityLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            searchButton.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 1),
            searchButton.centerXAnchor.constraint(equalTo: cityLabel.centerXAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
