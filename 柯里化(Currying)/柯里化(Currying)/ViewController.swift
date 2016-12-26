//
//  ViewController.swift
//  柯里化(Currying)
//
//  Created by zhuguangyang on 2016/12/9.
//  Copyright © 2016年 GYJade. All rights reserved.
//

import UIKit

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T:AnyObject>: TargetAction {
    
    weak var target: T?
    
    let action:(T)->()->()
    
    func performAction() -> (){
        
        if let t = target {
            action(t)()
        }
        
    }
    
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
}

class Control {
    
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T:AnyObject>(target:T,action:@escaping(T) -> () -> (),controlEvent:ControlEvent) {
        
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
        
    }
    
    func removeTargetForControlEvent(controlEvent:ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent:ControlEvent){
        actions[controlEvent]?.performAction()
    }
    
}


/// mutating  实现
protocol Vehicle {
    var numBerOfWheels: Int{get}
    var color: UIColor{get set}
    mutating func changeColor()
}

struct MyCar: Vehicle {

    var numBerOfWheels: Int = 4
    var color: UIColor = UIColor.blue
    
    mutating func changeColor() {
        color = .red
    }
}

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewSb = UIView()
        viewSb.frame = CGRect(x: 20, y: 100, width: 200, height: 200)
        viewSb.backgroundColor = UIColor.red
        self.view.addSubview(viewSb)
        
        
        //自定义下标数组
        var arr2 = [1,2,3,4,5];
        
        //Optional Map
        let arr3 = arr2.map {
            $0 * 2
        }
        
        print(arr3)
        
        
        let arr1 = arr2[[0,1,2]]
        print(arr1)
        //逃逸闭包
        GYEscaping().method1()
        GYEscaping().method2()
        GYEscaping().method3()
        
        doWork {
            print("work")
        }
        
        doWorkAsync {
            print("work")
        }
        
        var a = 5
        var b = 10
        
        swap(&a, &b)
        
//        GYTuple.swapMe2(a: &a, b: &b)
        
        print(a,b)
        
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
  
        let addTwo = addTo(2)
//        addTwo (Int)->Int
        print(addTwo)
        let result = addTwo(5)
        print(result)
        
        let greaterThan10 = greaterThan(10)
        
        print(greaterThan10(13))
        print(greaterThan10(10))
        
        let account = BankModel()
        account.deposit(amount: 100)
        
        let depositor = BankModel.deposit
        depositor(account)(100)
        print(account.balance)
        
        let button = Control()
        
        button.setTarget(target: self, action: ViewController.onButtonTap, controlEvent: .TouchUpInside)

        // 触发方法
        button.performActionForControlEvent(controlEvent: .TouchUpInside)
        
        var myCar = MyCar(numBerOfWheels: 1, color: .black)

        myCar.changeColor()
        
//        view.backgroundColor = myCar.color
        
        let arr = [0,1,2,3,4]
        
        for i in ReverseSequence(array:arr) {
            print("Index\(i)is\(arr[i])")
        }
        
        var iterator = arr.makeIterator()
        while let obj = iterator.next() {
            print(obj)
        }
        
    }

    func onButtonTap() {
        print("Button was tapped")
    }
    
    func addOnew(num:Int) -> Int{
        
        return num + 1;
        
    }
    
    func addTo(_ adder:Int) -> (Int) -> Int {
        
        return {
            num in
            return num + adder
        }
        
    }
    
    func greaterThan(_ comparer: Int) -> (Int) -> Bool {
        
        return {$0 > comparer}
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

