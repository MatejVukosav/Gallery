//
//  AlbumCollectionViewCell.swift
//  Gallery
//
//  Created by user on 2/14/17.
//  Copyright © 2017 vuki. All rights reserved.
//

import UIKit

//izgled album elementa
class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumName: UILabel!
    
    func setup(name:String){
        if !name.isEmpty{
        albumName.text=name
        }else{
            albumName.text="name je prazan"
        }
    }
    
    
}
