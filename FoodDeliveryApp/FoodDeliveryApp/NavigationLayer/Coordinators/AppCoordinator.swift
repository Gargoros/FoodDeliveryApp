//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by MIKHAIL ZHACHKO on 15.03.24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        //showOnboardingFlow()
        showMainFlow()
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
    
    func showMainFlow() {
        
        guard let navigationController = navigationController else { return }
        
        //MARK: - Home Tab Coordinator
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(
            type: .home,
            navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage.init(systemName: "house"),
            tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        //MARK: - Order Tab Coordinator
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(
            type: .home,
            navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(
            title: "Order",
            image: UIImage.init(systemName: "storefront"),
            tag: 1)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        //MARK: - List Tab Coordinator
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(
            type: .home,
            navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(
            title: "List",
            image: UIImage.init(systemName: "list.bullet.clipboard"),
            tag: 2)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        //MARK: - Profile Tab Coordinator
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(
            type: .home,
            navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage.init(systemName: "person.crop.circle"),
            tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController]
        
        let tabBarController = TabBarController(
            tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
        
    }
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
