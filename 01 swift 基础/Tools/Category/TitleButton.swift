//
//  TitleButton.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/12.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setImage(UIImage (named: "set_rightButtonNormal"), for: .normal)
        setImage(UIImage (named: "set_rightButtonSelected"), for: .selected)
        setTitleColor(UIColor.black, for: .normal)
        sizeToFit()
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.y = titleLabel!.frame.size.width+10
    }
    //swift 中规定，重写控件的init(frame方法)或者(init)方法，必须重写init?(coder aDecoder: NSCoder)
    required init?(coder aDecoder: NSCoder) {
       fatalError("init")
    }
    
 //！强制解包.button里面肯定有titlelabel
//    override func layoutIfNeeded() {
//        super.layoutIfNeeded()
//        titleLabel!.frame.origin.x = 0
//        imageView!.frame.origin.y = titleLabel!.frame.size.width+10
//    }
}
