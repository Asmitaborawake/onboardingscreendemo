//
//  Onboarding.swift
//  OnBoardingScreenDemo
//
//  Created by User on 17/07/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class Onboarding: UIView {

  static var instance = Onboarding()
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    func createSlide() -> [Onboarding]{
        
        let slide1:Onboarding = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)?.first as! Onboarding
        slide1.imgView.image = UIImage(named: "OB1")
        slide1.imgView.alpha = 1.0
        slide1.titleLbl.text = "Send money quickly"
      //  slide1.titleLbl.textColor = .black
        slide1.descLbl.text = "Your friends and family will receive your transfer within minutes, 24/7"
       // slide1.descLbl.textColor = .black
        slide1.imgView.contentMode = .scaleAspectFit
        slide1.imgView.layer.masksToBounds = true
        
        let slide2:Onboarding = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)?.first as! Onboarding
        slide2.imgView.image = UIImage(named: "OB2")
        slide2.imgView.alpha = 0.75
        slide2.titleLbl.text = "Low cost"
       // slide2.titleLbl.textColor = .black
        slide2.descLbl.text = "We’ll always show you the costs upfront and never charge excessive fees"
       // slide2.descLbl.textColor = .black
        slide2.imgView.contentMode = .scaleAspectFit
        slide2.imgView.layer.masksToBounds = true
        
        let slide3:Onboarding = Bundle.main.loadNibNamed("Onboarding", owner: self, options: nil)?.first as! Onboarding
        slide3.imgView.image = UIImage(named: "OB3")
        slide3.imgView.alpha = 0.75
        slide3.titleLbl.text = "Trusted by millions"
       // slide3.titleLbl.textColor = .black
        slide3.descLbl.text = "22 million Mobile Money subscribers in 15 countries"
       // slide3.descLbl.textColor = .black
        slide3.imgView.contentMode = .scaleAspectFit
        slide3.imgView.layer.masksToBounds = true
        
        return[slide1,slide2,slide3]
        
        
    }
    
}
