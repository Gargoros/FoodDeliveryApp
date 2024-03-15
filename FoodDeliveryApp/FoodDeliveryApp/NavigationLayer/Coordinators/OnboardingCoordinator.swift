//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by MIKHAIL ZHACHKO on 15.03.24.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}
