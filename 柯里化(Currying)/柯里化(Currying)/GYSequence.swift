//
//  GYSequence.swift
//  柯里化(Currying)
//
//  Created by zhuguangyang on 2016/12/9.
//  Copyright © 2016年 GYJade. All rights reserved.
//
//  Github:https://github.com/airfight
//  简书:http://www.jianshu.com/users/17d6a01e3361

import UIKit



class ReverseIterator<T>:IteratorProtocol{
    
    typealias Element = T
    
    var array: [Element]
    
    var currentIndex = 0
    
    init(array:[Element]) {
        
        self.array = array
        currentIndex = array.count - 1
        
    }
    
    func next() -> Element? {
        if currentIndex < 0 {
            return nil
        } else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
            
        }
    }
    
}

struct ReverseSequence<T>:Sequence {
    
    var array:[T]
    
    init(array: [T]) {
        
        self.array = array
        
    }
    
    typealias Iterator = ReverseIterator<T>
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
    
}
