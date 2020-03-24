//
//  creatorCellRecpipeTableViewCell.swift
//  RecipeTest
//
//  Created by 北島　志帆美 on 2019-11-28.
//  Copyright © 2019 北島　志帆美. All rights reserved.
//

import UIKit
import Firebase

protocol AddingFollowersDelegate: class {
    func increaseFollower(userID: String, followerID: String)
}


class creatorCellRecpipeTableViewCell: UITableViewCell {

    let numOfCreatorhasTableViewCell = NumOfCreatorhasTableViewCell()
    
    weak var delegate: AddingFollowersDelegate?

//    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var labelCreator: UIButton!
    @IBOutlet weak var imgCreator: UIButton!
    
    var userID: String?
    
    let uid = Auth.auth().currentUser?.uid
    
    @IBAction func followerAdding(_ sender: Any) {
        self.delegate?.increaseFollower(userID: userID!, followerID: uid!)
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
