//
//  ViewController.swift
//  swiftUiHostingtoUIkit
//
//  Created by erhan demirci on 2.10.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        layout.sectionInset = .zero
        layout.collectionView?.backgroundColor = .yellow
        layout.itemSize = CGSize(width: 320, height: 100)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        NSLayoutConstraint.activate([  collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                       collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                       collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                       collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
      
    }


}


extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration {
            HStack {
                Image(systemName: "star").foregroundStyle(.purple)
                Text("Favorites")
                Spacer()
            }
        }
        .background {
            Color.blue
        }
        
        return cell
    }
    
    
    
}
