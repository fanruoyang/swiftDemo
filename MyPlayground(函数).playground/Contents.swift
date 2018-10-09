//: Playground - noun: a place where people can play


func sum( num1 :Int , num2:Int , num3: Int) -> Int{
    
    return num1+num2+num3
  
}

sum(num1: 20, num2: 30, num3: 40)


//二  swift 中的默认参数
//-> 需要返回值
func makeCoffee(coffeeName: String="默认值")-> String{
    return "制作了一杯\(coffeeName)咖啡"
}
makeCoffee(coffeeName: "果汁")
makeCoffee(coffeeName: "哈哈")
makeCoffee()

//可变参数，相加

func sumtotal(num : Int...)->Int{
    var result = 0
    
    for n in num {
        result += n
    }
return result
    
}
sumtotal(num: 19,20,30,45,55)

// 三 指针类型 m n 互换
var m = 20
var n = 30

func swapNum( m:inout Int , n:inout Int){
    let temNum = m
    m=n
    n=temNum
}

swapNum(m: &n, n: &m)
print("m:\(m) n:\(n)")
swap(&n, &m)//默认方法-同上
print("m:\(m) n:\(n)")

//四 函数的嵌套函数
func test(){
    func demo(){
        print("demo")
    }
    
    print("test")
}
test()



