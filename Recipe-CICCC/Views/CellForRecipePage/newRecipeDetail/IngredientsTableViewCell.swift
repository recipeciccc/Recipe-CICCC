//
//  IngredientsTableViewCell.swift
//  RecipeTest
//
//  Created by 北島　志帆美 on 2019-11-28.
//  Copyright © 2019 北島　志帆美. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameIngredientsLabel: UILabel!
    @IBOutlet weak var amountIngredientsLabel: UILabel!
    
    
//    var ingredientName = ""
//    var amountIngredient = ""
    

    
    override func awakeFromNib() {
        super.awakeFromNib()

        nameIngredientsLabel.textColor = #colorLiteral(red: 0.6666666667, green: 0.4745098039, blue: 0.2588235294, alpha: 1)
        amountIngredientsLabel.textColor = #colorLiteral(red: 0.6666666667, green: 0.4745098039, blue: 0.2588235294, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
