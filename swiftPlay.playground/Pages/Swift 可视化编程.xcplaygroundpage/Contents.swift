//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(Int(arc4random_uniform(100)))"
        return cell
    }
}

PlaygroundPage.current.liveView = ViewController()

