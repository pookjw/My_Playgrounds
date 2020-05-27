import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(interview_solutionTests.allTests),
    ]
}
#endif
