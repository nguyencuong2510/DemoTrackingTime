//
//  ViewController2.swift
//  DemoTrackingTime
//
//  Created by NguyenCuong on 3/3/18.
//  Copyright © 2018 NguyenCuong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController2: UIViewController,AVPlayerViewControllerDelegate {
    
    var playerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func play(sender: Any){
        guard let path = Bundle.main.path(forResource: "video", ofType: "mp4") else { return }
        let videoURL = URL(fileURLWithPath: path)
        let player = AVPlayer(url: videoURL)
        
        playerViewController = AVPlayerViewController()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didfinishplaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        playerViewController.player = player
        
        playerViewController.allowsPictureInPicturePlayback = true
        
        playerViewController.delegate = self
        
        self.present(playerViewController, animated: true, completion: nil)
        
        
        
        
    }
    
    @objc func didfinishplaying(note: Notification) {
        playerViewController.dismiss(animated: true, completion: nil)
        let alertview = UIAlertController(title:"finished",message:"video finished",preferredStyle: .alert)
        alertview.addAction(UIAlertAction(title:"Ok",style: .default, handler: nil))
        self.present(alertview,animated:true,completion: nil)
    }
    
    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Swift.Void){
        
        let currentviewController = navigationController?.visibleViewController
        
        if currentviewController != playerViewController {
            currentviewController?.present(playerViewController, animated: true, completion: nil)
        }
        
        
    }
    
    
}
