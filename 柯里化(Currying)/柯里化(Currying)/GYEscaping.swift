//
//  GYEscaping.swift
//  柯里化(Currying)
//
//  Created by zhuguangyang on 2016/12/20.
//  Copyright © 2016年 GYJade. All rights reserved.
//
//  Github:https://github.com/airfight
//  简书:http://www.jianshu.com/users/17d6a01e3361

import UIKit

class GYEscaping {
    
    var foo = "foo"
    
    func method1() {
        doWork {
            print(foo)
        }
        
        foo = "bar"
    }
    
    func method2() {
        doWorkAsync {
        print(self.foo)
        }
        
        foo = "bar"
    }
    
    func method3() {
        doWorkAsync {
            [weak self] _ in
            print(self?.foo)
        }
        foo = "bar"
    }
    
    
    
    //@escaping
    func doWork(block:()->()) {
        block()
    }
    
    func doWorkAsync(block:@escaping ()->())
    {
        DispatchQueue.main.async {
            block()
        }
    }
    
}
