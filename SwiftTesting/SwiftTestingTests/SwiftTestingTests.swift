//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by Berkay Kuzu on 27.09.2022.
//

import XCTest
@testable import SwiftTesting

//Unit Test

final class SwiftTestingTests: XCTestCase {

    let math = MathematicFunctions() // Matematik objesi oluşturuyorum.

    func testAddIntegerFunctions() {
        let result = math.addIntegers(x: 5, y: 8)
        
        XCTAssertEqual(result, 13)
    }

    func testMultiplyNumbersFunctions() {
        let result = math.multiplyNumbers(x: 5, y: 5)
        
        XCTAssertEqual(result, 25)
    }
    
    func testDivideIntegersFunctions() {
        let result = math.divideIntegers(x: 10, y: 2)
        
        XCTAssertEqual(result, 5)
    }
    
}
