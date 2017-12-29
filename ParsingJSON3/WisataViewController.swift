//
//  WisataViewController.swift
//  ParsingJSON3
//
//  Created by Audi Dharmawan on 29/12/17.
//  Copyright © 2017 Audi Dharmawan. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class WisataViewController: UIViewController {

    
    @IBOutlet weak var gambarView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    var wisatasatu:WisataDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = wisatasatu?.title
        descLabel.text = wisatasatu?.description
        
        let urlString = "http://dev.gits.id:1090/uploads/images/"+(wisatasatu?.url_image)!
        let url = URL(string: urlString)
        gambarView.downloadedFrom(url: url!)
    }
    
}
