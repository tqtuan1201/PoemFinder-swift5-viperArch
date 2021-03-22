//
//  ExampleDataPresenter.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/24/21.
//  
//

import Foundation

class ExampleDataPresenter: ViewToPresenterExampleDataProtocol {

    // MARK: Properties
    var view: PresenterToViewExampleDataProtocol?
    var interactor: PresenterToInteractorExampleDataProtocol?
    var router: PresenterToRouterExampleDataProtocol?
    var delegate: ExampleDataModuleDelegate?
    
    fileprivate var items:[String] = [] {
        didSet {
            self.view?.onFetchSuccess()
        }
    }
    
    func viewDidLoad() {
        self.interactor?.loadExampleData()
    }
    
    func numberOfRowsInSection() -> Int {
        return self.items.count
    }
    
    func textLabelText(indexPath: IndexPath) -> String {
        return self.items[indexPath.row]
    }
    
    func didSelectRowAt(index: Int) {
        self.delegate?.onSelectedPoemDescriptionExample(exam: self.items[index])
    }
}

//MARK:// InteractorToPresenterExampleDataProtocol
extension ExampleDataPresenter: InteractorToPresenterExampleDataProtocol {
    
    func fetchDataSuccess(poemExams: [String]) {
        self.items = poemExams
    }
}

