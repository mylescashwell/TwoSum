import UIKit

// MARK: - Return a Boolean if there are two numbers in the array that equal a sum
let numbers = [1, 3, 6, 7, 7, 12, 14]

// MARK: - Brute Force: Nested For-Loop Compare All (n2)
func bruteForceTwoSum(array: [Int], sum: Int) -> Bool {
    for i in 0..<array.count {
        for j in 0..<array.count where j != i {
            if array[i] + array[j] == sum {
                print("TRUE: \(array[i]) + \(array[j]) = \(sum)")
                return true
            } else {
                print("FALSE: \(array[i]) + \(array[j]) != \(sum)")
            }
        }
    }
    return false
}

//bruteForceTwoSum(array: numbers, sum: 23)

// MARK: - Binary Search for Compliment (because Sorted) (nLogn)
let numbers2 = [1, 3, 6, 7, 7, 12, 14]

func twoSumBinarySearch(array: [Int], sum: Int) -> Bool {
    if array.count == 0 { return false }
    
    for i in 0..<array.count {
        let compliment = sum - array[i]
        
        var tempArray = array
        tempArray.remove(at: i)
        
        let hasCompliment = binarySearch(array: tempArray, key: compliment)
        print("num: \(array[i]) - \(hasCompliment)")
        
        if hasCompliment == true {
            print("TRUE. num: \(array[i]), compliment: \(compliment)")
            return true
        }
    }
    return false
}

twoSumBinarySearch(array: numbers2, sum: 26)

// MARK: - Move Pointer from Either End (Linear)
let numbers3 = [1, 3, 6, 7, 7, 12, 14]


// MARK: - Binary Search Helper
func binarySearch(array: [Int], key: Int) -> Bool {
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = array.count / 2
    let midValue = array[midIndex]
    
    if key < array[minIndex] || key > array[maxIndex] {
//        print("\(key) IS NOT IN ARRAY.")
        return false
    }
    
    if key > midValue {
        let highSlice = Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: highSlice, key: key)
    }
    
    if key < midValue {
        let lowSlice = Array(array[minIndex...midIndex - 1])
        return binarySearch(array: lowSlice, key: key)
    }
    
    if key == midValue {
//        print("\(key) FOUND.")
        return true
    }
    
    return false
}
