//
//  ViewController.swift
//  colorTest
//
//  Created by Alex on 7/9/18.
//  Copyright © 2018 SweatNet. All rights reserved.
//

import UIKit
import HSLuvSwift

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var colors: [UIColor] = []
    var h: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        cell.backgroundColor = self.colors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    @IBAction func addColorButtonPressed(_ sender: Any) {
        let color = createColor()
        self.colors.append(color!)
        self.collectionView.reloadData()
    }
    
    func createColor() -> UIColor? {
        let golden_ratio_conjugate = CGFloat(0.618033988749895)
        h += golden_ratio_conjugate
        h = h.truncatingRemainder(dividingBy: 1.0)
        let color = UIColor(hue: Double(h*360.0), saturation: 50.0, lightness: 50.0, alpha: 50.0)
        return color
    }
}

