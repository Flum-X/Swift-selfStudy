//
//  ViewController.swift
//  swiftProject18
//
//  Created by DaXiong on 2018/12/23.
//  Copyright © 2018 DaXiong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView: UITableView!
    var dataArr = ["啊，我这该死的无处安放的魅力啊...",
                   "啊，我这该死的无处安放的魅力啊...啊，我这该死的无处安放的魅力啊...",
                   "啊，我这该死的无处安放的魅力啊...啊，我这该死的无处安放的魅力啊...啊，我这该死的无处安放的魅力啊..."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib.init(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "CellId")
//        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyCell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! MyCell
        cell.contentLb.text = dataArr[indexPath.row]
        return cell;
    }
    
    
    
}
