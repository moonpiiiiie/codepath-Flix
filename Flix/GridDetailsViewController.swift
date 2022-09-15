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
    
    var videos = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as! String
        titleLabel.sizeToFit()
        overviewLabel.text = movie["overview"] as! String
        overviewLabel.sizeToFit()
        
        // set url for posterImage and bgImage
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let imageUrl = URL(string: baseUrl + posterPath)
        posterImage.af.setImage(withURL: imageUrl!)
 
        let bgPosterPath = movie["backdrop_path"] as! String
        let bgUrl = URL(string: "https://image.tmdb.org/t/p/w780" + bgPosterPath)
        bgImage.af.setImage(withURL: bgUrl!)
        
        // set image clickable
        posterImage.isUserInteractionEnabled = true
        posterImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
        
        // make url request for video
        let movieId = movie["id"] as! Int
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                    print(dataDictionary)
                    // TODO: Get the array of movies
                 self.videos = dataDictionary["results"] as! [[String:Any]]
              


             }
        }
        task.resume()
    }
    
    @objc func imageTap() {
        // present modally
        let vc = TrailorViewController()
        vc.key = videos[0]["key"] as! String
        self.present(vc, animated: true)
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
