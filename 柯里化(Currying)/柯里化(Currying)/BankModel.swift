//
//  BankModel.swift
//  柯里化(Currying)
//
//  Created by zhuguangyang on 2016/12/9.
//  Copyright © 2016年 GYJade. All rights reserved.
//
//  Github:https://github.com/airfight
//  简书:http://www.jianshu.com/users/17d6a01e3361

import Foundation

class BankModel{
    
    var balance: Double = 0.0
    
    func deposit(amount: Double) {
        balance += amount
    }
    
}
