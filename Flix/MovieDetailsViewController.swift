//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Cheng Xue on 9/14/22.
//

import UIKit
import AlamofireImage


class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backgroundPoster: UIImageView!
    
    @IBOutlet weak var poster: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var overview: UILabel!
    
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as! String
        titleLabel.sizeToFit()
        overview.text = movie["overview"] as! String
        overview.sizeToFit()
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let imageUrl = URL(string: baseUrl + posterPath)
        poster.af.setImage(withURL: imageUrl!)
        
        let bgPosterPath = movie["backdrop_path"] as! String
        let bgUrl = URL(string: "https://image.tmdb.org/t/p/w780" + bgPosterPath)
//        let filter = BlurFilter(blurRadius: 2)
        backgroundPoster.af.setImage(withURL: bgUrl!)
        
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
