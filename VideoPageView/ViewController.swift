//
//  ViewController.swift
//  VideoPageView
//
//  Created by Ethan Fan on 9/3/15.
//  Copyright © 2015 Ethan Fan. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UIPageViewControllerDataSource {

    private var pageViewController : PageViewController!
    var URLs = ["http://www.html5videoplayer.net/videos/toystory.mp4", "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4", "http://techslides.com/demos/sample-videos/small.mp4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("pagevc") as! PageViewController
        pageViewController.dataSource = self
        
        let startingvc = self.viewControllerAtIndex(0)
        let viewControllers = [startingvc!]
        
        self.pageViewController.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
      
        //pageViewController.view.frame = CGRectMake(0, 0, self., <#T##height: CGFloat##CGFloat#>)
    
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        
        var index = (viewController as! PlayerViewController).pageIndex!
        
        if index == 0 || index == NSNotFound{
            return nil
        }
    
        --index
        
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! PlayerViewController).pageIndex!
        
        if index == NSNotFound{
            return nil
        }
       
        ++index
        
        if index == 3 {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    private func viewControllerAtIndex(index : Int) -> PlayerViewController?{
        if index >= 3{
            return nil
        }
        
        let playervc = self.storyboard?.instantiateViewControllerWithIdentifier("pagecontent") as! PlayerViewController
        
        playervc.pageIndex = index
        playervc.videoURL = URLs[index]
        
        return playervc
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//  
//        
//        if segue.identifier == "showMovie"{
//            
//            let playerViewController = segue.destinationViewController as! PlayerViewController
//            let videoURL = NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//            playerViewController.player = AVPlayer(URL: videoURL!)
//            
//        }
//        
//    }


}

