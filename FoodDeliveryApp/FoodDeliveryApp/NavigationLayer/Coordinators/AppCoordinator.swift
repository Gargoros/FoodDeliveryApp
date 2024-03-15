//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by MIKHAIL ZHACHKO on 15.03.24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        showOnboardingFlow()
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        
        let onBoardingCoordinator = OnboardingCoordinator(
            type: .onboarding,
            navigationController: navigationController,
            finishDelegate: self
        )
        addChildCoordinator(onBoardingCoordinator)
        onBoardingCoordinator.start()
    }
    
    func showMainFlow() {}
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type{
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
