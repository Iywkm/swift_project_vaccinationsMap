//
//  VaccinationsMapUITests.swift
//  VaccinationsMapUITests
//
//  Created by Yuki Iwama on 2021/12/01.
//

import XCTest

class VaccinationsMapUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testShowDetailView() {
        
        let app = XCUIApplication()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .map).element.tap()
        app.otherElements["望月医院"].tap()
        
        let staticText = app.collectionViews.staticTexts["望月医院"]
        staticText.swipeUp()
        staticText/*@START_MENU_TOKEN@*/.press(forDuration: 1.7);/*[[".tap()",".press(forDuration: 1.7);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        staticText.swipeUp()
        staticText.swipeUp()
        staticText.swipeUp()
        staticText.tap()
        staticText.swipeUp()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["https://www.fuji.shizuoka.med.or.jp/iryou/?p=270"]/*[[".cells.staticTexts[\"https:\/\/www.fuji.shizuoka.med.or.jp\/iryou\/?p=270\"]",".staticTexts[\"https:\/\/www.fuji.shizuoka.med.or.jp\/iryou\/?p=270\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
    }

    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
    }
}
