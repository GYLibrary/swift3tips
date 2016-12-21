//
//  GYIndex.swift
//  柯里化(Currying)
//
//  Created by zhuguangyang on 2016/12/20.
//  Copyright © 2016年 GYJade. All rights reserved.
//
//  Github:https://github.com/airfight
//  简书:http://www.jianshu.com/users/17d6a01e3361

import UIKit

extension Array {
    
    
    subscript(input:[Int]) -> ArraySlice<Element> {
    
    
    get {
    
        var reslut = ArraySlice<Element>()
        for i in input {
            
            assert(i < self.count,"下标越界")
            
            reslut.append(self[i])
            
        }
        return reslut
    }
    set {
        for (index,i) in input.enumerated() {
            assert(i < self.count, "下标越界")
            self[i] = newValue[index]
        }
        
    }
    }
    
}
