import UIKit


// Definationn :- Higher-order functions are functions that take other functions or closures as arguments and that return a function or a closure.


// What is $0 and $1 in Swift?
//  $0 and $1 are closure's first and second Shorthand Argument Names (SAN for short) or implicit parameter names, if you like. The shorthand argument names are automatically provided by Swift. The first argument is referenced by $0 , the second argument is referenced by $1 , the third one by $2 , and so on.


//Swift’s Array type has a few methods that are higher order functions: sorted, map, filter, and reduce.


// ---------------------------------


//sorted()

let numbers: [Int] = [1,6,8,4,5,2,7,3]
let ascendingNumbers = numbers.sorted()
print(ascendingNumbers)


// sorted(by: T##(Int, Int) throws -> Bool)

let ascendingNumbersCustom = numbers.sorted { (a, b) -> Bool in
    return a > b
}

print(ascendingNumbersCustom)

// separating even and odd numbers

let ascendingNumbersCustom2 = numbers.sorted { (a, b) -> Bool in
    return a % 2 == 0
}

print(ascendingNumbersCustom2)


//Example

let array = [ "10", "1", "101", "NA", "100", "20", "210", "200", "NA", "7" ]
let sorted = array.sorted {$0.localizedStandardCompare($1) == .orderedAscending}

print(sorted)

// ---------------------------------
struct TodoItem {
    var date: Date
}

func sortItemsByDate(_ items: [TodoItem]) -> [TodoItem] {
    items.sorted { itemA, itemB in
        itemA.date < itemB.date
    }
}

// ---------------------------------

/*
let sortedContacts = contacts.sort {
    if $0.lastName != $1.lastName { // first, compare by last names
        return $0.lastName < $1.lastName
    }
    /*  last names are the same, break ties by foo
    else if $0.foo != $1.foo {
        return $0.foo < $1.foo
    }
    ... repeat for all other fields in the sorting
    */
    else { // All other fields are tied, break ties by last name
        return $0.firstName < $1.firstName
    }
}
*/

//let sortedCities = temperatures.sorted { $0.key < $1.key }
 
// ---------------------------------



struct User {
    var firstName: String
}

var users = [
    User(firstName: "Jemima"),
    User(firstName: "Peter"),
    User(firstName: "David"),
    User(firstName: "Kelly"),
    User(firstName: "Isabella")
]

let sortedUsers = users.sorted {
    $0.firstName < $1.firstName
}

print(sortedUsers)
// ---------------------------------



//map()

//defination :- Use map to loop over a collection and apply the same operation to each element in the collection. The map function returns an array containing the results of applying a mapping or transform function to each item.



let values = [2.0,4.0,5.0,7.0]

let squares2 = values.map {$0 * $0}

let squares4 = values.map {value in
    value * value
    
}


let scores = [0,28,124]
let wwords = scores.map { NumberFormatter.localizedString(from: $0 as NSNumber, number: .spellOut) }

print(wwords)



let intNumbers: [Int] = [1,6,8,4,5,2,7,3]

let strNumber = intNumbers.map({String($0)})

print(strNumber)


//Example


let numbers4 = [1, 2, 4, 5]
let indexAndNum = numbers4.enumerated().map { (index,element) in
return "\(index):\(element)"
}
print(indexAndNum) // [“0:1”, “1:2”, “2:4”, “3:5”]




let strings = [
    "one",
    "two",
    "three"
]

let ints = strings.map { (string) -> Int in
    string.count
}
print(ints)

let intsShort = strings.map { $0.count }

print(intsShort)



struct Userr {
 let id: Int
 let name: String
}

let userrs = [Userr(id: 1, name: "Sulley"), Userr(id: 2, name: "Mike")]
let userIds = userrs.map { (user) in
 return user.id
    
}
print(userIds)

let userIds3 = userrs.map { $0.id }

print(userIds3)


//With key paths
//From Swift 5.2, we're now able to use key paths in place of the closures above, so we can change the map to let userIds = users.map(\.id)

let U = userrs.map(\.id)
print(U)

// ---------------------------------

let countries = [
    "US": "United States",
    "BE": "Belgium",
    "CN": "China"
]

let ints3 = countries.map { $0.value.count }

print(ints3)


let ints4 = countries.mapValues { $0.count }

print(ints4)


// ---------------------------------

func convertToInt(_ string: String?) -> Int? {
    return string.map { Int($0) ?? 0 }
}


var arr1 = [1,2,3]

let arr1Result = arr1.map { $0 == 1 ? 4 : $0}
print(arr1Result)


