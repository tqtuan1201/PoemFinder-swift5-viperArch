//
//  ComponentFactory.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//

import TTBaseUIKit

enum ComponentType {
    case HeaderView
    case TableView
    case Label
    case ButtonDef
    case ButtonWarning
}

class ComponentFactory {
    private init() {}
    
    static func createView(component: ComponentType) ->  UIView {
        switch component {
        case .HeaderView:
            let headerView:HeaderView = HeaderView()
            return headerView
        case .TableView:
            let baseTable:TTBaseUITableView = TTBaseUITableView(style: .grouped, bgColor: .clear, isShowCroll: true, isSetContent: false)
            return baseTable
        case .Label:
            let baseLabel:TTBaseUILabel = TTBaseUILabel(withType: .TITLE, text: "Def label", align: .left)
            return baseLabel
        case .ButtonDef:
            let buttonDef:TTBaseUIButton = TTBaseUIButton(textString: "Def Button", type: .DEFAULT, isSetSize: false)
            return buttonDef
        case .ButtonWarning:
            let buttonWar:TTBaseUIButton = TTBaseUIButton(textString: "War Button", type: .WARRING, isSetSize: false)
            return buttonWar
        }
    }
}
