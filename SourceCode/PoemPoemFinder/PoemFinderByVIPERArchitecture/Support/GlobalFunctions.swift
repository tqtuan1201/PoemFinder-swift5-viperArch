//
//  GlobalFunctions.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/22/21.
//

import TTBaseUIKit

var XSize:SizeConfig { get { return TTBaseUIKitConfig.getSizeConfig() } }
var XView:ViewConfig { get { return TTBaseUIKitConfig.getViewConfig() } }
var XFont:FontConfig { get { return TTBaseUIKitConfig.getFontConfig() } }


func XTextU(_ key:String) -> String{
    return key.localize(withBundle: Bundle.main).uppercased()
}

func XText(_ author:String) -> String {
    if author.lowercased() == "Xu√¢n Di·ªáu".lowercased() { return "Xuân Diệu" }
    if author.lowercased() == "H√†n M·∫∑c T·ª≠".lowercased() { return "Hàn Mặc Tử" }
    if author.lowercased() == "H·ªì Xu√¢n H∆∞∆°ng".lowercased() { return "Hồ Xuân Hương" }
    if author.lowercased() == "T·∫ø Hanh".lowercased() { return "Tế Hanh" }
    if author.lowercased() == "Nguy·ªÖn Khuy·∫øn".lowercased() { return "Nguyễn Khuyến" }
    if author.lowercased() == "B√† Huy·ªán Thanh Quan".lowercased() { return "Bà Huyện Thanh Quan" }
    if author.lowercased() == "Xu√¢n Qu·ª≥nh".lowercased() { return "Xuân Quỳnh" }
    if author.lowercased() == "Huy C·∫≠n".lowercased() { return "Huy Cận" }
    if author.lowercased() == "Nguy·ªÖn Khoa ƒêi·ªÅm".lowercased() { return "Nguyễn Khoa Điềm" }
    if author.lowercased() == "Th·∫ø L·ªØ".lowercased() { return "Thế Lữ" }
    
    return author
}



