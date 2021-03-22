//
//  PoemMLModelBuilder.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/24/21.
//

import Foundation
import CoreML


enum PRE_TYPE {
    case BAG_OF_WORDS
    case ANOTHER
}

// MARK: - PoemMLModel
class PoemMLModel {
    
    private(set) var model: Any?
    private(set) var linguisticTaggerUnit: NSLinguisticTaggerUnit = .word
    private(set) var textInput: String?
    private(set) var type: PRE_TYPE = .BAG_OF_WORDS
    
    // MARK: - PoemMLModelBuilder
    class PoemMLModelBuilder {
        
        private var instance: PoemMLModel = PoemMLModel()
        
        init() { self.instance = PoemMLModel() }
        
        /// This func set Prediction Input Type
        @discardableResult
        func setModel(_ model:Any) -> PoemMLModelBuilder {
            instance.model = model
            return self
        }
        
        /// This func set lingquistic type for NSLinguisticTagger
        @discardableResult
        func setLinguisticType(_ linguisticTaggerUnit: NSLinguisticTaggerUnit) -> PoemMLModelBuilder {
            instance.linguisticTaggerUnit = linguisticTaggerUnit
            return self
        }
        
        /// This func set text input
        @discardableResult
        func setInputText(_ text: String) -> PoemMLModelBuilder {
            instance.textInput = text
            return self
        }
        
        /// This func set type to predict
        @discardableResult
        func setType(_ type: PRE_TYPE) -> PoemMLModelBuilder {
            instance.type = type
            return self
        }
        
        func build() -> PoemMLModel {
            return instance
        }
        
    }
    
}


//MARK: For baseFuncs
extension PoemMLModel {
    func onPrediction() -> [AuthorProbabilityModel] {
        switch self.type {
        case .BAG_OF_WORDS:
            return self.onPredictionByBagOfWords()
        default:
            return []
        }
    }
}


//MARK: PredictionByBagOfWords
extension PoemMLModel {
    
    fileprivate func onPredictionByBagOfWords() -> [AuthorProbabilityModel] {
        
        print("::PoemMLModel-onPredictionByBagOfWords()\n")
        print("type: \(self.type)")
        print("linguisticTaggerUnit: \(self.linguisticTaggerUnit.rawValue)")
        print("model: \(self.model ?? "")")

        guard let model:Poets = self.model as? Poets else { return []}
        let text:String = self.textInput ?? ""
        
        //Gen bag of word
        var bagOfWords: [String: Double] = [:]
        
        let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
        let range = NSRange(text.startIndex..., in: text)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.string = text
        
        tagger.enumerateTags(in: range, unit: self.linguisticTaggerUnit, scheme: .tokenType, options: options) { _, tokenRange, _ in
            let word = (text as NSString).substring(with: tokenRange)
            bagOfWords[word, default: 0] += 1
        }
        
        //Prediction
        guard let prediction = try? model.prediction(text: bagOfWords) else { return []}
        let predictionData = prediction.authorProbability.sorted { a, b in a.value > b.value }
        return predictionData.map { item -> AuthorProbabilityModel in
            return AuthorProbabilityModel(name: item.0 , probability: item.1)
        }
    }
}

