//
//  main.swift
//  COW
//
//  Created by pook on 6/29/20.
//

import Foundation

func print(address o: UnsafeRawPointer) {
    print(String(format: "%p", Int(bitPattern: o)))
}

var arr1: [Int] = [0, 1, 2, 3]
var arr2: [Int] = arr1

print(address: arr1) // 0x103a13900
print(address: arr2) // 0x103a13900

arr2.append(4)

print(address: arr2) // 0x103a14320
