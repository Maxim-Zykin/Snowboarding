//
//  ResortInformationController.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 23.04.2023.
//

import UIKit

class ResortInformationController: UIViewController {
    
   //private var resortInformation = UIViewController()

    private var segmentCo: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = .init(items: ["О курорте", "Цены", "Режим работы"])
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        segmentCo.addTarget(self, action: #selector(choiceSegment), for: .valueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @objc func choiceSegment(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:

            print("1")
        case 1:
            print("1")
        case 2:
            print("2")
        default: return
        }
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(segmentCo)
 
        self.segmentCo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.segmentCo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.segmentCo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.segmentCo.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),

        ])
    }
}
    
extension ResortInformationController {
    func add(_ child: UIViewController) {
    addChild(child)
    view.addSubview(child.view)
    child.didMove(toParent: self)
    }
    func remove() {
    // Just to be safe, we check that this view controller
    // is actually added to a parent before removing it.
    guard parent != nil else {
    return
    }
    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
    }

}
