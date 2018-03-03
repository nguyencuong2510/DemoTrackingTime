//
//  ViewController.swift
//  DemoTrackingTime
//
//  Created by NguyenCuong on 3/2/18.
//  Copyright © 2018 NguyenCuong. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    
    var timeLeght = 0
    
    var timeVideo: CMTime = CMTimeMake(10, 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: get time leght video
        
        
        //MARK: process and get image
        progressView.progress = 0.2
        guard let path = Bundle.main.path(forResource: "video", ofType: "mp4") else { return }
        imageView.image = generateThumbnail(url: URL(fileURLWithPath: path))
    }
    
    func generateThumbnail(url: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: url)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            let duration = asset.duration
            let durationTime = CMTimeGetSeconds(duration)
            print(durationTime)
            
            
            imageGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imageGenerator.copyCGImage(at: timeVideo, actualTime: nil)
            
            return UIImage(cgImage: cgImage)
        } catch {
            print(error.localizedDescription)
            
            return nil
        }
    }


}