let arr1Result2 = arr1.map { ($0 != 0) ? 1 : 0} //we cant change value, wecan replace it
print(arr1Result2)


//Filter()

//defination :- Use filter to loop over a collection and return an Array containing only those elements that match an include condition.

let arrFilter = [1,2,3,4,5,6,7]


let filterResult = arrFilter.filter({$0 < 5})

print(filterResult)


let filterResult2 = arrFilter.filter({ (a) in
    return a < 3
})

print(filterResult2)


let words = ["hello", "world", "this", "is", "a", "list", "of", "strings"]
let filtered = words.filter { word in
  return word.count >= 3
}

print(filtered)


let wordss = ["Hello", "This", "Is", "Nothing", "But", "A", "Test"]
let filtereds = wordss.filter { $0.count < 4 }
print(filtereds)



let result = wordss.filter { $0.starts(with: "I") }
print(result)



//let results = testers.filter { $0.name.prefix(1) == "J" && $0.age >= 30 }

//Reduce()

//defination :- Use reduce to combine all items in a collection to create a single new value.



let arrReduce = [0,1,2,3,4,5,6,7,8]

let arrReduced = arrReduce.reduce(""){ (a , b) -> String in
    return a + String(b)
}

print(arrReduced)

let arrReduce2 = [0,1,2,3,4,5,6,7,8]

let arrReduced2 = arrReduce2.reduce(""){ $0 + String($1)}

print(arrReduced2)



let num = [1,2,3,4,5]


let numSum = num.reduce(0, {x,y in
    x + y
})

print(numSum)


let numSum2 = num.reduce(0) {$0 + $1}

print(numSum2)

let reducedNumberSum = num.reduce(0,+) // returns 10

print(reducedNumberSum)



let friendsAndMoney = ["Alex": 150.00, "Tim": 62.50, "Alice": 79.80, "Jane": 102.00, "Bob": 94.20]
let allMoney = friendsAndMoney.reduce(0, { $0 + $1.value })
print(allMoney)



//Flatmap()

//defination :- Flatmap is used to flatten a collection of collections . But before flattening the collection, we can apply map to each elements.

//  Apple docs says: Returns an array containing the concatenated results of calling the given transformation with each element of this sequence.



let codes = [["aaa","sss","fff"],["hhh","nnn","ccc"],["lll","ppp","qqq"]]


let newCode1 = codes.flatMap{$0}
print(newCode1)

let newCode2 = codes.flatMap{$0.map{$0.uppercased()}}


print(newCode2)


let code2 = ["aaa","sss","fff"]
let newCode3 = code2.flatMap{$0}
print(newCode3)


//CompactMap()

//defination :- compactMap function is pretty much similar to map, with a great difference though; the resulting array does not contain any nil values.

let numbersWithNil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]
let notNilDoubled = numbersWithNil.compactMap { $0 != nil ? $0! * 2 : nil }
print(notNilDoubled)


let notNilDoubledddd = numbersWithNil.compactMap { $0 }
print(notNilDoubledddd)



let possibleNumber = ["1","2","three","//4","5"]


let compactMap = possibleNumber.compactMap{ str in Int(str)}

print(compactMap)


//ForEach()

//defination :- What developers know well is how to write for-in loops in order to iterate through the elements of a collection.
var arrReduce23 = [0,1,2,3,4,5,6,7,8]


arrReduce23.forEach { (number) in
    number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is odd")
}

arrReduce23.forEach { $0.isMultiple(of: 2) ? print("\($0) is even") : print("\($0) is odd") }

print(arrReduce23)

let hasNumbersLessThan5 = arrReduce23.contains { $0 < 5 }

print(hasNumbersLessThan5)



//RemoveAll()



let a = arrReduce23.removeAll { $0 < 10 }


//Split

let message = "Hello World!"

let result2 = message.split { $0 == " " }

let result3 = message.split { (char) -> Bool in
    return char == " "
}

print(result2)
print(result3)

let anotherMessage = "This message is going to be broken in pieces!"

let splitOnce = anotherMessage.split(maxSplits: 1, whereSeparator: { $0 == " " })

print(splitOnce)



//Chaining

//Chaining is the ability to combine all those Higher Order Functions you’ve just learned in one line of code!

var names = ["asas", "adasda", "ndfhdhf", "vnbxhu"]
let nameSt = names.filter{$0.first == "a"}.map{$0.uppercased()}.sorted()
print(nameSt)



//Partition

var number11 = [70,30,5,5,40,50,60,10,20,30,70,60,60]

let pn = number11.partition(by: {$0 > 30})
print(pn)
print(number11)
