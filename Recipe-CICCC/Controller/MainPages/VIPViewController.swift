//
//  VIPviewController.swift
//  Recipe-CICCC
//
//  Created by fangyilai on 2020-02-20.
//  Copyright © 2020 Argus Chen. All rights reserved.
//

import UIKit

class VIPViewController: UIViewController {

    @IBOutlet weak var collectionview: RecipeCollectionView!
    
    let dataManager = VIPDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionview.width = UIScreen.main.bounds.size.width
//        collectionview.height = UIScreen.main.bounds.size.height
        dataManager.delegate = self
        
        dataManager.findFollowing(id: nil)
        
//        collectionview.imageDictionary = [#imageLiteral(resourceName: "Intrepid-Travel-Taiwan-dumplings-Xiao-Long-Bao_577219075"),#imageLiteral(resourceName: "13PAIRING-articleLarge"),#imageLiteral(resourceName: "Lemon-Garlic-Butter-Salmon-with-Zucchini-Noodles-recipes"),#imageLiteral(resourceName: "guacamole-foto-heroe-1024x723"),#imageLiteral(resourceName: "best-salad-7"),#imageLiteral(resourceName: "anna-pelzer-IGfIGP5ONV0-unsplash"),#imageLiteral(resourceName: "huevos-rancheros"),#imageLiteral(resourceName: "no-bake-valentines-day-dessert-recipes-cheesecake-1578947615"),#imageLiteral(resourceName: "anna-pelzer-IGfIGP5ONV0-unsplash"),#imageLiteral(resourceName: "guacamole-foto-heroe-1024x723")]
//        collectionview.recipes = ["Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:","Title:\nCreator:"]

    }

}

extension VIPViewController : VIPDataManagerDelegate {
    
    func reloadRecipes(data: [RecipeDetail]) {
        collectionview.recipes = data
       loadView()
        viewDidLoad()
    }
    
    func reloadImages(data: [Int : UIImage]) {
        collectionview.imageDictionary = data
       loadView()
        viewDidLoad()
    }
}
