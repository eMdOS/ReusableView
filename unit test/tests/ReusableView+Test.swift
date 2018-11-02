import XCTest

class ReusableView_Test: XCTestCase {
    func test_reusableIdentifier() {
        XCTAssertEqual("TestReusableView", TestReusableView.reusableIdentifier)
    }
}
