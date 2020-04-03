//
//  ViewController.swift
//  RxSwift_Demo
//
//  Created by Mac on 2020/3/31.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    
  
    var MusicTable : UITableView!
    
    let musicListModel = MusicListModel()
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        MusicTable = UITableView()
        MusicTable.register(MusicCell.self, forCellReuseIdentifier: "musicCell")
 
        view.addSubview(MusicTable)
        MusicTable.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        musicListModel.data
            .bind(to: MusicTable.rx.items(cellIdentifier: "musicCell")) { _, model, cell in
                
                cell.textLabel?.text = model.name
                cell.detailTextLabel?.text = model.singer
                cell.textLabel?.textColor = .red
        }.disposed(by: disposeBag)

        MusicTable.rx.modelSelected(Music.self).subscribe(onNext: { i in
            print(i)
            
        }, onError: { (Error) in

        }, onCompleted: {
            print("完成")
        }) {
            print("移除界面")
        }

      
    }


}

