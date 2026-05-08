//
//  GIFMath.swift
//  SwiftGIFKit
//
//  Created by Vishal Vaghasiya on 08/05/26.
//

import Foundation

enum GIFMath {

    static func gcd(_ a: Int, _ b: Int) -> Int {

        var a = a
        var b = b

        while b != 0 {
            let remainder = a % b
            a = b
            b = remainder
        }

        return a
    }

    static func gcd(for array: [Int]) -> Int {

        guard var gcdValue = array.first else {
            return 1
        }

        for value in array {
            gcdValue = gcd(gcdValue, value)
        }

        return gcdValue
    }
}
