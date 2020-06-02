//
//  MusicModel.swift
//  RxSwift_Demo
//
//  Created by Mac on 2020/4/1.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

struct Music {
    let name : String
    let singer : String
    
    init(name:String, singer:String) {
        self.name = name
        self.singer = name
    }
}

extension Music: CustomStringConvertible {
    var description: String {
        return "name:\(name), singer:\(singer)"
    }
}

