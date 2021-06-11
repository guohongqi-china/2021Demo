//
//  AlgorithmVC.swift
//  2021Demo
//
//  Created by guohongqi on 2021/5/25.
//

import UIKit

class mata:NSObject{
    var age:String = "12"
}

struct Person{
    var age:Int = 0
}

class AlgorithmVC: UIViewController {
    
    private let groupDispatch = DispatchGroup()
    private let groupQueue = DispatchQueue(label: "haha",  attributes: .concurrent)
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
//        var model1 = mata()
//        model1.age = "44"
//
//
//        var model = mata()
//        let numArr = [model]
//        var resultArr = numArr
//        resultArr.append(model1)
//
//
//        var el = resultArr.first
//        var e1l = numArr.first
//
//        debugPrint(resultArr)
//        debugPrint(numArr)
//
//        resultArr.map { person in
////            print(UnsafePointer(&person))
//            print(Unmanaged.passUnretained(person).toOpaque()) //打印引用类型
//
//
//        }
//
////        for item in numArr{
////            print(UnsafePointer(item))
////        }
//
//
//        print(UnsafePointer(numArr))
//        print(UnsafePointer(resultArr))
//
//        print(UnsafePointer(&model))
//        print(UnsafePointer(&el))
//        print(UnsafePointer(&e1l))
//
//
//        let yu = [1,2,3,4]
//        var oo = yu
//        oo.append(5)
//
//        print(yu)
//        print(oo)
//        print(UnsafePointer(yu))
//        print(UnsafePointer(oo))
//
//
//        var jj = "21321"
//        var yy  = jj
//        print(UnsafePointer(&jj))
//        print(UnsafePointer(&yy))
//

        
//        print(Unmanaged.passUnretained(model).toOpaque())
//        print(Unmanaged.passUnretained(el!).toOpaque())

//        print(Unmanaged.passUnretained(numArr).toOpaque()) //打印地址 值类型
//        print(Unmanaged.passUnretained(resultArr).toOpaque()) //打印地址 值类型
//        print(Unmanaged.passUnretained(numArr).toOpaque()) //打印地址 值类型
//        print(Unmanaged.passUnretained(numArr).toOpaque()) //打印地址 值类型
//        print(Unmanaged.passUnretained(numArr).toOpaque()) //打印地址 值类型


        
        let numArr1 = [1,8,6,2,5,4,8,3,7]

        debugPrint(maxArea(numArr1))
        
        // MCMXCIV 1994
        debugPrint(intToRomanQionju(5))
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Swift 题目
    private func swiftFunction(){
        
        //深浅copy   写时复制
        var array1 = [0, 1, 2, 3]
        var array2 = array1
        
        printAddress(address: array1) //0x600000078de0
        printAddress(address: array2)
        
        var string = "12312"
        let string1 = string
        string = ""
        
        printAddress(address: string) //0x600000078de0
        print(string) //0x600000078de0
        printAddress(address: string1)
        print(string1)

        
    }

    func printAddress(address o: UnsafeRawPointer ) {
        Swift.print(String(format: "%p", Int(bitPattern: o)))
    }
    
    
    // MARK: - 盛最多水的容器
    /**
     给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/container-with-most-water
     */
     private func maxArea(_ height: [Int]) -> Int {

        var maxNum = 0
        var leftIndex = 0
        var rightIndex = height.count - 1
        
        while leftIndex < rightIndex {
            let leftNum  = height[leftIndex]
            let rightNum = height[rightIndex]
            let numX = rightIndex - leftIndex
            let numY = min(leftNum, rightNum)
            if leftNum < rightNum {
                leftIndex += 1
            }else{
                rightIndex -= 1
            }
            maxNum = numX * numY > maxNum ? numX * numY : maxNum
        }
        
        return maxNum
     }
    
