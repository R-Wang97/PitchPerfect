//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Ryan Wang on 2016-04-26.
//  Copyright © 2016 Shirui Wang. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    //IBOutlets for all the Buttons
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    //Variables for the audioPlayer
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    //Defining descriptions for the tags
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    //Action for playing sound
    @IBAction func playSound(sender: UIButton) {
        print("playing sound")
        //Switch statement to determine what effect to apply on audio playback
        switch (ButtonType(rawValue: sender.tag)!) {
        case .Slow: playSound(rate: 0.5)
        case .Fast: playSound(rate: 1.5)
        case .Chipmunk: playSound(pitch: 1000)
        case .Vader: playSound(pitch: -1000)
        case .Echo: playSound(echo: true)
        case .Reverb: playSound(reverb: true)
        }
        //Configure the UI to playing, where all other effect buttons are disabled, and stop button is enabled
        configureUI(.Playing)
    }
    
    @IBAction func stopPlayingSound(sender: AnyObject) {
        print("stop button pressed")
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
