//
//  NotificationViewExtension.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 03.01.2022.
//

import UIKit

extension NotificationView {
    func goToSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                      options: [:],
                                      completionHandler: nil)
        }
    }
}
