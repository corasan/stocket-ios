//
//  TabBarExtension.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/4/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

extension UITabBarController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        let standardAppearance = UITabBarAppearance()
        
        standardAppearance.backgroundColor = UIColor(named: "background")
        standardAppearance.shadowColor = .clear
        
        tabBar.standardAppearance = standardAppearance
    }
}
