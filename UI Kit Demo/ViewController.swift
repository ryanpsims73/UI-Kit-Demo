//
//  ViewController.swift
//  UI Kit Demo
//
//  Created by Ryan Sims on 10/27/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var pinkView: UIView!
    @IBOutlet weak var goldView: UIView!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var property: UIDynamicItemBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set where the physics view is run
        animator = UIDynamicAnimator(referenceView: view)
        
        // create a behavior
        gravity = UIGravityBehavior()
        
        // add the behavior to an animator class
        animator.addBehavior(gravity)
        
        // collision
        collision = UICollisionBehavior()
        collision.collisionDelegate = self
        collision.addBoundaryWithIdentifier("ground", fromPoint: CGPoint(x: 0, y: 568), toPoint: CGPoint(x: 320, y: 568))
        collision.addItem(pinkView)
        collision.addItem(goldView)
        animator.addBehavior(collision)
        
        // properties
        property = UIDynamicItemBehavior()
        property.allowsRotation = false
        property.elasticity = 1.2
        property.addItem(goldView)
        property.addItem(pinkView)
        animator.addBehavior(property)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onGravityTap(sender: AnyObject) {
        gravity.addItem(pinkView)
        gravity.addItem(goldView)
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        println("began collision with item")
    }

}

