//
//  CatDataSource.swift
//  mvc
//
//  Created by joon-ho kil on 2021/04/16.
//

import UIKit

class CatDataSource: NSObject, UITableViewDataSource {
    var dataList: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath)
        cell.textLabel?.text = item
        return cell
    }
}
