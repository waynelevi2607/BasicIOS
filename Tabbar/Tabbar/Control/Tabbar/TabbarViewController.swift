//
//  TabbarViewController.swift
//  Tabbar
//
//  Created by Khoa Vo T.A. on 2/29/20.
//  Copyright © 2020 Khoa Vo.T.A. All rights reserved.
//

import UIKit
enum TabbarItem: Int, CaseIterable {
    case home = 0
    case favorites
    case map
    case settings

    var title: String? {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .map: return "Map"
        case .settings: return "Settings"
        }
    }
    var icon: UIImage? {
        switch self {
        case .home: return #imageLiteral(resourceName: "ic-home")
        case .favorites: return #imageLiteral(resourceName: "ic-star")
        case .map: return #imageLiteral(resourceName: "ic-map")
        case .settings: return #imageLiteral(resourceName: "ic-settings")
        }
    }
}

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    // MARK: - Properties
    private let homeNavi = UINavigationController(rootViewController: HomeViewController())
    private let favoritesNavi = UINavigationController(rootViewController: FavoritesViewController())
    private let mapNavi = UINavigationController(rootViewController: MapViewController())
    private let settingsNavi = UINavigationController(rootViewController: SettingsViewController())
    private var index: Int = 0
    private var items: [(vc: UINavigationController, tb: TabbarItem)] = []
    static weak var shared: TabBarController?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewControllers()
        configUI()
    }
    
    // MARK: - Private
    private func configViewControllers() {
        viewControllers = [homeNavi, favoritesNavi, mapNavi, settingsNavi]
        items = [(homeNavi, .home), (favoritesNavi, .favorites), (mapNavi, .map), (settingsNavi, .settings)]
        for (index, item) in items.enumerated() {
            item.vc.tabBarItem = UITabBarItem(title: item.tb.title, image: item.tb.icon, tag: index)
            item.vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        }
    }

    private func configUI() {
        tabBar.tintColor = .red
        tabBar.barTintColor = .white
        view.backgroundColor = .white
        delegate = self
    }

    func moveToTab(_ tabbarItem: TabbarItem) {
        if selectedIndex != tabbarItem.rawValue {
            selectedIndex = tabbarItem.rawValue
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navi = tabBarController.viewControllers?[selectedIndex] as? UINavigationController else { return }
        let vc = navi.viewControllers.first
        switch vc {
        case is HomeViewController:
            guard index != selectedIndex else { return }
            index = 0
            return
        case is FavoritesViewController:
            guard index != selectedIndex else { return }
            index = 1
            return
        case is MapViewController:
            guard index != selectedIndex else { return }
            index = 2
            return
        case is SettingsViewController:
            guard index != selectedIndex else { return }
            index = 3
            return
        default:
            break
        }
    }
}
