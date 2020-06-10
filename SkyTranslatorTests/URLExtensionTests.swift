//
//  URLExtensionTests.swift
//  SkyTranslatorTests
//
//  Created by Roman Kravtsov on 10.06.2020.
//  Copyright © 2020 Roman Kravtsov. All rights reserved.
//

import XCTest
@testable import SkyTranslator

class URLExtensionTests: XCTestCase {

    func testURLFromString() {
        let testString = "//skyeng.ru"
        let testURL = URL.fromString(testString)
        XCTAssertNotNil(testURL)
    }

}
