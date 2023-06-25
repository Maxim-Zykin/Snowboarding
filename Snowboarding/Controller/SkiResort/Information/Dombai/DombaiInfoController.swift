//
//  DombaiInfoController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 02.06.2023.
//

import UIKit

class DombaiInfoController: UIViewController {
    
    // MARK: - UI Components
    private let aboutResort = CustomLabel(text: "Горный курорт Домбай (Домбайская поляна) расположился на территории Карачаево-Черкесской республики, у подножия Главного хребта Кавказских гор. Домбай относится к всесезонному туристическому комплексу: с декабря по апрель создаются идеальные условия для активного катания по склонам, май - август - время для пешего туризма, ранняя осень - “бархатный” сезон, и только октябрь и ноябрь - сезон затишья.",  textAlignment: .left, size: 18, color: .black, numberOfLines: 20)
    
    private let allTracks = CustomLabel(text: "Всего трасс: 9", textAlignment: .left, size: 18, color: .black)
    private let heightDifference = CustomLabel(text: "Перепад высот: 1538 м", textAlignment: .left, size: 18, color: .black)
    private let totalLengthOfTracks = CustomLabel(text: "Общая длина трасс: 16,2 км", textAlignment: .left, size: 18, color: .black)
    private let season = CustomLabel(text: "Горнолыжный сезон с декабря до апрель", textAlignment: .left, size: 18, color: .black)
    
    private var imageSheregesh = UIImageView()

    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let weather = CustomLabel(text: "Погода",size: 20, color: .white)
    lazy var temps = CustomLabel(text: "-", size: 30, color: .white)
    var temp = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tempFeach()
    }
    
    func tempFeach() {
        NetworkManager.fetchWeather(url: API.apiWeatherDombai) { fields in
            self.temp = String(Int(fields.temp ?? 0))
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.temps.text = "\(self.temp)°"
                print(self.temp)
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
        
        self.imageSheregesh.image = UIImage(named: "dombai")
        
        self.view.addSubview(imageSheregesh)
        self.view.addSubview(aboutResort)
        self.view.addSubview(allTracks)
        self.view.addSubview(heightDifference)
        self.view.addSubview(totalLengthOfTracks)
        self.view.addSubview(weather)
        self.view.addSubview(temps)
        
        self.aboutResort.translatesAutoresizingMaskIntoConstraints = false
        self.allTracks.translatesAutoresizingMaskIntoConstraints = false
        self.heightDifference.translatesAutoresizingMaskIntoConstraints = false
        self.totalLengthOfTracks.translatesAutoresizingMaskIntoConstraints = false
        self.imageSheregesh.translatesAutoresizingMaskIntoConstraints = false
        self.weather.translatesAutoresizingMaskIntoConstraints = false
        self.temps.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageSheregesh.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageSheregesh.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageSheregesh.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageSheregesh.heightAnchor.constraint(equalToConstant: 200),
            imageSheregesh.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            aboutResort.topAnchor.constraint(equalTo: self.imageSheregesh.bottomAnchor, constant: 10),
            aboutResort.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            aboutResort.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            allTracks.topAnchor.constraint(equalTo: self.aboutResort.bottomAnchor, constant: 10),
            allTracks.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            allTracks.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            heightDifference.topAnchor.constraint(equalTo: self.allTracks.bottomAnchor, constant: 10),
            heightDifference.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            heightDifference.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            totalLengthOfTracks.topAnchor.constraint(equalTo: self.heightDifference.bottomAnchor, constant: 10),
            totalLengthOfTracks.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            totalLengthOfTracks.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            weather.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            weather.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            weather.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            weather.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            temps.topAnchor.constraint(equalTo: self.weather.bottomAnchor),
            temps.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            temps.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            totalLengthOfTracks.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
}
