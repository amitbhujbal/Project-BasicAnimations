//
//  ViewController.swift
//  Project-BasicAnimations
//
//  Created by Amit Bhujbal on 25/02/2026.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var originalImageViewCenter: CGPoint!
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        originalImageViewCenter = imageView.center
        
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.black.cgColor
    }

    //MARK: Reset & Clear Button
    @IBAction func resetButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.imageView.transform = .identity
            self.imageView.center = self.originalImageViewCenter
        }
    }
    
    //MARK: Enlarge Animate & Button
    @IBAction func enlargeButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
    
    //MARK: Move Animate & Button
    @IBAction func moveButton(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.imageView.center.x += 100
        }
    }

    //MARK: Rotate Animate & Button
    @IBAction func rotateButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.imageView.transform = self.imageView.transform.rotated(by: .pi / 4)
        }
    }
    
    //MARK: Shake Animate & Button
    @IBAction func shakeButton(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.imageView.center.x - 10, y: self.imageView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.imageView.center.x + 10, y: self.imageView.center.y))
        self.imageView.layer.add(animation, forKey: "position")
    }
    
    //MARK: Drop Animate & Button
    @IBAction func dropButton(_ sender: Any) {
        let originalCenter = self.imageView.center
        
        UIView.animate(withDuration: 1.0, animations: {
            self.imageView.center.y += 100
        }) {_ in
            UIView.animate(withDuration: 1.0) {
                self.imageView.center = originalCenter
            }
        }
    }
    
    //MARK: Scale Animate & Button
    @IBAction func scaleButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) {_ in
            UIView.animate(withDuration: 0.5) {
                self.imageView.transform = .identity
            }
        }
    }
}

