//
//  BundleExtenstionTest.swift
//  VocaTests
//
//  Created by Yon Thiri Aung on 02/08/2024.
//

import XCTest
@testable import Voca

class BundleExtensionTests: XCTestCase {

    func testDecode_WhenEqual() {
        // Arrange
        //let bundle = Bundle(for: type(of: self)) // Use the current test bundle
        let fileName = "vocabulary.json"

        // Act
        let vocabulary: [Vocabulary] = Bundle.main.decode(fileName)
       

        // Assert
        XCTAssertEqual(vocabulary[0].word, "Hello")
        //XCTAssertEqual(user.age, 25)
    }
}
