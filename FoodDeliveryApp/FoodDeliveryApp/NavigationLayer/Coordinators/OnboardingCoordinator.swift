//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by MIKHAIL ZHACHKO on 15.03.24.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

private extension OnboardingCoordinator {
    
    func showOnboarding(){
        var pages = [UIViewController]()
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .green
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .yellow
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .cyan

        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .orange
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}

