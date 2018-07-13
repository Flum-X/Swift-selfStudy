//
//  ViewController.swift
//  SwiftProject3
//
//  Created by Flum-X on 2018/7/13.
//  Copyright © 2018年 Swift learning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let mainStopwatch: Stopwatch = Stopwatch()
    fileprivate let lapStopwatch: Stopwatch = Stopwatch()
    fileprivate var isPlay: Bool = false
    fileprivate var laps: [String] = []
    
    //MARK: - UI components
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lapTimerLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var lapRestButton: UIButton!
    @IBOutlet weak var lapsTableView: UITableView!
    
    func initCircleButton(_ button: UIButton) -> Void {
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = UIColor.white
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCircleButton(playPauseButton)
        initCircleButton(lapRestButton)
        
        lapRestButton.isEnabled = false;
    }
    


}

