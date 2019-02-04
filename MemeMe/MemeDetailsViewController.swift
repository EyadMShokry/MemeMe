//
//  MemeDetailsViewController.swift
//  MemeMe
//
//  Created by Eyad Shokry on 12/19/18.
//  Copyright © 2018 Eyad Shokry. All rights reserved.
//

import UIKit

class MemeDetailsViewController: UIViewController {
    @IBOutlet weak var memedImage: UIImageView!
    var memeIndex: Int?
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memedImage.image = memes[memeIndex!].memedImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}
