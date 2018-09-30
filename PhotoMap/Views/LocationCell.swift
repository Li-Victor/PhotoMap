//
//  LocationCell.swift
//  PhotoMap
//
//  Created by Victor Li on 9/30/18.
//  Copyright © 2018 Victor Li. All rights reserved.
//

import UIKit
import AlamofireImage

class LocationCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var location: NSDictionary! {
        didSet {
            nameLabel.text = location["name"] as? String
            addressLabel.text = location.value(forKeyPath: "location.address") as? String
            
            let categories = location["categories"] as? NSArray
            if (categories != nil && categories!.count > 0) {
                let category = categories![0] as! NSDictionary
                let urlPrefix = category.value(forKeyPath: "icon.prefix") as! String
                let urlSuffix = category.value(forKeyPath: "icon.suffix") as! String
                
                let url = "\(urlPrefix)bg_32\(urlSuffix)"
                categoryImageView.af_setImage(withURL: URL(string: url)!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
