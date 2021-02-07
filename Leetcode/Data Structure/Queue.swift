//
//  Queue.swift
//  Leetcode
//
//  Created by Vincent Grossier on 07/02/2021.
//

protocol Queue {
	associatedtype Element
	
	mutating func enqueue(_ element: Element)
	mutating func dequeue() -> Element?
	var isEmpty: Bool { get }
	var peek: Element? { get }
}

struct QueueArray<T>: Queue {
	
	private var array = [T]()
	
	var isEmpty: Bool {
		array.isEmpty
	}
	
	var peek: T? {
		array.first
	}
	
	mutating func enqueue(_ element: T) {
		array.append(element)
	}
	
	mutating func dequeue() -> T? {
		return array.isEmpty ? nil : array.removeFirst()
	}
}
