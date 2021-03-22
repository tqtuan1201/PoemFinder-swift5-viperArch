//
//  ResultTableViewCell.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//

import Foundation
import TTBaseUIKit

class ResultTableViewCell: TTBaseUITableViewCell {
    
    let authorLabel:TTBaseUILabel = TTBaseUILabel(withType: .TITLE, text: "Loading", align: .left)
    let processView:UIProgressView = UIProgressView()
    let precentLabel:TTBaseUILabel = TTBaseUILabel(withType: .TITLE, text: "0%", align: .center)
    
    override func updateUI() {
        super.updateUI()
        
        self.processView.setConerRadius(with: 4)
        
        self.processView.trackTintColor = UIColor.darkGray.withAlphaComponent(0.1)
        self.processView.progressTintColor = ViewConfig().labelBgDef
        
        self.processView.setProgress(Float(0), animated: true)
        self.authorLabel.setMutilLine(numberOfLine: 3, textAlignment: .left)
        
        self.panel.addSubview(self.authorLabel)
        self.panel.addSubview(self.processView)
        self.panel.addSubview(self.precentLabel)
        
        self.processView.translatesAutoresizingMaskIntoConstraints = false
        
        self.authorLabel.setVerticalContentHuggingPriority()
            .setLeadingAnchor(constant: 8)
            .setTopAnchor(constant: 8)
            .setBottomAnchor(constant: 8)
            .setTrailingWithNextToView(view: self.processView, constant: 4)
        
        self.processView.setHeightAnchor(constant: 10)
            .setcenterYAnchor(constant: 0)
            .setWidthAnchor(constant: 150)
            .setTrailingWithNextToView(view: self.precentLabel, constant: 8)
        
        self.precentLabel.setFullContentHuggingPriority()
            .setTrailingAnchor(constant: 10)
            .setcenterYAnchor(constant: 0)
    }
    
    fileprivate lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()
    
    func configureCell(_ auth:AuthorProbabilityModel) {
        self.authorLabel.setText(text: XText(auth.name))
        UIView.animate(withDuration: 0.5) {
            self.processView.setProgress(Float(auth.probability), animated: true)
        }
        
        self.precentLabel.setText(text: self.formatter.string(for: auth.probability) ?? "0%")
    }
}
