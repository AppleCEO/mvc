//
//  ViewController.swift
//  mvc
//
//  Created by joon-ho kil on 2021/04/16.
//

import UIKit

class ModelController: NSObject {
    var kittisList = ["🐱", "😹", "😼", "😸", "😽", "😾"]
    var smileyList = ["😐", "😂", "😏", "😊", "😊", "😠", "😱"]
}

class ViewController: UIViewController {

    // MARK: - View
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentControl: UISegmentedControl!

    // MARK: - DatSources
    var dataSources:[UITableViewDataSource] = []
    let catDataSource = CatDataSource()
    let smileyDataSOurce = SmileyDataSource()
    
    // MARK: - Model
    let modelController = ModelController()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catDataSource.dataList = modelController.kittisList
        smileyDataSOurce.dataList = modelController.smileyList
        dataSources = [catDataSource, smileyDataSOurce]
        
        tableView.dataSource = dataSources[0]
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func segementSelected(_ sender: UISegmentedControl) {
        tableView.dataSource = dataSources[sender.selectedSegmentIndex]
        tableView.reloadData()
    }
}
