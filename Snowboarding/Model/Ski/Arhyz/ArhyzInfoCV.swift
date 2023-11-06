//
//  ArhyzInfoCV.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 21.09.2023.
//
import Foundation
import UIKit


public struct InfoGroupArhyz {
  public let sky: [AllInfo]
}

extension InfoGroupArhyz{

    public static func skiInfi() -> InfoGroupArhyz{

        let products = [
            AllInfo(name: "Гостиницы", image: UIImage(named: "Romantic")!),
            AllInfo(name: "Прокат", image: UIImage(named: "rentalN1")!),
            AllInfo(name: "Карта", image: UIImage(named: "map")!)
        ]
        return InfoGroupArhyz(sky: products)
    }
}
