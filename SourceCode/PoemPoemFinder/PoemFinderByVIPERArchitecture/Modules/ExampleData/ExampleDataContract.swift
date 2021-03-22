//
//  ExampleDataContract.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/24/21.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewExampleDataProtocol {
    func onFetchSuccess()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterExampleDataProtocol {
    
    var view: PresenterToViewExampleDataProtocol? { get set }
    var interactor: PresenterToInteractorExampleDataProtocol? { get set }
    var router: PresenterToRouterExampleDataProtocol? { get set }
    var delegate: ExampleDataModuleDelegate? { get set }
    
    func viewDidLoad() -> Void
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String
    func didSelectRowAt(index: Int)
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorExampleDataProtocol {
    
    var presenter: InteractorToPresenterExampleDataProtocol? { get set }
    
    func loadExampleData() -> Void
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterExampleDataProtocol {
    func fetchDataSuccess(poemExams: [String])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterExampleDataProtocol {
    
}

// MARK: Send data between VIPER modules if need
protocol ExampleDataModuleDelegate {
    func onSelectedPoemDescriptionExample(exam:String)
}
