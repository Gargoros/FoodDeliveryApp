//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by MIKHAIL ZHACHKO on 15.03.24.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onBoardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    //MARK: - Properties
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onBoardingFinish() {
        coordinator.finish()
    }
    
    
}
