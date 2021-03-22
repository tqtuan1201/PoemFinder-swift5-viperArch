//
//  PredictionModuleBuilder.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/23/21.
//

import UIKit


class PredictionModuleBuilder {
    
    static func build() -> UIViewController {
        let view:PredictionViewController = PredictionViewController()
        let interactor = PredictionInteractor()
        let router = PredictionRouter(withVC: view)
        let presenter:PredictionPresenter = PredictionPresenter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        return view
    }
    
}
