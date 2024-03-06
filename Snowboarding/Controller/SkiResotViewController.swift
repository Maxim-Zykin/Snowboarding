//
//  SkiResotViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 05.03.2024.
//

import UIKit

class SkiResotViewController: UIViewController {

    // MARK: - UI Components
    
   private var imageSki: UIImageView = {
        var image = UIImageView()
        image.frame.size = CGSize(width: 393, height: 396)
        image.layer.masksToBounds = true
        return image
   }()
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let contentViewGeneral: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .white
        return view
    }()
    
    private let contentViewWeatherInfo: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.frame.size = CGSize(width: 160, height: 160)
        view.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 255/255)
        return view
    }()
    
    private let contentViewSkiInfo: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 255/255)
        return view
    }()
    
    var nameSkiResot = ""
    var allTracks: String = ""
    var heightDifference: String = ""
    var totalLengthOfTracks: String = ""
    var apiWeather: String = ""
    var imageSkiR: String = ""
    
    private lazy var nameSkiResotLable = CustomLabel(text: "\(nameSkiResot)", size: 32, color: .white)

    private let weather = CustomLabel(text: "ПОГОДА", color: .black, textFont: .systemFont(ofSize: 16, weight: .bold))
    
    private lazy var temps = CustomLabel(text: "-", size: 40, color: .black)
    
    private var descriptionWeather = CustomLabel(text: "", size: 13, color: .black)
    
    private var iconW = UIImageView()
    
    private var temp = ""

    private lazy var allTracksLable = CustomLabel(text: "Всего трасс: \(allTracks)", textAlignment: .left, size: 14, color: .black)
    
    private lazy var heightDifferenceLable = CustomLabel(text: "Перепад высот: \(heightDifference) м", textAlignment: .left, size: 14, color: .black)
    
    private lazy var totalLengthOfTracksLable = CustomLabel(text: "Длина трасс: \(totalLengthOfTracks) км", textAlignment: .left, size: 14, color: .black)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func tempFeach() {
        NetworkManager.fetchWeather(url: apiWeather) { [weak self] fields, icon in
            guard let self = self else { return }
            self.temp = String(Int(fields.temp ?? 0))
            var iconName = ""
            var description = ""
            
            for w in icon {
                iconName = w.icon
                description = w.description
            }
            
            DispatchQueue.main.async {
                self.temps.text = "\(self.temp)°"
                print(self.temp)
                print(icon)
                self.iconW.image = UIImage(named: iconName)
                self.descriptionWeather.text = "\(description.firstCharOnly())"
            }
        }
    }

    // MARK: - UI Setup
    private func setupUI() {
    
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
        ])
        
        self.imageSki.image = UIImage(named: "\(imageSkiR)")
        
        self.view.addSubview(imageSki)
        self.view.addSubview(contentViewGeneral)
        self.view.addSubview(contentViewWeatherInfo)
        self.view.addSubview(nameSkiResotLable)
        self.view.addSubview(weather)
        self.view.addSubview(temps)
        self.view.addSubview(descriptionWeather)
        self.view.addSubview(iconW)
        self.view.addSubview(allTracksLable)
        self.view.addSubview(heightDifferenceLable)
        self.view.addSubview(totalLengthOfTracksLable)
        
        self.imageSki.translatesAutoresizingMaskIntoConstraints = false
        self.contentViewGeneral.translatesAutoresizingMaskIntoConstraints = false
        self.contentViewWeatherInfo.translatesAutoresizingMaskIntoConstraints = false
        self.nameSkiResotLable.translatesAutoresizingMaskIntoConstraints = false
        self.weather.translatesAutoresizingMaskIntoConstraints = false
        self.temps.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionWeather.translatesAutoresizingMaskIntoConstraints = false
        self.iconW.translatesAutoresizingMaskIntoConstraints = false
        self.allTracksLable.translatesAutoresizingMaskIntoConstraints = false
        self.heightDifferenceLable.translatesAutoresizingMaskIntoConstraints = false
        self.totalLengthOfTracksLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageSki.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: -50),
            imageSki.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageSki.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageSki.heightAnchor.constraint(equalToConstant: 396),
            imageSki.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            nameSkiResotLable.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            nameSkiResotLable.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 128),
            
            contentViewGeneral.topAnchor.constraint(equalTo: self.imageSki.bottomAnchor, constant: -50),
            contentViewGeneral.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            contentViewGeneral.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            contentViewGeneral.heightAnchor.constraint(equalToConstant: 400),
            ])
    }
}
