//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by MIKHAIL ZHACHKO on 15.03.24.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}
