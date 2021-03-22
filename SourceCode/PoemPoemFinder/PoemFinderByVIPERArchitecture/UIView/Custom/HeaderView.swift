//
//  HeaderView.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//

import Foundation
import TTBaseUIKit
import CoreML

class HeaderView: TTBaseUIView {
    
    let imageAuthor:TTUIImageCircleView = TTUIImageCircleView(imageName: "logoPoem", contentMode: .scaleToFill)
    let tilteLabel:TTBaseUILabel = TTBaseUILabel(withType: .HEADER, text: "POEM AUTH FINDER", align: .center)
    let subTitleLabel:TTBaseUILabel = TTBaseUILabel(withType: .SUB_TITLE, text: "Nhập đoạn thơ cần tìm", align: .center)
    let noteTextView:TTBaseUITextView = TTBaseUITextView()
    
    let tagTitleLabel:TTBaseUILabel = TTBaseUILabel(withType: .SUB_TITLE, text: "Tagger Type", align: .left).setBold()
    let typeSegView:UISegmentedControl = UISegmentedControl(items: ["word","sentence","paragraph","document"])
    
    let clearButton:TTBaseUIButton = TTBaseUIButton(textString: "CLEAR", type: .DEFAULT, isSetSize: false)
    let findButtonView:TTBaseUIButton = TTBaseUIButton(textString: "DỰ ĐOÁN", type: .WARRING, isSetSize: false)
    
    var didSelectedTaggerType:( (_  type:NSLinguisticTaggerUnit) -> ())?
        
    override func updateBaseUIView() {
        super.updateBaseUIView()
        
        self.setBgColor(.clear)
        self.imageAuthor.setImage(with: "logoPoem", scale: .scaleToFill)
        
        self.noteTextView.isScrollEnabled = false
        self.noteTextView.setBorder(with: 0, color: .clear, coner: 15)
        
        self.noteTextView.textAlignment = .center
        
        self.typeSegView.selectedSegmentIndex = 0
        self.typeSegView.addTarget(self, action: #selector(self.selectionDidChange(_:)), for: .valueChanged)
        
        self.addSubview(self.imageAuthor)
        self.addSubview(self.tilteLabel)
        self.addSubview(self.subTitleLabel)
        self.addSubview(self.noteTextView)
        
        self.addSubview(self.tagTitleLabel)
        self.addSubview(self.typeSegView)
        
        self.addSubview(self.clearButton)
        self.addSubview(self.findButtonView)
        
        self.imageAuthor.setWidthAnchor(constant: 90).setHeightAnchor(constant: 90)
            .setCenterXAnchor(constant: 0)
            .setTopAnchor(constant: 10)
        
        self.tilteLabel.setVerticalContentHuggingPriority()
            .setTopAnchorWithAboveView(nextToView: self.imageAuthor, constant: 10)
            .setLeadingAnchor(constant: 10).setTrailingAnchor(constant: 10)

        self.subTitleLabel.setVerticalContentHuggingPriority()
            .setTopAnchorWithAboveView(nextToView: self.tilteLabel, constant: 4)
            .setLeadingAnchor(constant: 10).setTrailingAnchor(constant: 10)
        
        
        self.noteTextView.setTopAnchorWithAboveView(nextToView: self.subTitleLabel, constant: 10)
            .setLeadingAnchor(constant: 20).setTrailingAnchor(constant: 20)
            .heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        
        
        self.tagTitleLabel.setFullContentHuggingPriority()
            .setLeadingAnchor(constant: 20).setTrailingWithNextToView(view: self.typeSegView, constant: 10)
            .centerYAnchor.constraint(equalTo: self.typeSegView.centerYAnchor, constant: 0).isActive = true
        
        self.typeSegView.translatesAutoresizingMaskIntoConstraints = false
        self.typeSegView.setHeightAnchor(constant: 30)
            .setTopAnchorWithAboveView(nextToView: self.noteTextView, constant: 10)
            .setTrailingAnchor(constant: 20)
        
        self.clearButton.setTopAnchorWithAboveView(nextToView: self.typeSegView, constant: 20)
            .setLeadingAnchor(constant: 80)
            .setBottomAnchor(constant: 0)
            .setWidthAnchor(constant: 90)
            .heightAnchor.constraint(greaterThanOrEqualToConstant: 35).isActive = true
        
        self.findButtonView.setTopAnchorWithAboveView(nextToView: self.typeSegView, constant: 20)
            .setLeadingWithNextToView(view: self.clearButton, constant: 10)
            .setTrailingAnchor(constant: 80)
            .setBottomAnchor(constant: 0)
            .heightAnchor.constraint(greaterThanOrEqualToConstant: 35).isActive = true
        
        
        
        self.clearButton.onTouchHandler = { _ in
            self.noteTextView.text = ""
        }
    }
    
    
    @objc fileprivate func selectionDidChange(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        self.didSelectedTaggerType?(NSLinguisticTaggerUnit.init(rawValue: index)!)
    }
    
}
