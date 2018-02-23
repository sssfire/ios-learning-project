//: ## Functions and Closures
//:
//: Use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses. Use `->` to separate the parameter names and types from the function’s return type.
//:
//函数定义，person，day是函数的参数名称，后面的类型用：分割
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

//函数的调用
var greetingString = greet(person: "Bob", day: "Tuesday")
print(greetingString)

//: - Experiment:
//: Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//: By default, functions use their parameter names as labels for their arguments. Write a custom argument label before the parameter name, or write `_` to use no argument label.
//:
//函数的参数前面可以加一个自定义label，调用函数的时候使用
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

//: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
//:
//使用元组可以返回多个值
//传入的参数可以定义为一个数组
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
//传入的参数为一个数组，返回值为元组
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//: Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
//:
//定义嵌套函数，嵌套函数内部可以使用外部函数定义的局部变量
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//: Functions are a first-class type. This means that a function can return another function as its value.
//:
//函数的返回值可以是一个函数
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//: A function can take another function as one of its arguments.
//:
//函数的参数可以是一个函数，函数参数需要定义传入函数的参数和返回值
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//数组的map函数接受一个函数，用于映射原有值到目标值。
func increase3times(number: Int) -> Int {
    let result = 3 * number
    return result
}
//调用map函数进行映射
numbers.map(increase3times)
//: Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces (`{}`). Use `in` to separate the arguments and return type from the body.
//:

//下面的例子中，传入的函数使用闭包的形式
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
//: - Experiment:
//: Rewrite the closure to return zero for all odd numbers.
//:
//: You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
//:
//当闭包的传入类型，传出类型是已知的时候，可以省略传入类型，返回类型，或者两者，只留参数名称
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

//: You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.
//:
//使用$0, $1，表示函数的第一个，第二个传入参数。
//当闭包是唯一的一个参数时，可以省略括号
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

//函数的参数为可变参数
func getAverage(numbers: Double...) -> Double {
    if numbers.count == 0 {
        return 0
    }
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}
// 传入的是四个数字参数而非数组
var averageValue = getAverage(numbers: 23,34,54,64)
print("average value of array [23,34,54,64] is \(averageValue)")

//: [Previous](@previous) | [Next](@next)
