//
//  RestaurantDetailViewController.swift
//  Yelpy
//
//  Created by LINNI on 10/4/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var reviewNumber: UILabel!
    
    var r: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImage.af.setImage(withURL: r.imageURL!)
        restaurantName.text = r.name
        ratingImage.image = Stars.dict[r.rating]!
        reviewNumber.text = String(r.reviews)
        
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
