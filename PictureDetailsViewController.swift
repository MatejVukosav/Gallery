//
//  PictureDetailsViewController.swift
//  Gallery
//
//  Created by user on 2/14/17.
//  Copyright © 2017 vuki. All rights reserved.
//

import UIKit



class PictureDetailsViewController:UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var image: UIImageView!
    private var name : String = ""
    
    @IBOutlet weak var scrollView: UIScrollView!

    convenience init(name : String) {
        self.init()
        self.name=name
    }

    override func viewDidLoad() {
        self.navigationItem.title=name
        
        image.contentMode=UIViewContentMode.scaleAspectFit
        image.image=UIImage(named:name)
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        scrollView.delegate=self
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
 
    
  
}
