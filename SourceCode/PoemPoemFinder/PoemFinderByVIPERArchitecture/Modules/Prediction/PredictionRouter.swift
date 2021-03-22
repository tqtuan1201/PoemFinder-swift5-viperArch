//
//  PredictionRouter.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/23/21.
//

import TTBaseUIKit

class PredictionRouter  {
    
    fileprivate var exampleDataView:UIViewController? = nil
    var rootViewController:UIViewController
    
    init(withVC vc:UIViewController) {
        self.rootViewController = vc
    }
    
}

//MARK:// PresenterToRouterPredictionProtocol
extension PredictionRouter : PresenterToRouterPredictionProtocol {
        
    func pushToPoemExampleList(delegate: ExampleDataModuleDelegate) {
        self.exampleDataView = ExampleDataRouter.createModule(delegate: delegate)
        self.rootViewController.presentDef(vc: self.exampleDataView!, type: .overFullScreen, transitionStyle: .coverVertical)
    }
    
    func dismissPoemExampleList() {
        self.exampleDataView?.onDismiss()
    }
}
