//
//  PredictionInteractor.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/23/21.
//

import Foundation

enum InputStringError: Error {
    case empty
    var localizedDescription: String {
        switch self {
        case .empty:
            return "Xin vui lòng nhập vào đoạn thơ"
        }
    }
}

class PredictionInteractor {
    
    var presenter: InteractorToPresenterPredictionProtocol?
    
}

extension PredictionInteractor : PresenterToInteractorPredictionProtocol {
    
    func validateInput(_ poemDescript: String?) throws {
        if String.get(poemDescript).isEmpty  { throw InputStringError.empty }
    }
    
}
