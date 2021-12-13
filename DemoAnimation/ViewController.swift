//
//  ViewController.swift
//  DemoAnimation
//
//  Created by Siddhesh Kotavdekar on 12/10/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.
//

import UIKit
import ViewAnimator

class ViewController: UIViewController {
    @IBOutlet weak var myTable : UITableView!
    var arr = ["Cell1","Cell2","Cell3","Cell4","Cell5","Cell6","Cell7","Cell8","Cell9","Cell10","Cell11","Cell12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTable)
        myTable.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation = AnimationType.from(direction:.left, offset: 300 )
        UIView.animate(views:myTable.visibleCells,animations:[animation],delay: 0.5,duration: 2)
    }
}
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = arr[indexPath.row]
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.purple
        }else {
            cell.backgroundColor = UIColor.yellow
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
