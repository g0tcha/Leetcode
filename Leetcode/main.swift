/**
	346. Moving Average fom Data Stream
*/

class MovingAverage {
	
	var arr: [Int] = []
	var size: Int
	
	init(_ size: Int) {
		self.size = size
	}
	
	func next(_ val: Int) -> Double {
		arr.append(val)
		let sum = arr.suffix(size)
		return Double(sum.reduce(0, +)) / Double(sum.count)
	}
}

class Solution {
	
	// MARK: - Arrays
	
	/**
		1089. Duplicate zeros
	*/
	
	func duplicateZeros(_ arr: inout [Int]) {
		var i = 0
		let arrCount = arr.count
		
		while i < arr.count {
			if arr[i] == 0 {
				arr.insert(0, at: i+1)
				i+=1
			}
			i+=1
		}
		arr = Array(arr[0..<arrCount])
	}
	
	
	/**
		1295. Find Numbers with Even of Digits
	*/
	func findNumbers(_ nums: [Int]) -> Int {
		var cpt = 0
		nums.map { if $0.isDigitsCountEven { cpt+=1 } }
		return cpt
	}
	
	/**
		485. Max Consecutive Ones
	*/
	
	func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
		var lastMax: Int = 0
		var maximum: Int = 0
		for i in nums {
			if i == 1 {
				maximum += 1
			} else if i == 0 {
				lastMax = max(maximum, lastMax)
				maximum = 0
			}
		}
		
		return max(lastMax, maximum)
	}
	
	func findMaxConsecutiveOnesBis(_ nums: [Int]) -> Int {
		let splittedArray = nums.split(separator: 0)
		return splittedArray.map { $0.count }.max()!
	}
	
	/**
		977. Squares of a Sorted Array
	*/
	
	func sortedSquares(_ A: [Int]) -> [Int] {
		return A.map { $0*$0 }.sorted()
	}
	
	// MARK: - Linked List
	
	/**
		203. Remove Linked List Elements
	*/
	
	func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
		var current: ListNode? = head
		var list: ListNode?
		var lastNode: ListNode?
		
		while current != nil {
			if current?.val != val {
				if list == nil {
					list = current
				} else {
					lastNode?.next = current
				}
				lastNode = current
			}
			current = current?.next
		}
		return head
	}
	
	/**
		237. Delete Node in a Linked List
	*/
	
	func deleteNode(_ node: ListNode?) {
		node?.val = node!.next!.val
		node?.next = node?.next?.next
	}
	
	/**
		876. Middle of the Linked List
	*/
	
	func middleNode(_ head: ListNode?) -> ListNode? {
		var count = 0
		var current = head
		while current != nil {
			count += 1
			current = current?.next
		}
		
		let middleIndex = count / 2
		current = head
		var index = 0
		var middleNode: ListNode?
		while current != nil {
			if index == middleIndex {
				middleNode = current
				break
			}
			index += 1
			current = current?.next
		}
		return middleNode
	}
	
	func middleNode2(_ head: ListNode) -> ListNode? {
		var nodeDict = [Int: ListNode]()
		var length = 1
		var current: ListNode? = head
		
		while current != nil {
			nodeDict[length] = current
			length += 1
			current = current?.next
		}
		
		let middleIndex = length / 2
		return nodeDict[middleIndex]
	}
	
	/**
		1290. Convert Binary Number in a Linked List to Integer
	*/
	
	func getDecimalValue(_ head: ListNode?) -> Int {
		
		var binary = ""
		// Loop through the list and append each node value to binary
		var current = head
		while current != nil {
			binary.append(String(current!.val))
			current = current?.next
		}
		
		return Int(binary, radix: 2) ?? 0
	}
	
	// MARK: - Numbers
	
	/**
		1342. Number of Steps to Reduce a Number to Zero
	*/
	
	func numberOfSteps (_ num: Int) -> Int {
		guard num != 0 else { return 0 }
		var temp = num
		var c = 0
		repeat {
			if temp % 2 == 0 {
				temp = temp / 2
			} else {
				temp -= 1
			}
			c += 1
		} while temp > 0
		return c
	}
	
	func restoreString(_ s: String, _ indices: [Int]) -> String {
		var arr = Array(repeating: "", count: indices.count)
		for (i, c) in s.enumerated() {
			arr[indices[i]] = String(c)
		}
		return arr.joined()
	}
	
	/**
		1365. How Many Numbers Are smaller Than the Current Number
	*/
	func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
		var arr = [Int]()
		for i in 0..<nums.count {
			var c = 0
			for j in 0..<nums.count {
				if nums[i] != nums[j], nums[j] < nums[i] {
					c += 1
				}
			}
			arr.append(c)
		}
		return arr
	}
	
	// MARK: - Strings
	
	/**
		771. Jewels and stones
	*/
	
	func numJewelsInStones(_ J: String, _ S: String) -> Int {
		var jewels = 0
		for s in S where J.contains(s) {
			jewels += 1
		}
		return jewels
	}
	
	/**
		1614. Maximum Nesting Depth of the Parentheses
	*/
	
	func maxDepth(_ s: String) -> Int {
		var maximum = 0
		var count = 0
		for c in s where c == "(" || c == ")" {
			if c == "(" {
				count += 1
				maximum = max(maximum, count)
			} else {
				count -= 1
			}
		}
		return maximum
	}
}

// MARK: - Extensions

extension Int {
	var isDigitsCountEven: Bool {
		return String(self).count % 2 == 0
	}
}
