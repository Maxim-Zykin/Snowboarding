//
//  ElbrusRegionInfoViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.11.2023.
//

import UIKit

class ElbrusRegionInfoViewController: UIViewController {
    
    // MARK: - UI Components
    private let aboutResort = CustomLabel(text: "Курорт Приэльбрусье – один из самых известных на Кавказе и в России центров горнолыжного отдыха, альпинизма и туризма. Этот изумительно красивый горный край называют жемчужиной Кавказских гор. Здесь располагается самая высокая часть Кавказских гор и самые известные его вершины. Заоблачные выси здесь искрятся снегами, укрывающими вершины Эльбруса, Ушбы, Шхары, Кошкантау, Дыхтау, Уллу-Тау, Шхельды и других гор. Приэльбрусье славится также самыми мощными ледниками – Дых-Су и Безенги. Горные хребты, тянущиеся параллельно друг другу, прорезающие их грандиозные и красивейшие ущелья поражают туристов своей первозданной красотой и великолепием.",  textAlignment: .left, size: 18, color: .black, numberOfLines: 0)
    private let allTracks = CustomLabel(text: "Всего трасс: 7", textAlignment: .left, size: 18, color: .black)
    private let heightDifference = CustomLabel(text: "Перепад высот: 1497 м", textAlignment: .left, size: 18, color: .black)
    private let totalLengthOfTracks = CustomLabel(text: "Общая длина трасс: более 17 км", textAlignment: .left, size: 18, color: .black)
    
    private let backgroundViewWeather: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 180/255, green: 196/255, blue: 225/255, alpha: 255/255)
        view.layer.cornerRadius = 35
        return view
    }()
    
    private var imageRosaKhutor = UIImageView()
    
    private var infoModel = InfoGroupElbrusRegion.skiInfi()

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
    
    lazy var collection = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeLayout()
    )
    
    let weather = CustomLabel(text: "Сейчас в Приэльбрусье",size: 20, color: .white)
    lazy var temps = CustomLabel(text: "-", size: 30, color: .white)
    var temp = ""
    var descriptionWeather = CustomLabel(text: "", size: 16, color: .white)
    
    var iconW = UIImageView()
    
    enum Info: CaseIterable {
        case hotels, rent, map
    }
    
    let infoResort = Info.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tempFeach()
        setupCollectionView()
    }
    
    func tempFeach() {
        NetworkManager.fetchWeather(url: API.apiWeatherElbrusRegion) { [weak self] fields, icon in
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
        
        self.imageRosaKhutor.image = UIImage(named: "elb")
        
        self.view.addSubview(imageRosaKhutor)
        self.view.addSubview(backgroundViewWeather)
        self.view.addSubview(aboutResort)
        self.view.addSubview(allTracks)
        self.view.addSubview(heightDifference)
        self.view.addSubview(totalLengthOfTracks)
        self.view.addSubview(weather)
        self.view.addSubview(temps)
        self.view.addSubview(iconW)
        self.view.addSubview(descriptionWeather)
        self.contentView.addSubview(collection)

        self.aboutResort.translatesAutoresizingMaskIntoConstraints = false
        self.allTracks.translatesAutoresizingMaskIntoConstraints = false
        self.heightDifference.translatesAutoresizingMaskIntoConstraints = false
        self.totalLengthOfTracks.translatesAutoresizingMaskIntoConstraints = false
        self.imageRosaKhutor.translatesAutoresizingMaskIntoConstraints = false
        self.weather.translatesAutoresizingMaskIntoConstraints = false
        self.temps.translatesAutoresizingMaskIntoConstraints = false
        self.iconW.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundViewWeather.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionWeather.translatesAutoresizingMaskIntoConstraints = false
        self.collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imageRosaKhutor.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageRosaKhutor.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageRosaKhutor.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageRosaKhutor.heightAnchor.constraint(equalToConstant: 300),
            imageRosaKhutor.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            aboutResort.topAnchor.constraint(equalTo: self.backgroundViewWeather.bottomAnchor, constant: 10),
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
            
            weather.topAnchor.constraint(equalTo: self.backgroundViewWeather.topAnchor, constant: 10),
            weather.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100),
            weather.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            temps.topAnchor.constraint(equalTo: self.weather.bottomAnchor),
            temps.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 100),
            temps.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            iconW.topAnchor.constraint(equalTo: self.backgroundViewWeather.topAnchor, constant: 10),
            iconW.leftAnchor.constraint(equalTo: self.backgroundViewWeather.leftAnchor, constant: 20),
            iconW.widthAnchor.constraint(equalToConstant: 60),
            iconW.heightAnchor.constraint(equalToConstant: 60),
            
            descriptionWeather.centerYAnchor.constraint(equalTo: self.temps.centerYAnchor),
            descriptionWeather.leftAnchor.constraint(equalTo: self.temps.leftAnchor, constant: 60),
            descriptionWeather.rightAnchor.constraint(equalTo: self.backgroundViewWeather.rightAnchor, constant: -10),
            
            backgroundViewWeather.topAnchor.constraint(equalTo: self.imageRosaKhutor.bottomAnchor, constant: -40),
            backgroundViewWeather.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            backgroundViewWeather.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            backgroundViewWeather.heightAnchor.constraint(equalToConstant:  80),
            
            collection.topAnchor.constraint(equalTo: totalLengthOfTracks.bottomAnchor, constant: 10),
            collection.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            collection.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            collection.heightAnchor.constraint(equalToConstant: 400),
            
            collection.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}

extension ElbrusRegionInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { infoModel.sky.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: InfrastructureInformationCell.cellID, for: indexPath) as! InfrastructureInformationCell
        cell.infoImage.image = infoModel.sky[indexPath.row].image
        cell.infoLabel.text = infoModel.sky[indexPath.row].name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let info = infoResort[indexPath.row]
        
        switch info {
        case .hotels:
            let vc = HotelsViewController()
            vc.model = hotelsElbrusRegionAll
            self.navigationController?.pushViewController(vc, animated: true)
        case .rent:
            let vc = RentViewController()
            vc.model = rentsElbrusRegionAll
            self.navigationController?.pushViewController(vc, animated: true)
        case .map:
            let vc = MapViewController()
            vc.latitude = 43.267222
            vc.longitude = 42.477608
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

