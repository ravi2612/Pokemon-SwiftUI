//
//  BaseRouter.swift
//  SGUBeta
//
//  Created by Daniel Reis on 19/01/21.
//

import SwiftUI

enum NavigationType {
    case present
    case push
}

class BaseRouter {
    
    static var shared: BaseRouter = BaseRouter()
    
    private var navigations: Array<NavigationType> = []
    var currentViewController: UIViewController?
    
    func configRootView() -> UIViewController {
        
        var controller: UIViewController!
        if let vc = HomeRouter().currentViewController {
            controller = UINavigationController(rootViewController: vc)
        }
        
//        return CardSuccessRouter().currentViewController!
        return controller
    }
        
    func show() {
        
        if let controller = currentViewController {
            UIApplication.topViewController()?.navigationController?.pushViewController(controller, animated: true)
            navigations.append(.push)
        }
    }
    
    func present(_ fullScreen: Bool = true, crossDissolve: Bool = false) {
        
        if let controller = currentViewController {
            
            if crossDissolve {
                controller.modalTransitionStyle = .crossDissolve
                controller.modalPresentationStyle = .overFullScreen
            }else{
                controller.modalPresentationStyle = fullScreen ? .fullScreen : .automatic
            }
            
            let navigationVC = UINavigationController(rootViewController: controller)
            navigationVC.isNavigationBarHidden = false
            navigationVC.modalTransitionStyle = .crossDissolve
            navigationVC.modalPresentationStyle = .overFullScreen
            
            UIApplication.topViewController()?.present(navigationVC, animated: true, completion: nil)
            
            navigations.append(.present)
        }
    }
    
    func dismiss() {
        
        if let navigation = navigations.last {
            
            if navigation == .push {
                UIApplication.topViewController()?.navigationController?.popViewController(animated: true)
            }else{
                UIApplication.topViewController()?.dismiss(animated: true, completion: nil)
            }
            
            navigations = navigations.dropLast()
        }else{
            UIApplication.topViewController()?.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func dismissAll() {
        navigations.removeAll()
        UIApplication.topViewController()?.navigationController?.popToRootViewController(animated: true)
    }
}

extension BaseRouter {
    
    func showHome(navigationType: NavigationType = .push, fullScreen: Bool = true) {
        
        if navigationType == .push {
            HomeRouter().show()
        }else{
            HomeRouter().present(fullScreen)
        }
    }
}
