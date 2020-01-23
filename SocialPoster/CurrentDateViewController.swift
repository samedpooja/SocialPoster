//
//  CurrentDateViewController.swift
//  SocialPoster
//
//  Created by Pooja on 23/00/2020.
//  Copyright © 2020 Tagrem. All rights reserved.
//

import UIKit

class CurrentDateViewController: UIViewController {
    
    
    @IBOutlet weak var currentDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
               //****PAGE CURL*****
        let LeftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        LeftSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(LeftSwipe)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM"
        let now = Date()
        let dateString = formatter.string(from:now)

        currentDate.text = String(dateString)
       
    }
    override func viewDidAppear(_ animated: Bool) {
        self.view.gestureRecognizers?.removeAll()
        let LeftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        LeftSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(LeftSwipe)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   //**************PAGE CURL**********
    func curlUp() {
        
        let cardBack = self.storyboard?.instantiateViewController(withIdentifier: "view") as!  ViewController
self.present(cardBack, animated: true, completion: nil)
        UIView.transition(from: self.view,
                          to: cardBack.view,
                          duration: 2.0,
                          options: .transitionCurlUp,
                          completion: { _ in

        })
        
    }
    
    @objc func  swipeAction(swipe:UISwipeGestureRecognizer) {
        curlUp()
        print("swiped")
        
    }



}