    // MARK: - 整数转罗马数字
    private func intToRoman(_ num: Int) -> String {
        func getStringByNum(_ num: Int) -> String{
            if num > 1000 {
                let result = num - num / 1000 * 1000
                let string = getStringByNum(result)
                var str = ""
                for _ in 0..<num / 1000 {
                    str = str + "M"
                }
               return str + string
            }else if num >= 500 && num < 1000{
                if num >= 900 {
                    let result = num - 900
                    let string = getStringByNum(result)
                    return "CM" + string
                }else{
                    var result = num - 500
                    result = result / 100
                    var str = ""
                    for _ in 0..<result {
                        str = str + "C"
                    }
                    result = num - 500 - result * 100
                    return "D" + str + getStringByNum(result)
                }

            }else if num >= 100 && num < 500{
                if num >= 400 {
                    let result = num - 400
                    let string = getStringByNum(result)
                    return "CD" + string
                }else{
                    var result =  num / 100
                    var str = ""
                    for _ in 0..<result {
                        str = str + "C"
                    }
                    result = num - result * 100
                    return  str + getStringByNum(result)
                }
                
            }else if num >= 50 && num < 100{
                if num >= 90 {
                    let result = num - 90
                    let string = getStringByNum(result)
                    return "XC" + string
                }else{
                    var result = num - 50
                    result = result / 10
                    var str = ""
                    for _ in 0..<result {
                        str = str + "X"
                    }
                    result = num - 50 - result * 10
                    return "L" + str + getStringByNum(result)
                }
            }else if num >= 10 && num < 50{
                if num >= 40 {
                    let result = num - 40
                    let string = getStringByNum(result)
                    return "XL" + string
                }else{
                    var result =  num / 10
                    var str = ""
                    for _ in 0..<result {
                        str = str + "X"
                    }
                    result = num - result * 10
                    return  str + getStringByNum(result)
                }
            }else if num >= 5 && num < 10{
                if num >= 9 {
                    let result = num - 9
                    let string = getStringByNum(result)
                    return "IX" + string
                }else{
                    var result = num - 5
                    result = result / 1
                    var str = ""
                    for _ in 0..<result {
                        str = str + "I"
                    }
                    result = num - 5 - result * 1
                    return "V" + str + getStringByNum(result)
                }
            }else if num >= 0 && num < 5{
                if num >= 4 {
                    let result = num - 4
                    let string = getStringByNum(result)
                    return "IV" + string
                }else{
                    let result =  num / 1
                    var str = ""
                    for _ in 0..<result {
                        str = str + "I"
                    }
                    return  str
                }
            }else{
                return ""
            }
        }
        
        let result = getStringByNum(num)
        return result
    }
    
    private func intToRomanQionju(_ num: Int) -> String{
        
        let numOne = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        let numTwo = ["","X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        let numThree = ["","C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let numFour = ["","M", "MM", "MMM"]
        
        let first = num / 1000
        let second = (num - first * 1000) / 100
        let three = (num - first * 1000 - second * 100) / 10
        let four = (num - first * 1000 - second * 100 - three * 10) / 1

        return  numFour[first] + numThree[second] + numTwo[three] + numOne[four]
    }

    // MARK: - DispatchGroup  死锁案例
    
    private func dispatchFunc(){
        self.groupDispatch.enter()
        self.groupQueue.async{
            debugPrint("============start")
            DispatchQueue.main.async {
                debugPrint("==========1 \(Thread.current)")
                self.groupDispatch.leave()

            }
            debugPrint("============2 \(Thread.current)")
        }

//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//        debugPrint("============wait")
//        let result = self.groupDispatch.wait(timeout:.distantFuture)
//        debugPrint("\(result)")
//        }
        
        debugPrint("============wait")
        let result = self.groupDispatch.wait(timeout:.distantFuture)
        debugPrint("\(result)")

        self.groupDispatch.enter()
        self.groupQueue.async{
            self.yanshizhixing(num:DispatchTime.now() + 5, callBack: {
                debugPrint("============3")
                self.groupDispatch.leave()
            })
        }

        self.groupDispatch.notify(queue: DispatchQueue.main) {
            debugPrint("============end")
        }
    }

    func yanshizhixing(num:DispatchTime,callBack:@escaping()->Void){

        DispatchQueue.global().asyncAfter(deadline: num) {
            callBack()
        }
    }
    
    private func dispatchFuncTwo(){
        self.groupDispatch.enter()
        self.groupQueue.async(group: self.groupDispatch) {
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2.0) {
                self.groupDispatch.leave()
            }
        }
        let _ = self.groupDispatch.wait(timeout:.distantFuture)
        self.groupDispatch.notify(queue: DispatchQueue.main) {
            debugPrint("============end")
        }
    }


}
