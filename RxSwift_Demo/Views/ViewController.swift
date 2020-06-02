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
    
    var ntfObserver: NSObjectProtocol!
    
    var str = ""

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

        musicListModel.data.bind(to: MusicTable.rx.items(cellIdentifier: "musicCell"), curriedArgument: {willUseCell,Music,cell   in
            cell.textLabel?.text = Music.name
            cell.detailTextLabel?.text = Music.singer
            }).disposed(by: disposeBag)
        
        
            
        
        MusicTable.rx.modelSelected(Music.self).subscribe(onNext: { i in
            print(i)
        }, onError: { (Error) in
            print("出错", Error)
        }, onCompleted: {
            print("完成")
        }) {
            print("移除界面")
        }

        
        NotificationCenter.default.rx.notification(UIApplication.willEnterForegroundNotification).subscribe(onNext: { (Notification) in
            print("进入前台")
            API.token()
            var a = "halo"
            a = API.userInfo(token: a) { (str) -> String in
                print(str)
                self.str = str
                print(self.str)
                return str+"哈哈"
            }
            print("a后期值", a, self.str)
        }, onError: { (error) in
            print("出错")
        }, onCompleted: {
            print("完成")
        }) {
            print("回收")
        }.disposed(by: disposeBag)
      
    }


}

enum API {
    static func token() {
        print("测试")
    }
    
    static func userInfo( token:String, success:@escaping (_:String) -> String) -> String {
        print("函数内",token)
        //escaping 用于涉及超出函数作用域的方法，比如界面刷新
        DispatchQueue.main.async {
            success(token)
        }
        return token
    }
}
