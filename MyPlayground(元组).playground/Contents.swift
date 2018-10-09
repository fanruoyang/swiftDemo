//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1 元组

let info = ("hhaahha",15,"fffffff")
info.0
info.2

//元组主要写法------>>
let info1 = (name:"反反复复",age:"22",height:"1111")
info1.name
info1.height


let (name,age,height) = ("fffff","gggggg","hhhhhhh")
name
age
height


//2 可选类型--->需要给对象中的任何属性在创建对象时，都必须有明确的初始化值，导致nil的类型不匹配，
//常规方式---->不常用
var nameff : Optional<String> = nil
//2 给可选类型赋值
var nametwo: String? = nil

nametwo="why"
//3 取出可选类型的值
//可选类型+ ！：强制解包
//强制解包如果可选类型为nil，系统会崩溃，所有需要为nil 的时候判断
if nametwo != nil {
    print(nametwo!)
}

//3 可选绑定
// a 判断nametwo是否有值，如果没有值，直接不执行{}
// b 如果nametwo有值，系统会自动将nametwo进行解包，并且将解包后的结果 赋值给nametwo

if let nametwo = nametwo {
    print(nametwo)
}

let url : NSURL?=NSURL(string:"http://baidu.com") //可能是NSURL类型，时间是字符串，可选类型
if let urlff = url {
    print(urlff)
    //    let request = NSURLRequest(NSURL:urlff)
    
}

//5 函数的使用
func getData(num:String){
    
    print(num)
}

getData(num: "2222")


//6 类的定义
class share:NSObject{
    var age:Int = 0
    
    //override:重写，如果写的某一个方法是对弗雷的方法进行重写，那么必须在该方法前添加override
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
    
}


let shr = share()
shr.setValuesForKeys(["age" : 1,"name":22])

print(shr.age)

//--------------------------------------构造函数------------------------------------

class Person :NSObject{
    
    var fryname:String?
    var fryage:Int = 0
    
    override init() {
        //在构造函数中，如果没有明确super。init(),那么系统会帮助调用
        // super .init()
        print("-------")
    }
    //自定义构造函数
    init(fryname:String,fryage :Int) {
        self.fryname=fryname;
        self.fryage=fryage;
        
    }
    
    //监听字符串的变换===set方法
    var getFangfa:String?{
        //属性即将改变的时候进行监听
        willSet {
            print(getFangfa as Any,newValue as Any)
        }
        //属性已经进行改变进行监听-->直接在didset里面进行数据处理
        didSet{
            
            print(getFangfa as Any,oldValue as Any)
        }
        
    }
    
}

let p = Person(fryname:"大宝贝",fryage:22)
print(p.fryname as Any,p.fryage)

p.getFangfa="监听方法"













