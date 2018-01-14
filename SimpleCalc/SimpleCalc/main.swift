//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args.count == 1 {
            return 0
        }
        else if args.count == 3 {
            let op = args[1]
            let firstNum = Int(args[0])
            let secondNum = Int(args[2])
            switch op {
            case "-":
                return firstNum! - secondNum!
            case "+":
                return firstNum! + secondNum!
            case "/":
                return firstNum! / secondNum!
            case "%":
                return firstNum! % secondNum!
            case "*":
                return firstNum! * secondNum!
            default:
                print("not an operation")
            }
        } else {
            let op = args[args.count-1]
            switch op {
            case "count":
                return args.count - 1
            case "avg":
                var index = 1
                var total = Int(args[0])!
                while index < args.count - 1 {
                    total = total + Int(args[index])!
                    index += 1
                }
                return total / (args.count - 1)
            case "fact":
                var num = Int(args[0])! - 1
                var ans = Int(args[0])!
                while num > 0 {
                    ans = ans * num
                    num = num - 1
                }
                return ans
            default:
                print("not an operation")
            }
        }
        return 0;
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}


if CommandLine.argc > 1 {
    var args = CommandLine.arguments
    args.remove(at: 0)
    print(Calculator().calculate(args))
} else {
    print("UW Calculator v1")
    print("Enter an expression separated by returns:")
    let first = readLine()!
    let operation = readLine()!
    let second = readLine()!
    print(Calculator().calculate([first, operation, second]))
}

