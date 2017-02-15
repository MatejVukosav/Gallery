//
//  PicturesViewController.swift
//  Gallery
//
//  Created by user on 2/14/17.
//  Copyright © 2017 vuki. All rights reserved.
//

import UIKit

//kakav reuse identifier ??
private let reuseIdentifierCollectionView="Cell"

//prikazuje slike iz albuma
class PicturesViewController:  UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    private var nameOfAlbum:String=""
    private var numOfPictures=0
    
    private var pictures:[PictureInfo]=[PictureInfo]()
    
    convenience init(numOfPictures: Int,nameOfAlbum:String) {
        self.init()
        self.numOfPictures = numOfPictures
        self.nameOfAlbum=nameOfAlbum
        
        for i in 0 ... numOfPictures{
            pictures.append(PictureInfo(name:"\(nameOfAlbum)\(i)"))
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //to loada iz koda i tako ne radi??
 //       collectionView?.register(PictureCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierCollectionView)
        
        
        
        let nibName = UINib(nibName: "PictureCollectionViewCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: reuseIdentifierCollectionView)
        
        collectionView.delegate=self
        collectionView.dataSource=self

        self.navigationItem.title=nameOfAlbum
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout,
            let width = collectionView?.frame.width {
            layout.itemSize = CGSize(width: width/4, height: width/4)
            
            
            //kako slozit ove stvari da view bude centriran??
            layout.minimumLineSpacing = 20
            //ako stavim 10 onda budu 3 kolone ??
            layout.minimumInteritemSpacing = 0

        }
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCollectionView, for: indexPath) as! PictureCollectionViewCell
        
        let path=pictures[indexPath.item].name
        cell.image.image=UIImage(named:path)
        cell.image.contentMode=UIViewContentMode.scaleAspectFit

        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let picture=pictures[indexPath.item]
        let detailsView=PictureDetailsViewController(name:picture.name)
        navigationController?.pushViewController(detailsView, animated: true)
    }
    
}
