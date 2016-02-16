//
//  ViewController.swift
//  SwipePresentTransition
//
//  Created by LiChunyu on 16/1/31.
//  Copyright © 2016年 leacode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var customTransitionDelegate: SwipeTransitionDelegate = SwipeTransitionDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func interactiveTransitionRecognizerAction(sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .Began {
            self.performSegueWithIdentifier("CustomTransition", sender: sender)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "CustomTransition" {
            let destinationVC = segue.destinationViewController
            if sender is UIScreenEdgePanGestureRecognizer {
                customTransitionDelegate.gestureRecognizer = sender as! UIScreenEdgePanGestureRecognizer
            } else {
                customTransitionDelegate.gestureRecognizer = nil
            }
            customTransitionDelegate.targetEdge = .Right
            destinationVC.transitioningDelegate = customTransitionDelegate
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.FullScreen
        }
        
    }
    
    @IBAction func unwindToSwipeFirstViewController(sender: UIStoryboardSegue) {

    }
    

}

