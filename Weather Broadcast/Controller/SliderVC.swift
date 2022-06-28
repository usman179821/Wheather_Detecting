//
//  SliderVC.swift
//  Kemeti
//
//  Created by Muhammad Usman on 16/01/2022.
//

import UIKit
import Gemini

class SliderVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    //Outlets
    @IBOutlet weak var collectionView: GeminiCollectionView!
    @IBOutlet weak var loginBtn: UIButton!
    
    //Variable and properties
    let photos = ["sliderImageOne", "sliderImageTwo", "sliderImageThree"]
    
    //View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Dark and Light Mode handling
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        
        self.navigationController?.isNavigationBarHidden = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Configure the animation
        collectionView.gemini
            .cubeAnimation()
            .cubeDegree(90)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gemCell", for: indexPath) as! SliderCell
        
        cell.setCell(imageName: photos[indexPath.row])
        
        // Animate
        self.collectionView.animateCell(cell)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Animate
        self.collectionView.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        // Animate
        if let cell = cell as? SliderCell {
            self.collectionView.animateCell(cell)
        }
        
    }
    @IBAction func loginTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated:true, completion:nil)
        
    }
    
}

