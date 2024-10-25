//
//  UITableViewExt.swift
//  CountriesList
//
//  Created by divan on 10/23/24.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UITableViewCell for \(String(describing: T.self)), make sure the cell is registered with table view")
        }
        return cell
    }
    
    func register<T: UITableViewCell>(cellType name: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: name))
    }
}
