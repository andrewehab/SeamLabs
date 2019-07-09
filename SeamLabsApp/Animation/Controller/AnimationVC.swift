//
//  animation.swift
//  SeamLabsApp
//
//  Created by AnDy on 7/9/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import UIKit
import Lottie

class AnimationVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Animation
        let animationView = AnimationView(name: "animation-w1080-h1080")
        animationView.frame = CGRect(x: 0, y: 0, width: view2.frame.width, height: view2.frame.height)
        animationView.loopMode = .loop
        view2.addSubview(animationView)
        animationView.play()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        run(after: 5) {
            self.checkUserLogined()
        }
    }
    
    // delay function
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
    
    func checkUserLogined(){
        
        let userDefaults = UserDefaults.standard
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let _ = userDefaults.value(forKey: "requestToken") {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let authVC = storyboard.instantiateViewController(withIdentifier: "TabBarVC")
            appDelegate.window?.rootViewController = authVC
        }else {
            let storyboard = UIStoryboard.init(name: "Auth", bundle: nil)
            let authVC = storyboard.instantiateViewController(withIdentifier: "AuthVC")
            appDelegate.window?.rootViewController = authVC
        }
        
    }
    
    
    
}
