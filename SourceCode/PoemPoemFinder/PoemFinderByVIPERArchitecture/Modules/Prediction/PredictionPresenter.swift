//
//  PredictionPresenter.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/23/21.
//

import Foundation
import CoreML

class PredictionPresenter {
    
    weak var view: PresenterToViewPredictionProtocol?
    var interactor: PresenterToInteractorPredictionProtocol?
    var router: PresenterToRouterPredictionProtocol?

    var linguisticType:NSLinguisticTaggerUnit = .word
    
    var authorProbabilities: [AuthorProbabilityModel] = [] {
        didSet {
            self.view?.onRefreshData()
        }
    }
    
}

//MARK:// For base funcs
extension PredictionPresenter {
    fileprivate func onErrorHandle(error:Error) {
        if let inputError = error as? InputStringError {
            let message:String = inputError.localizedDescription
            self.view?.onShowMessage(mess: message)
        } else {
            let message:String = error.localizedDescription
            self.view?.onShowMessage(mess: message)
        }
    }
}

//MARK://ViewToPresenterPredictionProtocol
extension PredictionPresenter : ViewToPresenterPredictionProtocol {
    
    func onUpdateTaggerUnit(type: NSLinguisticTaggerUnit) {
        self.linguisticType = type
    }
    
    
    func onShowChoosePoemExample() {
        self.router?.pushToPoemExampleList(delegate: self)
    }
    
    
    func viewDidLoad() {
        
    }
    
    func onClear() {
        print("PredictionPresenter-onClear()")
    }
    
    func numberOfRowsInSection() -> Int {
        return self.authorProbabilities.count
    }
    
    func getAuthorProbabilityModel(indexPath: IndexPath) -> AuthorProbabilityModel {
        return self.authorProbabilities[indexPath.row]
    }
    
    func onPredict(withText text: String) {
        do {
            //Validation
            try self.interactor?.validateInput(text)
            
            //Do prediction
            let poemModel = PoemMLModel.PoemMLModelBuilder()
                .setModel(try! Poets(configuration: MLModelConfiguration()))
                .setType(.BAG_OF_WORDS)
                .setLinguisticType(self.linguisticType)
                .setInputText(text)
                .build()
            
            self.authorProbabilities = poemModel.onPrediction()
            
        } catch (let error) {
            self.onErrorHandle(error: error)
        }
    }
}


extension PredictionPresenter : ExampleDataModuleDelegate {
    
    func onSelectedPoemDescriptionExample(exam: String) {
        self.view?.onUpdateExamplePoem(poem: exam)
        self.router?.dismissPoemExampleList()
    }
}
