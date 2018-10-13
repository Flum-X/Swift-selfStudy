//
//  ViewController.swift
//  SwiftProject12
//
//  Created by DaXiong on 2018/10/9.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView:UITableView!
    
    var channels:Array<JSON> = []
    
    let identify: String = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: identify)
        self.view.addSubview(self.tableView!)
        
        //
        DouBanProvider.request(.channels) { result in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                print(json)
                self.channels = json["channels"].arrayValue
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = channels[indexPath.row]["name"].stringValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channelName = channels[indexPath.row]["name"].stringValue
        let channelId = channels[indexPath.row]["channel_id"].stringValue
        
        DouBanProvider.request(.playlist(channelId)) { result in
            if case let .success(response) = result {
                //解析数据，获取歌曲信息
                let data = try? response.mapJSON()
                let json = JSON(data!)
                print(json)
                let music = json["song"].arrayValue[0]
                let artist = music["artist"].stringValue
                let title = music["title"].stringValue
                let message = "歌手：\(artist)\n歌曲：\(title)"
                
                //将歌曲信息弹出显示
                self.showAlert(title: channelName, message: message)
            }
        }
    }
    
    func showAlert(title:String, message:String) {
        let alertCtr = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertCtr.addAction(cancelAction)
        self.present(alertCtr, animated: true, completion: nil)
    }
}

