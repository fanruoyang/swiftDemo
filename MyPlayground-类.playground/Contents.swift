//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

class Person{
    var age:Int = 0
}

let p = Person()
p.age=20
print(p.age)

class PersonOne :NSObject{
    var age:Int = 2
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
let p1 = PersonOne()

p1.setValue(12, forUndefinedKey: "age")

print(p1.age)


class Student:NSObject{
    var age: Int = 0
    var name:String?
    
    var mathScore :Double=0.0
    
    var chineseScroce :Double=0.0
}

let stu = Student()

stu.age=10
stu.name="ffr"
stu.mathScore=55.3
stu.chineseScroce=66.3



