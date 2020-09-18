//
//  VCTableViewController.swift
//  demo_test
//
//  Created by ChengGuoTech || CG-005 on 2020/9/17.
//  Copyright © 2020 ChengGuoTech || CG-005. All rights reserved.
//

import UIKit

class VCTableViewController: UITableViewController {

       let commendsCellId = "commentsviewcellid"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.backgroundColor = .white
    //        tableView.estimatedRowHeight = 250
    //        tableView.rowHeight = UITableView.automaticDimension
            tableView.register(UINib.init(nibName: "CommentsViewCell", bundle: nil), forCellReuseIdentifier: commendsCellId)
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.isTranslucent = true
            tabBarController?.tabBar.isHidden = true
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            navigationController?.navigationBar.shadowImage = nil
            tabBarController?.tabBar.isHidden = false
        }
        
        
        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 2
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print(indexPath)
            let cell = tableView.dequeueReusableCell(withIdentifier: commendsCellId, for: indexPath) as! CommentsViewCell
            cell.imgDatas = ["1","2","3","4","5","6","7","8"]
            cell.callBackHeight = {
                [weak self] in
                self?.tableView.beginUpdates()
                self?.tableView.endUpdates()
            }
            return cell
        }

}
