//
//  MapViewController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 03.10.2023.
//

import UIKit
import YandexMapsMobile

class MapViewController: UIViewController {

    var latitude = 52.929291
    var longitude = 87.983100

    lazy var mapView: YMKMapView = YBaseMapView().mapView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateMap()
        setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func configurateMap() {
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(
                target: YMKPoint(latitude: latitude, longitude: longitude),
                zoom: 15,
                azimuth: 0,
                tilt: 0
            ),
            animation: YMKAnimation(type: YMKAnimationType.smooth, duration: 1),
            cameraCallback: nil)
    }

}
