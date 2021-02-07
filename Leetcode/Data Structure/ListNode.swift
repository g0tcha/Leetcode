//
//  ListNode.swift
//  Leetcode
//
//  Created by Vincent Grossier on 07/02/2021.
//

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil; }
	public init(_ val: Int) { self.val = val; self.next = nil; }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: CustomStringConvertible {
	public var description: String {
		var string = "\(val)"
		if let next = next {
			string.append(" -> \(next)")
		}
		return string
	}
}
