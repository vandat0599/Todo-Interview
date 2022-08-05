//
//  ProductCell.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(product: Product) {
        nameLabel.text = "Name: \(product.name)"
        priceLabel.text = "Price: \(product.price)"
        quantityLabel.text = "Quantity: \(product.quantity)"
    }
}
