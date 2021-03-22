//
//  ExampleDataRouter.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/24/21.
//  
//

import Foundation
import UIKit

class ExampleDataRouter: PresenterToRouterExampleDataProtocol {
    
    // MARK: Static methods
    static func createModule(delegate:ExampleDataModuleDelegate? ) -> UIViewController {
        
        let viewController = ExampleDataViewController()
        
        let presenter: ViewToPresenterExampleDataProtocol & InteractorToPresenterExampleDataProtocol = ExampleDataPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ExampleDataRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ExampleDataInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.delegate = delegate
        
        return viewController
    }
    
}
