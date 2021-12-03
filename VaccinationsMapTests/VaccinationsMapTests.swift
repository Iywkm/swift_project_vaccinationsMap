//
//  VaccinationsMapTests.swift
//  VaccinationsMapTests
//
//  Created by Yuki Iwama on 2021/12/01.
//

import XCTest
@testable import VaccinationsMap

class VaccinationsMapTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDetailVC() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        class DVCMock: DetailViewController {
            
        }
        let dvcm = DVCMock(sectionName: "フィランセ")
        XCTAssertEqual(dvcm.vaccinationFacility[0], ["✖︎", "✖︎", "✖︎", "✖︎", "✖︎", "✖︎", "✖︎", "✖︎", "✖︎", "✖︎", "✖︎", "○"])
        XCTAssertEqual(dvcm.tableText[0], "富士市本市場432-1")
        XCTAssertEqual(dvcm.tableText[1], "0545648990")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
