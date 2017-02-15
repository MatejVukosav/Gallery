//
//  AlbumInfo.swift
//  Gallery
//
//  Created by user on 2/14/17.
//  Copyright © 2017 vuki. All rights reserved.
//

import Foundation


class AlbumInfo {

    //Dali radit gettere i settere ili stavit varijable public
    
     var name:String=""
     var numOfElements:Int=0
     var orderNum:Int=0
     var images: [PictureInfo]=[PictureInfo]()
    
    init(name:String,orderNum:Int,numOfElements:Int){
        self.orderNum=orderNum
        self.name=name
        self.numOfElements=numOfElements
    }
    
    func getAlbumAssetsName()->String{
        return "slika_\(orderNum)_\(name)_"
    }
    
    
    
}
