//
//  SequenceConvenienceTests.swift
//
//  Copyright (c) 2019 Chris Martin. Licensed under the MIT license, as follows:
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import XCTest
import CMToolkit

class SequenceConvenienceTests: XCTestCase {
    
    func testMapWithKeyPath() {
        
        let cast = ["Vivien", "Marlon", "Kim", "Karl"]
        XCTAssertEqual(cast.map(to: \.count), [6, 6, 3, 4])
        
        let randoms = Array<Int>(repeating: 0, count: 10000)
            .map { _ in Int.random(in: .min ... .max) }
        
        let byteSwapped = randoms.map { $0.byteSwapped }
        XCTAssertEqual(randoms.map(to: \.byteSwapped), byteSwapped)
    }
    
    func testSortedByKeyPath() {
        
        struct Value { let value: Int }
        
        let sortedRandoms = Array<Value>(repeating: Value(value: 0), count: 10000)
            .map { _ in Value(value: .random(in: .min ... .max)) }
            .sorted(by: \.value)
        
        for (index, value) in sortedRandoms.enumerated() {
            guard sortedRandoms.indices.contains(index - 1) else { continue }
            XCTAssertGreaterThanOrEqual(value.value, sortedRandoms[index - 1].value)
        }
    }
}
