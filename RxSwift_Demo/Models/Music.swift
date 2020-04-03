//
//  MusicModel.swift
//  RxSwift_Demo
//
//  Created by Mac on 2020/4/1.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct Music:CustomStringConvertible {
    var description: String
    
    let name : String
    let singer : String
    
    init(name:String, singer:String) {
        self.name = name
        self.singer = singer
        
        self.description = "歌名：\(name)  歌手：\(singer)"
    }
    

}

