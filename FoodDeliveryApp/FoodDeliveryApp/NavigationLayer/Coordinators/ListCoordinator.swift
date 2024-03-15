//
//  ListCoordinator.swift
//  FoodDeliveryApp
//
//  Created by MIKHAIL ZHACHKO on 15.03.24.
//

import UIKit

class ListCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .purple
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}
