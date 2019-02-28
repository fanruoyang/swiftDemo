//
//  RecommendViewModel.swift
//  01 swift 基础
//
//  Created by ios on 2019/1/10.
//  Copyright © 2019 fanruoyang. All rights reserved.
//

import UIKit

class RecommendViewModel {
//    fileprivate lazy var bigDataGroups : [AnchorGroup] = [AnchorGroup]()
    
//       private var categories = [AnchorGroup]()
}


extension RecommendViewModel{
    
    func requestData(completionHandler : @escaping (_ bigDataGroups: [AnchorGroup]) -> ()){
        //1.1 请求推荐数据
          let parameters = ["limit" : "4", "offset" : "0", "time" : Date.getCurrentTime()]
        
        // 1.2.创建Group
        let dGroup = DispatchGroup()
        
        // 1.3.请求第一部分推荐数据
        dGroup.enter()
        NetworkTools.shareInstance.get(url: "http://capi.douyucdn.cn/api/v1/getbigDataRoom",param:parameters, successBlock: { (dict, json) in
        // 1.3.1 这里数据处理可能不一样，这里是调整数据是否能够通过
            if let datas = json["data"].arrayObject {
     
                completionHandler(datas.compactMap({AnchorGroup.deserialize(from: $0 as? NSDictionary)}))
            }
            
            print("%@",dict)
                  dGroup.leave()
            
        }) { (AFSErrorInfo) in
                  dGroup.leave()
        }
        //1.4 离开组
        
        
        //2 请求颜值数据
           dGroup.enter()
         dGroup.leave()
        
        //3 请求剩下的数据
        
        
        dGroup.notify(queue: .main) {
            
        }

    }
    
    
    
}
