//
//  UINavigationController+Extension.swift
//  Pokedex
//
//  Created by Angel Luis Bayon Romero on 21/3/24.
//

import Foundation
import UIKit

public extension UINavigationController {
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        self.pushViewController(viewController, animated: animated)
        if let transitionCoordinator = self.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: nil, completion: { _ in
                completion()
            })
        } else {
            completion()
        }
    }
    
    func popViewController(animated: Bool, completion: @escaping () -> Void) {
        popViewController(animated: animated)
        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
    
    
    func popToViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        popToViewController(viewController, animated: animated)
        if animated, let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
    
    func removeMiddleViewControllers() {
        guard let globalPositionVC = self.viewControllers.first,
              let lastVC = self.viewControllers.last,
              globalPositionVC != lastVC
        else { return }
        setViewControllers([globalPositionVC, lastVC], animated: false)
    }
}
