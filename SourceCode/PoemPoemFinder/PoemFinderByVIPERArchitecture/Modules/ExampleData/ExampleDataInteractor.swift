//
//  ExampleDataInteractor.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/24/21.
//  
//

import Foundation

class ExampleDataInteractor: PresenterToInteractorExampleDataProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterExampleDataProtocol?
    
    fileprivate var data:[String] = []
}

extension ExampleDataInteractor {
    func loadExampleData() {
        self.data = [
            "Khi ta lớn Đất Nước đã có rồi. Đất Nước có trong những cái ngày xửa ngày xưa.. mẹ thường hay kể.",
            "Đất Nước có trong những cái",
            "Sao anh không về chơi thôn Vĩ? Nhìn nắng hàng cau nắng mới lên",
            "Một đèo, một đèo, lại một đèo, khen ai khéo tạc cảnh cheo leo",
            "Sông Mã xa rồi Tây tiến ơi !Nhớ về rừng núi, nhớ chơi vơi ",
            "Thơ ra khỏi bút thơ buồn, Ý tôi ra khỏi tâm hồn thì say"
            ]
        self.presenter?.fetchDataSuccess(poemExams: self.data)
    }
}
