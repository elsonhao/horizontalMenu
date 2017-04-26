//
//  ViewController.swift
//  horizontalMenu
//
//  Created by 黃毓皓 on 2017/4/18.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var page1Button: UIButton!
    @IBOutlet weak var page2Button: UIButton!
    @IBOutlet weak var page3Button: UIButton!
    @IBOutlet weak var page4Button: UIButton!
    @IBOutlet weak var page5Button: UIButton!
    
    var selectedButton:UIButton!

    var page1ViewController:Page1TableViewController!
    lazy var page2ViewController:Page2ViewController = {
        self.storyboard?.instantiateViewController(withIdentifier: "Page2") as! Page2ViewController
    }()
    lazy var page3ViewController:Page3ViewController = {
        self.storyboard?.instantiateViewController(withIdentifier: "Page3") as! Page3ViewController
    }()
    lazy var page4ViewController:Page4ViewController = {
        self.storyboard?.instantiateViewController(withIdentifier: "Page4") as! Page4ViewController
    }()
    lazy var  page5ViewController:Page5ViewController = {
        self.storyboard?.instantiateViewController(withIdentifier: "Page5") as! Page5ViewController
    }()
    
    var selectedViewController:UIViewController!
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var containerView: UIView!
    //新增成員變數
    var myrefreshcontrol = UIRefreshControl()
    
    @IBAction func showPage1(_ sender: Any) {
        changeTab(to: page1Button)
        changePage(to: page1ViewController)
    }
    @IBAction func showPage2(_ sender: Any) {
        changeTab(to: page2Button)
        changePage(to: page2ViewController)
    }
    @IBAction func showPage3(_ sender: Any) {
        changeTab(to: page3Button)
        changePage(to: page3ViewController)
    }
    @IBAction func showPage4(_ sender: Any) {
        changeTab(to: page4Button)
        changePage(to: page4ViewController)
    }
    @IBAction func showPage5(_ sender: Any) {
        changeTab(to: page5Button)
        changePage(to: page5ViewController)
    }
    
    func changeTab(to newbutton:UIButton){
        let defaultColor = selectedButton.tintColor
        selectedButton.backgroundColor = UIColor.white
        selectedButton.setTitleColor(defaultColor, for: .normal)
        
        newbutton.backgroundColor = UIColor.lightGray
        newbutton.setTitleColor(UIColor.black, for: .normal)
        
        selectedButton = newbutton
        
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerViewSegue" {
            page1ViewController = segue.destination as! Page1TableViewController
            
        }
    }
    
    func changePage(to newViewController:UIViewController){
        selectedViewController.willMove(toParentViewController: nil)
        selectedViewController.view.removeFromSuperview()
        selectedViewController.removeFromParentViewController()
        
        addChildViewController(newViewController)
        self.containerView.addSubview(newViewController.view)
        newViewController.view.frame = containerView.bounds
        newViewController.didMove(toParentViewController: self)
        
        self.selectedViewController = newViewController
    }
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.scrollsToTop = false
        
        selectedViewController = page1ViewController
      
        
        
        
        
        selectedButton = page1Button
        

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
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = mytableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "測試\(indexPath.row)"
//        return cell
//    }


}

