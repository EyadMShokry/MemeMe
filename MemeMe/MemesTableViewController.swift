//
//  MemesTableViewController.swift
//  MemeMe
//
//  Created by Eyad Shokry on 12/18/18.
//  Copyright © 2018 Eyad Shokry. All rights reserved.
//

import UIKit

class MemesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView?.reloadData()
    }
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell", for: indexPath) as! MemeTableViewCell
        cell.memeImage.image = memes[indexPath.row].memedImage
        cell.memeText.text = memes[indexPath.row].topText + " " + memes[indexPath.row].bottomText
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "memeDetails") as! MemeDetailsViewController
        detailsVC.memeIndex = indexPath.row
        navigationController?.pushViewController(detailsVC, animated: true)
    }

    @IBAction func onClickAddMemeButton(_ sender: UIBarButtonItem) {
        let MemeEditorVC = storyboard!.instantiateViewController(withIdentifier: "memeEditor") as! MemeEditorViewController
        self.present(MemeEditorVC, animated: true, completion: nil)
    }
    
}
