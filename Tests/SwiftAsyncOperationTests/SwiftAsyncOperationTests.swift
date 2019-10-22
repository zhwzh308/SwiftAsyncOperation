import XCTest
@testable import SwiftAsyncOperation

final class SwiftAsyncOperationTests: XCTestCase {
    func testAsyncOperationReady() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let operation = SwiftAsyncOperation()
        _testOperationIsAsyncAndReady(operation)
    }
    func testExecution() {
        let operation = SwiftAsyncOperation()
        XCTAssertNotNil(operation.name, "Name not configured, this will make debugging more difficult")
    }
    private func _testOperationIsAsyncAndReady(_ operation: Operation) {
        XCTAssertTrue(operation.isAsynchronous, "initialize must set readiness to true!")
        XCTAssertTrue(operation.isReady, "initialize must set readiness to true!")
    }
    static var allTests = [
        ("testAsyncOperationReady", testAsyncOperationReady),
        ("testExecution", testExecution)
    ]
}
