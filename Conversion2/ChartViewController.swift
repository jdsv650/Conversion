//
//  ChartViewController.swift
//  Conversion2
//
//  Created by James on 11/19/15.
//  Copyright © 2015 James. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
     var imageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        // 1

       let image = UIImage(named: "fractions-to-decimals2.png")!
        imageView = UIImageView(image: image)
        
        
       // imageView.image = UIImage(named: "newicon.png")
        
       imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size:image.size)
       scrollView.addSubview(imageView)
    
        
        // 2
        scrollView.contentSize = image.size
        
        // 3
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ChartViewController.scrollViewDoubleTapped(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        // 4
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        scrollView.minimumZoomScale = minScale;
        
        // 5
        scrollView.maximumZoomScale = 2.0
        scrollView.zoomScale = minScale;
        
        // 6
        centerScrollViewContents()

        
    }
    
    
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        imageView.frame = contentsFrame
    }

    
    @objc func scrollViewDoubleTapped(_ recognizer: UITapGestureRecognizer) {
        // 1
        let pointInView = recognizer.location(in: imageView)
        
        // 2
        var newZoomScale = scrollView.zoomScale * 0.5
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        
        // 3
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w / 2.0)
        let y = pointInView.y - (h / 2.0)
        
        let rectToZoomTo = CGRect(x: x, y: y, width: w, height: h);
        
        // 4
        scrollView.zoom(to: rectToZoomTo, animated: true)
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    


}
