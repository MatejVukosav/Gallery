//
//  AlbumsViewController.swift
//  Gallery
//
//  Created by user on 2/14/17.
//  Copyright © 2017 vuki. All rights reserved.
//

import UIKit

let reuseAlbumIdentifier="Cell"

//prikazuje albume
class AlbumsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var albums:[AlbumInfo]=[AlbumInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        
        
        //ne mogu i klasu i nib koristit, sta je bolje? 
       // self.tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: reuseAlbumIdentifier)
        
        self.tableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: reuseAlbumIdentifier)
        self.navigationItem.title="Gallery"
        
        //izrada albuma
        let albumStareSlike=AlbumInfo(name:"StareSlike",orderNum:0,numOfElements:21)
        let albumRandom=AlbumInfo(name:"Random",orderNum:1,numOfElements:7)
        let albumPriroda=AlbumInfo(name:"Priroda",orderNum:2,numOfElements:11)
        let albumGrad=AlbumInfo(name:"Grad",orderNum:3,numOfElements:17)
        let albumOdmor=AlbumInfo(name:"Odmor",orderNum:4,numOfElements:4)
        let albumPrivatno=AlbumInfo(name:"Privatno",orderNum:5,numOfElements:1)
        

        //dohvati albume
        albums.append(albumStareSlike)
        albums.append(albumRandom)
        albums.append(albumPriroda)
        albums.append(albumGrad)
        albums.append(albumOdmor)
        albums.append(albumPrivatno)
        
    }

    //moram te dvije metode implementirat za protokol UITableViewDataSource
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: reuseAlbumIdentifier, for: indexPath) as! AlbumTableViewCell
        
        cell.setup(name:albums[indexPath.item].name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return albums.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //dohvatit od nekud broj slika
        let album:AlbumInfo=albums[indexPath.item]
        let picturesView=PicturesViewController(numOfPictures:album.numOfElements,nameOfAlbum:album.getAlbumAssetsName())
     
        navigationController?.pushViewController(picturesView, animated: true)
    }
 
}
