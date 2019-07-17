//
//  ViewController.swift
//  OnBoardingScreenDemo
//
//  Created by User on 17/07/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
     var onboardingSlides:[Onboarding] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        self.createOnboardingSlides()
       
        
    }
    

    func createOnboardingSlides(){
        onboardingSlides = Onboarding.instance.createSlide()
        setupSlideScrollView(slides: onboardingSlides)
        
        pageController.numberOfPages = onboardingSlides.count
        pageController.currentPage = 0
        view.bringSubviewToFront(pageController)
    }

    
    func setupSlideScrollView(slides : [Onboarding]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        print("frame height \(view.frame.height)")
        print("frame width \(view.frame.width)")
        print("frame width \(scrollView.frame.width)")
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(onboardingSlides.count), height: 1)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width , height: view.frame.height)
            print("slides x is \(slides[i].frame.origin.x)")
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageController.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        print("offset if \(percentOffset.x)")
        if(percentOffset.x > 0.30 && percentOffset.x <= 0.50) {
            
            UIView.animate(withDuration: 0.6,
                           delay: 0,
                           options: .curveEaseOut, //just an example, check UIViewAnimationOptions
                animations: {
                    self.onboardingSlides[0].imgView.alpha = 0.75
                    self.onboardingSlides[1].imgView.alpha = 1.0
            })
            
            
        }  else if(percentOffset.x > 0.70 && percentOffset.x <= 1) {
            //onboardingSlides[1].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            //onboardingSlides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
            UIView.animate(withDuration: 0.6,
                           delay: 0,
                           options: .curveEaseOut, //just an example, check UIViewAnimationOptions
                animations: {
                    self.onboardingSlides[2].imgView.alpha = 1.0
                    self.onboardingSlides[1].imgView.alpha = 0.75
            })
        } else if(percentOffset.x < 0.70 && percentOffset.x > 0.30){
            UIView.animate(withDuration: 0.6,
                           delay: 0,
                           options: .curveEaseOut, //just an example, check UIViewAnimationOptions
                animations: {
                    self.onboardingSlides[1].imgView.alpha = 1.0
                    self.onboardingSlides[2].imgView.alpha = 0.30
            })
        } else if(percentOffset.x < 0.30){
            UIView.animate(withDuration: 0.6,
                           delay: 0,
                           options: .curveEaseOut, //just an example, check UIViewAnimationOptions
                animations: {
                    self.onboardingSlides[0].imgView.alpha = 1.0
                    self.onboardingSlides[1].imgView.alpha = 0.75
                    self.onboardingSlides[2].imgView.alpha = 0.75
            })
        }
    }
    
}

