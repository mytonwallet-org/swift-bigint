import XCTest
@testable import BigInt

final class RoundedTests: XCTestCase {

    func testBigUIntRoundedHalfUpUsesHalfThreshold() {
        XCTAssertEqual(
            BigUInt(49_123_456_789).rounded(digitsToRound: 7, roundHalfUp: true),
            BigUInt(49_120_000_000)
        )
        XCTAssertEqual(
            BigUInt(49_125_000_000).rounded(digitsToRound: 7, roundHalfUp: true),
            BigUInt(49_130_000_000)
        )
        XCTAssertEqual(
            BigUInt(49_126_000_000).rounded(digitsToRound: 7, roundHalfUp: true),
            BigUInt(49_130_000_000)
        )
    }

    func testBigUIntRoundedWithoutHalfUpTruncates() {
        XCTAssertEqual(
            BigUInt(49_129_999_999).rounded(digitsToRound: 7, roundHalfUp: false),
            BigUInt(49_120_000_000)
        )
    }

    func testBigIntRoundedHalfUpPreservesSign() {
        XCTAssertEqual(
            BigInt(-49_123_456_789).rounded(digitsToRound: 7, roundHalfUp: true),
            BigInt(-49_120_000_000)
        )
        XCTAssertEqual(
            BigInt(-49_125_000_000).rounded(digitsToRound: 7, roundHalfUp: true),
            BigInt(-49_130_000_000)
        )
    }
}
