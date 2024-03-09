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
        view.frame = view.bounds
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
        view.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 255/255)
        return view
    }()
    
    private let contentViewSkiInfo: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 255/255)
        return view
    }()
    
    private let contentViewSkiAbout: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 255/255)
        return view
    }()
    
    lazy var collection = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeLayout()
    )
    
    enum Info: CaseIterable {
        case hotels, rent, map
    }
    
    let infoResort = Info.allCases
    
    private let priceButton = CustomButtons(title: "СКИ-ПАСС \nцены", hasBakground: true, fontSize: .med)
    private let timeButton = CustomButtons(title: "РЕЖИМ РАБОТЫ", hasBakground: true, fontSize: .med)
    
    
    var nameSkiResot: String = ""
    var allTracks: String = ""
    var heightDifference: String = ""
    var totalLengthOfTracks: String = ""
    var apiWeather: String = ""
    var imageSkiR: String = ""
    var descroption: String = ""
    var timeWorkModel: [AllTimeWork]
    var costModel: [AllPrice]
    var hotelModel: [AllHotels]
    var rentsModel: [AllRents]
    var latitudeMap: Double
    var longitudeMap: Double
    
    private let infoModel = InfoGroup.skiInfi()
    
    private lazy var nameSkiResotLable = CustomLabel(text: "\(nameSkiResot)", size: 32, color: .white)

    private let weather = CustomLabel(text: "ПОГОДА", color: .black, textFont: .systemFont(ofSize: 16, weight: .bold))
    
    private lazy var temps = CustomLabel(text: "", size: 40, color: .black)
    
    private var descriptionWeather = CustomLabel(text: "", size: 14, color: .black)
    
    private var iconW = UIImageView()
    
    private var temp = ""

    private lazy var allTracksLable = CustomLabel(text: "Всего трасс: \(allTracks)", textAlignment: .left, size: 15, color: .black)
    
    private lazy var heightDifferenceLable = CustomLabel(text: "Перепад высот: \(heightDifference) м", textAlignment: .left, size: 15, color: .black)
    
    private lazy var totalLengthOfTracksLable = CustomLabel(text: "Длина трасс: \(totalLengthOfTracks) км", textAlignment: .left, size: 15, color: .black)
    
    private lazy var descroptionLable = CustomLabel(text: "Шерегеш находится на юге Кемеровской области, в Горной Шории — красивой и дикой гористой местности на стыке Саян, Алтая и Кузнецкого Алатау.  Шерегеш находится на юге Кемеровской области, в Горной Шории — красивой и дикой гористой местности на стыке Саян, Алтая и Кузнецкого Алатау.Шерегеш находится на юге Кемеровской области, в Горной Шории — красивой и дикой гористой местности на стыке Саян, Алтая и Кузнецкого Алатау.", textAlignment: .left, size: 15, color: .black, numberOfLines: 0)
    
    // MARK: - Init
    init(nameSkiResot: String, allTracks: String, heightDifference: String, totalLengthOfTracks: String, apiWeather: String, imageSkiR: String, descroption: String, timeWorkModel: [AllTimeWork], costModel: [AllPrice], hotelModel: [AllHotels], rentsModel: [AllRents], latitudeMap: Double, longitudeMap: Double) {
        self.nameSkiResot = nameSkiResot
        self.allTracks = allTracks
        self.heightDifference = heightDifference
        self.totalLengthOfTracks = totalLengthOfTracks
        self.apiWeather = apiWeather
        self.imageSkiR = imageSkiR
        self.descroption = descroption
        self.timeWorkModel = timeWorkModel
        self.costModel = costModel
        self.hotelModel = hotelModel
        self.rentsModel = rentsModel
        self.latitudeMap = latitudeMap
        self.longitudeMap = longitudeMap
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tempFeach()
        setupButtons()
        setupCollectionView()
    }
    
    // MARK: - Buttons
    func setupButtons() {
        self.priceButton.addTarget(self, action: #selector(didTapPrice), for: .touchUpInside)
        self.timeButton.addTarget(self, action: #selector(didTapTime), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc private func didTapPrice() {
        let vc = TimeTableViewController(timeWorkModel: timeWorkModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapTime() {
        let vc = PriceTableViewController(costModel: costModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Network
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
    
    private func makeLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 20
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(105))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        }
    
    private func setupCollectionView() {
        collection.register(InfrastructureInformationCell.self, forCellWithReuseIdentifier: InfrastructureInformationCell.cellID)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.isScrollEnabled = false
    }
    
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
        
        self.contentView.addSubview(imageSki)
        self.contentView.addSubview(contentViewGeneral)
        self.contentView.addSubview(contentViewWeatherInfo)
        self.contentView.addSubview(contentViewSkiInfo)
        self.view.addSubview(nameSkiResotLable)
        self.view.addSubview(weather)
        self.view.addSubview(temps)
        self.view.addSubview(descriptionWeather)
        self.view.addSubview(iconW)
        self.view.addSubview(allTracksLable)
        self.view.addSubview(heightDifferenceLable)
        self.view.addSubview(totalLengthOfTracksLable)
        self.contentView.addSubview(contentViewSkiAbout)
        self.view.addSubview(descroptionLable)
        self.view.addSubview(priceButton)
        self.view.addSubview(timeButton)
        self.contentView.addSubview(collection)
        
        self.imageSki.translatesAutoresizingMaskIntoConstraints = false
        self.contentViewGeneral.translatesAutoresizingMaskIntoConstraints = false
        self.contentViewWeatherInfo.translatesAutoresizingMaskIntoConstraints = false
        self.contentViewSkiInfo.translatesAutoresizingMaskIntoConstraints = false
        self.nameSkiResotLable.translatesAutoresizingMaskIntoConstraints = false
        self.weather.translatesAutoresizingMaskIntoConstraints = false
        self.temps.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionWeather.translatesAutoresizingMaskIntoConstraints = false
        self.iconW.translatesAutoresizingMaskIntoConstraints = false
        self.allTracksLable.translatesAutoresizingMaskIntoConstraints = false
        self.heightDifferenceLable.translatesAutoresizingMaskIntoConstraints = false
        self.totalLengthOfTracksLable.translatesAutoresizingMaskIntoConstraints = false
        self.contentViewSkiAbout.translatesAutoresizingMaskIntoConstraints = false
        self.descroptionLable.translatesAutoresizingMaskIntoConstraints = false
        self.priceButton.translatesAutoresizingMaskIntoConstraints = false
        self.timeButton.translatesAutoresizingMaskIntoConstraints = false
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageSki.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: -99),
            imageSki.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageSki.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageSki.heightAnchor.constraint(equalToConstant: 396),
            imageSki.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            nameSkiResotLable.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            nameSkiResotLable.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120),
            
            contentViewGeneral.topAnchor.constraint(equalTo: self.imageSki.bottomAnchor, constant: -50),
            contentViewGeneral.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            contentViewGeneral.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            contentViewGeneral.heightAnchor.constraint(equalToConstant: 120),
            
            contentViewWeatherInfo.topAnchor.constraint(equalTo: self.contentViewGeneral.topAnchor, constant: 20),
            contentViewWeatherInfo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 22),
            contentViewWeatherInfo.heightAnchor.constraint(equalToConstant: 160),
            contentViewWeatherInfo.widthAnchor.constraint(equalToConstant: 160),
            
            weather.topAnchor.constraint(equalTo: self.contentViewWeatherInfo.topAnchor, constant: 10),
            weather.leadingAnchor.constraint(equalTo: self.contentViewWeatherInfo.leadingAnchor, constant: 20),
            
            iconW.topAnchor.constraint(equalTo: self.weather.bottomAnchor, constant: 15),
            iconW.centerYAnchor.constraint(equalTo: self.contentViewWeatherInfo.centerYAnchor),
            iconW.leadingAnchor.constraint(equalTo: self.contentViewWeatherInfo.leadingAnchor, constant: 10),
            iconW.widthAnchor.constraint(equalToConstant: 60),
            iconW.heightAnchor.constraint(equalToConstant: 60),
            
            temps.topAnchor.constraint(equalTo: self.weather.bottomAnchor, constant: 15),
            temps.centerYAnchor.constraint(equalTo: self.contentViewWeatherInfo.centerYAnchor),
            temps.leadingAnchor.constraint(equalTo: self.iconW.trailingAnchor, constant: 10),
            
            descriptionWeather.topAnchor.constraint(equalTo: self.iconW.bottomAnchor, constant: 10),
            descriptionWeather.leadingAnchor.constraint(equalTo: self.contentViewWeatherInfo.leadingAnchor, constant: 20),
            descriptionWeather.trailingAnchor.constraint(equalTo: self.contentViewWeatherInfo.trailingAnchor, constant: -5),
            
            contentViewSkiInfo.topAnchor.constraint(equalTo: self.contentViewGeneral.topAnchor, constant: 20),
            contentViewSkiInfo.trailingAnchor.constraint(equalTo: self.contentViewGeneral.trailingAnchor, constant: -22),
            contentViewSkiInfo.heightAnchor.constraint(equalToConstant: 160),
            contentViewSkiInfo.widthAnchor.constraint(equalToConstant: 160),
            
            allTracksLable.topAnchor.constraint(equalTo: contentViewSkiInfo.topAnchor, constant: 35),
            allTracksLable.leadingAnchor.constraint(equalTo: contentViewSkiInfo.leadingAnchor, constant: 10),
            
            heightDifferenceLable.topAnchor.constraint(equalTo: allTracksLable.topAnchor, constant: 35),
            heightDifferenceLable.leadingAnchor.constraint(equalTo: contentViewSkiInfo.leadingAnchor, constant: 10),
            
            totalLengthOfTracksLable.topAnchor.constraint(equalTo: heightDifferenceLable.topAnchor, constant: 35),
            totalLengthOfTracksLable.leadingAnchor.constraint(equalTo: contentViewSkiInfo.leadingAnchor, constant: 10),
            
            contentViewSkiAbout.topAnchor.constraint(equalTo: self.contentViewSkiInfo.bottomAnchor, constant: 20),
            contentViewSkiAbout.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            contentViewSkiAbout.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            contentViewSkiAbout.heightAnchor.constraint(equalTo: self.descroptionLable.heightAnchor, constant: 20),
            
            descroptionLable.topAnchor.constraint(equalTo: self.contentViewSkiAbout.topAnchor, constant: 10),
            descroptionLable.leadingAnchor.constraint(equalTo: self.contentViewSkiAbout.leadingAnchor, constant: 20),
            descroptionLable.trailingAnchor.constraint(equalTo: self.contentViewSkiAbout.trailingAnchor, constant: -20),
            
            priceButton.topAnchor.constraint(equalTo: self.contentViewSkiAbout.bottomAnchor, constant: 20),
            priceButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            priceButton.heightAnchor.constraint(equalToConstant: 59),
            priceButton.widthAnchor.constraint(equalToConstant: 165),
            
            timeButton.topAnchor.constraint(equalTo: self.contentViewSkiAbout.bottomAnchor, constant: 20),
            timeButton.trailingAnchor.constraint(equalTo: self.contentViewGeneral.trailingAnchor, constant: -20),
            timeButton.heightAnchor.constraint(equalToConstant: 59),
            timeButton.widthAnchor.constraint(equalToConstant: 165),
            
            collection.topAnchor.constraint(equalTo: timeButton.bottomAnchor, constant: 10),
            collection.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 400),
            
            collection.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            
            //priceButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -80)
            ])
    }
}


extension SkiResotViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { infoModel.sky.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: InfrastructureInformationCell.cellID, for: indexPath) as! InfrastructureInformationCell
        cell.infoImage.image = infoModel.sky[indexPath.row].image
        cell.infoLabel.text = infoModel.sky[indexPath.row].name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(infoModel.sky[indexPath.row].name)
        
        let info = infoResort[indexPath.row]
        
        switch info {
        case .hotels:
            let vc = HotelsViewController()
            vc.model = hotelModel
            self.navigationController?.pushViewController(vc, animated: true)
        case .rent:
            let vc = RentViewController()
            vc.model = rentsModel
            self.navigationController?.pushViewController(vc, animated: true)
        case .map:
            let vc = MapViewController()
            vc.latitude = latitudeMap
            vc.longitude = longitudeMap
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
