//
//  ViewController.swift
//  horizontalMenu
//
//  Created by 黃毓皓 on 2017/4/18.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    var myrefreshcontrol = UIRefreshControl()
    @IBOutlet weak var mytableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableview.dataSource = self
        mytableview.delegate = self
        
        //出現分隔線
        let frame = CGRect(x: 0, y: 0, width: self.mytableview.frame.size.width, height: 1/UIScreen.main.scale)
        let line:UIView = UIView(frame: frame)
        self.mytableview.tableHeaderView = line
        line.backgroundColor = self.mytableview.separatorColor
        
        //下拉更新元件
        myrefreshcontrol.backgroundColor = UIColor.clear
        myrefreshcontrol.tintColor = UIColor.black
        myrefreshcontrol.attributedTitle = NSAttributedString(string: "更新資料")
        myrefreshcontrol.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.mytableview.addSubview(myrefreshcontrol)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        print("下載資料中")
        //下載完後
        if self.myrefreshcontrol.isRefreshing {
            self.myrefreshcontrol.endRefreshing()
        }
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "測試\(indexPath.row)"
        return cell
    }


}

