//
//  RestaurantListCollectionViewController.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 09/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class RestaurantListCollectionViewController: UICollectionViewController {    
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let notCenter = NotificationCenter.default
//        notCenter.addObserver(self, selector: #selector(updateData(_:)), name: NSNotification.Name(Constants.Notifications.modelUpdated), object: nil)
        
        notCenter.addObserver(forName: NSNotification.Name(Constants.Notifications.modelUpdated), object: nil, queue: OperationQueue.main) { (note) in
            self.collectionView?.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView?.reloadData()
    }
    
    deinit {
        //Inutile à partir d'iOS 9, mais obligatoire avant
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Utilities
    
    func updateData(_ note: Notification) {
        collectionView?.reloadData()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showDetails" {
            guard let destination = segue.destination as? RestaurantDetailsViewController else { return }
            guard let cell = sender as? RestaurantCollectionViewCell else { return }
            guard let indexpath = collectionView?.indexPath(for: cell) else { return }
            
            // Ne pas chatouiller les outlets ! Ils valent encore nil à ce stade.
            destination.restaurant = RestaurantDirectory.shared.list()[indexpath.row]
        } else if segue.identifier == "showForm" {
            
        }
    }
    
    

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return RestaurantDirectory.shared.list().count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restoCell", for: indexPath)
    
        if let c = cell as? RestaurantCollectionViewCell {
            let resto = RestaurantDirectory.shared.list()[indexPath.row]
            c.configureCell(with: resto)
        }
    
        if indexPath.row%2 == 0 {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.yellow
        }
        
        
        return cell
    }
}

extension RestaurantListCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
         return CGSize(width: width, height: 100)
    }
}
