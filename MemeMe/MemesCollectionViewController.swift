//
//  MemesCollectionViewController.swift
//  MemeMe
//
//  Created by Eyad Shokry on 12/19/18.
//  Copyright © 2018 Eyad Shokry. All rights reserved.
//

import UIKit

class MemesCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var memesCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    let reuseIdentifier = "memeItem"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memesCollectionView.dataSource = self
        memesCollectionView.delegate = self
        memesCollectionView.allowsMultipleSelection = false
        
        configureFlowLayout(space: 3.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.isStatusBarHidden = false
        memesCollectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        // Configure the cell
        cell.memeImage.image = memes[indexPath.row].memedImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "memeDetails") as! MemeDetailsViewController
        detailsVC.memeIndex = indexPath.row
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    @IBAction func onClickAddMemeButton(_ sender: Any) {
        let MemeEditorVC = storyboard!.instantiateViewController(withIdentifier: "memeEditor") as! MemeEditorViewController
        self.present(MemeEditorVC, animated: true, completion: nil)
    }
    
    func configureFlowLayout(space: CGFloat) {
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
}
