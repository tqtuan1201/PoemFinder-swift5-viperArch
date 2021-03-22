//
//  PredictionContract.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPredictionProtocol: class {
    func onShowMessage(mess:String)
    func onUpdateExamplePoem(poem:String)
    func onRefreshData() -> Void
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPredictionProtocol: class {
    
    var view: PresenterToViewPredictionProtocol? { get set }
    var interactor: PresenterToInteractorPredictionProtocol? { get set }
    var router: PresenterToRouterPredictionProtocol? { get set }

    var authorProbabilities: [AuthorProbabilityModel] { get set }
    
    func viewDidLoad() -> Void
    func onClear() -> Void
    func onPredict(withText text:String) -> Void
    func onShowChoosePoemExample() -> Void
    func onUpdateTaggerUnit(type:NSLinguisticTaggerUnit) -> Void
    
    func numberOfRowsInSection() -> Int
    func getAuthorProbabilityModel(indexPath: IndexPath) -> AuthorProbabilityModel
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPredictionProtocol: class {
    
    var presenter: InteractorToPresenterPredictionProtocol? { get set }
    
    func validateInput(_ poemDescript: String?) throws
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPredictionProtocol: class {

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPredictionProtocol: class {
    func pushToPoemExampleList(delegate: ExampleDataModuleDelegate) -> Void
    func dismissPoemExampleList()
}


