//
//  ViewController.swift
//  MEOW
//
//  Created by David Baldwin on 4/9/18.
//  Copyright © 2018 David Baldwin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayerObject: AVAudioPlayer = AVAudioPlayer()
    var audioPlayerObject2: AVAudioPlayer = AVAudioPlayer()
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button: UIButton!
    var saying = ""
    var myString : String {
        get {
            return saying
        }
        set {
            saying = (newValue)
        }
    }
    
    var count = 1
    enum meows {
        case meow1
        
        case meow2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.imageView?.contentMode = .scaleAspectFit
        
        let meowWaveFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        if let meowFile = meowWaveFile {
        do {
        try audioPlayerObject = AVAudioPlayer(contentsOf: URL(fileURLWithPath: meowFile))
        }
        catch
        {
            print(error)
        }
        }
        else
        {
            print("error")
        }
        
        let meowWaveFile2 = Bundle.main.path(forResource: "Cat2", ofType: "mp3")
        if let meowFile2 = meowWaveFile2 {
            do {
                try audioPlayerObject2 = AVAudioPlayer(contentsOf: URL(fileURLWithPath: meowFile2))
            }
            catch
            {
                print(error)
            }
        }
        else
        {
            print("error")
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func meow(_ sender: Any) {
        saying = "MEOOWW!!!"
        meowSound()
        label1.isHidden = false
        label1.text = myString
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    }
    func meowSound()  {
        
        let sum = {(count: Int) ->  ViewController.meows in
            
            if count % 2 == 0
            {
                return .meow1
            }
            else
            {
                return .meow2
            }
        }
      count += 1
        switch sum(count) {
        case .meow1:
    
            audioPlayerObject.play()
        case .meow2:
            audioPlayerObject2.play()
        }
        
    }
    @objc func hideLabel()  {
        label1.isHidden = true
    }
    
}

