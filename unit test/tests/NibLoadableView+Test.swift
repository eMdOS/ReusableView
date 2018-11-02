import XCTest

class NibLoadableView_Test: XCTestCase {
    func test_nibName() {
        XCTAssertEqual("TestReusableView", TestReusableView.nibName)
    }
}
