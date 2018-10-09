//: Playground - noun: a place where people can play



var str = "Hello, playground"

//1. swift 如何导入框架
import UIKit
//2.定义标识符
//OC int a=20;
//swift 定义的时候需要告诉编译器是一个常量还是一个变量  常量 let  变量 var
//3.语句结束
//4.打印内容

// 1 if 写法
// if 后面的()可以省略
// 判断句不再有非0/nil 即为真,判断句必须有明确的 Bool

let a = 10;
if a>0 {
    print("a大于0")
}else{
    print("a小于0")
}

// 2 if else 写法跟if 一样
let score=92

if score<0||score>100 {
    print("不合理分数")
}else if score<60{
    print("不及格")
    
}else if score<80{
    
    print("及格")
}
// 3  三目运算符
let m=20
let n = 30

let result = m>n ? m:n


let agefff = 20

// 4 guard 使用，以后多用
func online (agefff:Int){
    
    guard agefff>=18 else {
        print("失败")
        return
    }
    guard agefff>=20 else {
        print("失败")
        return
    }
    
    print("成功")
}

online(agefff: agefff)

//5 switch 的使用
//可以判断小数点，可以判断字符串
//可以判断区间   0..20  0<s<20
let  sex = 0

switch sex{
case 0:
    print("0")
    
case 1:
    print("1")
default:
    print("2")
}

for i in 0..<10 {
    print(i)
}

// 6 do while循环需要写成repeat while

var aaa = 10


// 7 定义字符串
let opration : String="12"

let strss = "hello world"

// 7.1 遍历字符串
for c in strss.characters {
    print(c)
}

// 7.2 字符串拼接

let str1="第一个"
let str2 = "第二个"

let str3 = str1+str2

let name = "王八蛋"

let info = "asadasdd\(str1) adasadad\(str3) adasdasdsasdasdsadsd\(name)"

// 字符串格式化？不太懂
let min=2
let second = 8

let timestring=String(format :"%02d:%02d",arguments:[min,second])

// 8 数组
let array = ["A","B"]  //不可变
var textArray = [String ](["A","B"])//可变

textArray.append("C")
textArray.append("D")

textArray[0]="faqwe"
print(textArray)
textArray[1]
//数组的遍历
for i in 0..<textArray.count {
    print(textArray[i])
}
for name in textArray {
    print(name)
}
//数组的合并,相同类型才能加一起
let resultArray = array+textArray

//9 字典
let dict = ["age":"16","hight":"170"]
//AnyObject:一般指定类型  NSObject:一般用于创建对象
var dictM = [String :AnyObject]()
dictM["name"] = "fry" as AnyObject
dictM["gggggg"] = "gggggg" as AnyObject
dictM["fffff"] = "fffff" as AnyObject
dictM["hhhhhh"] = "hhhhhh" as AnyObject


dictM.removeValue(forKey: "name")

//修改的话，如果key值存在，直接替换，如果没有，就添加对应的key
print(dictM)

for key in dictM.keys {
    print(key)
}

for value in dictM.values {
    print(value)
}

for (key,value) in dictM {
    print(key,value)
}

//合并字典--即使类型一致也不能相加进行合并
//通过遍历的方式添加到一个字典中

var dictone = ["name":"ggggg","age":"ffffffff"]
var dicttwo = ["fafaf":"afasfa","gggggggg":"ffffffff"]

for (key,value) in dicttwo {
    dictone[key]=value
}

dictone



