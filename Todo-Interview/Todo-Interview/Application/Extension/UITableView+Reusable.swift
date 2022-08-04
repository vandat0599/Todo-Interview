//
//  UITableView+Reusable.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation
import UIKit

extension UITableViewCell: Reusable { }

extension UITableView {
    func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID,
                                             for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
}
