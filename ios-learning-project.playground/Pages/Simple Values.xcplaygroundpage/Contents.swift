//: # A Swift Tour
//:
//: Tradition suggests that the first program in a new language should print the words “Hello, world!” on the screen. In Swift, this can be done in a single line:
//:
print("Hello, world!")

//: If you have written code in C or Objective-C, this syntax looks familiar to you—in Swift, this line of code is a complete program. You don’t need to import a separate library for functionality like input/output or string handling. Code written at global scope is used as the entry point for the program, so you don’t need a `main()` function. You also don’t need to write semicolons at the end of every statement.
//:
//: This tour gives you enough information to start writing code in Swift by showing you how to accomplish a variety of programming tasks. Don’t worry if you don’t understand something—everything introduced in this tour is explained in detail in the rest of this book.
//:
//: ## Simple Values
//:
//: Use `let` to make a constant and `var` to make a variable. The value of a constant doesn’t need to be known at compile time, but you must assign it a value exactly once. This means you can use constants to name a value that you determine once but use in many places.
//:

var myVariable = 42
myVariable = 50
let myConstant = 42
print(myConstant)

//: A constant or variable must have the same type as the value you want to assign to it. However, you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type. In the example above, the compiler infers that `myVariable` is an integer because its initial value is an integer.
//:
//: If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.
//:
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70.00
print(explicitDouble)

let floatValue: Float = 4
print("floatValue: \(floatValue)")
print("floatValue: " + String(floatValue))
//: - Experiment:
//: Create a constant with an explicit type of `Float` and a value of `4`.
//:
//: Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.
//:
// 不同类型之间进行运算需要进行显示转换
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

print(widthLabel.count)
//print(widthLabel.distance(from: '0', to: widthLabel.count))

//各种运算
var a = 1
let b = -a
let c = +a

let x = false
// 使用!进行取反运算
let y = !x
//++运算符不被支持
//a++
//下面的运算符可以被使用
a += 1
a -= 1
a *= 2
a /= 2
//整除
a = 9 / 2
//求余运算
a = 9 % 2
//对浮点数求余，对浮点数求余不能使用%
var d = 8.truncatingRemainder(dividingBy: 2.5)
d = 6.5.truncatingRemainder(dividingBy: 2.5)
//d = 6 % 2.5
//两个数组相加，可以把两个数组合并成一个数组
let arr = [1,2] + [3,4]
//？！操作
let test = 2>1 ? 10 : 20
//: - Experiment:
//: Try removing the conversion to `String` from the last line. What error do you get?
//:
//: There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (`\`) before the parentheses. For example:
//:
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
//: - Experiment:
//: Use `\()` to include a floating-point calculation in a string and to include someone’s name in a greeting.
//:
//: Use three double quotation marks (`"""`) for strings that take up multiple lines. Indentation at the start of each quoted line is removed, as long as it matches the indentation of the closing quotation marks. For example:
//:
//使用三个引号可以定义多行字符串
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

print(quotation)
//: Create arrays and dictionaries using brackets (`[]`), and access their elements by writing the index or key in brackets. A comma is allowed after the last element.
//:
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

shoppingList.append("Another string")
shoppingList.insert("here is insert string", at: 2)
print(shoppingList)

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
occupations["Jayne"] = "Public Relations"

print(occupations)
for (key, value) in occupations {
    print("\(key): \(value)")
}

//: To create an empty array or dictionary, use the initializer syntax.
//:
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//: If type information can be inferred, you can write an empty array as `[]` and an empty dictionary as `[:]`—for example, when you set a new value for a variable or pass an argument to a function.
//:
shoppingList = []
occupations = [:]


/*
字典类型
 */
//定义字典类型使用key: value形式
var airport:Dictionary<String,String> = ["BJ":"Beijing",
                                         "SH":"Shanghai",
                                         "NJ":"Nanjing",
                                         "HZ":"Hangzhou",
                                         "ZZ":"Zhengzhou"]
//创建一个空的字典对象
var emptyDic: [String:String] = [:]
//可以不显示定义字典类型，但每个keyvalue的类型必须一致
var firstStudent = ["Name":"Chenchen", "Age":"5"]
//如果每个keyvalue类型不一致，不一致的类型必须显示定义为any类型
var child: Dictionary<String,Any> = ["Name":"Chenchen","Age": 5]
//读取值,注意key的大小写敏感，另外，这种方式取的值是Option的
child["Name"]
print(child["Name"]) //打印Optional的值
print(child["Name"]!) //打印真正的值
child["Age"]
//使用下标语法，修改指定值
child["Name"] = "小晨晨"
//添加一个新的键值对
child["Gender"] = "男"
//获取键值对数量
child.count
//获取键值对的字符串描述，注意右端的输出引号
child.description
//判断字典是否为空
child.isEmpty
//更新某个键对应的值
child.updateValue(4, forKey: "Age")
child.description
//弹出第一个键值对（返回并删除），返回结果为第一个元素，查看原字典会发现少了一个值
child.popFirst()
child.description
//移除key为“Gender”的元素，并返回该元素的值
child.removeValue(forKey: "Gender")
child.description
child
//为元素赋值nil也可以删除该元素
child["Test"] = "Test"
print(child)
child["Test"] = nil
print(child)
//删除所有元素
child.removeAll()

//取第一个元素
airport.first
//取第一个元素的键
airport.first?.key
//取第一个元素的值
airport.first?.value
//取第一个元素
var firstElement = airport.first
//返回这个元素的键
firstElement!.key
firstElement?.key
//返回这个元素的值
firstElement!.value
firstElement?.value

//反转元素的顺序
airport.reversed()

//循环遍历元素的key值
for key in airport.keys
{
    print(">>>>\(key)")
}
//循环遍历元素的值
for value in airport.values
{
    print(">>>>\(value)")
}
//循环遍历字典元素
for (key, value) in airport
{
    print(">>>>\(key): \(value)")
}

//按照字典的key进行升序排序
var dicpts: Dictionary<String,String> = ["a":"A", "b":"B", "c":"C", "d":"D", "e":"E", "f":"F", "g":"G", "h":"H", "i":"I", "j":"J"]
let keys1 = Array(dicpts.keys).sorted()
//按照字典的key进行降序排序
//let keys2 = Array(dicpts.keys).sorted({(key1, key2) -> Bool in return key1<key2?true:false})
let keys3 = Array(dicpts.keys).sorted(by: >)
//对字典数组进行降序排序
var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 15],
                          "triangular": [1, 3, 6, 10, 15, 21, 28],
                          "hexagonal": [1, 6, 15, 28, 45, 66, 91]]
for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >)
}
print(interestingNumbers["primes"]!)


