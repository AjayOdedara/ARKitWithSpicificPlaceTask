//
//  LocationTableViewCell.swift
//  ARWithLocationTask
//
//  Created by admin on 18/02/18.
//  Copyright © 2018 Aj. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var locationName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setProductData(product:LocationCollection)
    {
        self.locationName.text = product.locationName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
