//
//  MusicCell.swift
//  RxSwift_Demo
//
//  Created by Mac on 2020/4/1.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SnapKit

class MusicCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .blue
        self.contentView.snp.makeConstraints { (make) in
            make.height.equalTo(100)
        }
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }

}
