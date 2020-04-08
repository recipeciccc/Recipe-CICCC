//
//  SavedRecipeViewController.swift
//  Recipe-CICCC
//
//  Created by 北島　志帆美 on 2020-03-15.
//  Copyright © 2020 Argus Chen. All rights reserved.
//

import UIKit

class SavedRecipeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "Cell"
    
    var savedRecipes:[RecipeDetail] = []
    
    var isSavingRecipe: Bool?
    var savingRecipeID: String?
    let dataManger = UserdataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
    self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.navigationItem.title = "Saved"
        
        
        if isSavingRecipe! {
           
            let alertController = UIAlertController(title: "Do you save this recipe?", message: "", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "OK", style: .default, handler: { action in
                self.dataManger.saveRecipe(recipeID: self.savingRecipeID!)
                // call the fucntions to retrieve recipeId and recipeimage
                self.collectionView.reloadData()
            })
            alertController.addAction(yesAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true)
        
    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SavedRecipeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "savedRecipes", for: indexPath) as? SavedRecipesCollectionViewCell)!
    
        // Configure the cell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 2) / 3
        let height = width
        return CGSize(width: width, height: height)
    }
    
}

