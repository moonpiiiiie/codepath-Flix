//
//  GridDetailsViewController.swift
//  Flix
//
//  Created by Cheng Xue on 9/14/22.
//

import UIKit
import AlamofireImage

class GridDetailsViewController: UIViewController {

    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as! String
        titleLabel.sizeToFit()
        overviewLabel.text = movie["overview"] as! String
        overviewLabel.sizeToFit()
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let imageUrl = URL(string: baseUrl + posterPath)
        posterImage.af.setImage(withURL: imageUrl!)
        
        let bgPosterPath = movie["backdrop_path"] as! String
        let bgUrl = URL(string: "https://image.tmdb.org/t/p/w780" + bgPosterPath)
        bgImage.af.setImage(withURL: bgUrl!)
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
