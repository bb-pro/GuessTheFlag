//
//  TabBarViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 22/02/23.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
