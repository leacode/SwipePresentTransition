//
//  PresentedViewController.swift
//  SwipePresentTransition
//
//  Created by LiChunyu on 16/1/31.
//  Copyright © 2016年 leacode. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let interactiveTransitionRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: Selector("interactiveTransitionRecognizerAction:"))
        interactiveTransitionRecognizer.edges = UIRectEdge.Left
        self.view.addGestureRecognizer(interactiveTransitionRecognizer)
        
    }

    func interactiveTransitionRecognizerAction(sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .Began {
            self.performSegueWithIdentifier("BackToFirstViewController", sender: sender)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BackToFirstViewController" {
            if self.transitioningDelegate is SwipeTransitionDelegate {
                
                if sender is UIGestureRecognizer {
                    (self.transitioningDelegate as! SwipeTransitionDelegate).gestureRecognizer = sender as! UIScreenEdgePanGestureRecognizer
                } else {
                    (self.transitioningDelegate as! SwipeTransitionDelegate).gestureRecognizer = nil
                }
                
                (self.transitioningDelegate as! SwipeTransitionDelegate).targetEdge = UIRectEdge.Left
            }
        }
    }

}
