//
//  Extension+Configs.swift
//  PoemFinderByVIPERArchitecture
//
//  Created by Tuan Truong Quang on 2/23/21.
//

import TTBaseUIKit

extension UIViewController {
    func showNoticeView(title:String = "Thông Báo", body:String, style:TTBaseNotificationViewConfig.NOTIFICATION_TYPE = .SUCCESS, time:Double = 3.0, onShowCompleted:((_ view:TTBaseNotificationViewConfig)->Void)?=nil) {
        DispatchQueue.main.async {
            let noti = TTBaseNotificationViewConfig()
            noti.setText(with: title, subTitle: body)
            noti.durationType = .TIME(seconds: time)
            noti.type = .NOTIFICATION_VIEW
            noti.notifiType = style
            noti.onShow()
            onShowCompleted?(noti)
        }
    }
}
