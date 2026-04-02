
/// Powers of 10 up to 1e18
private let POW10: [BigUInt] = [
    0,
    10,
    100,
    1000,
    10000,
    100000,
    1000000,
    10000000,
    100000000,
    1000000000,
    10000000000,
    100000000000,
    1000000000000,
    10000000000000,
    100000000000000,
    1000000000000000,
    10000000000000000,
    100000000000000000,
    1000000000000000000,
]

public extension BigUInt {
    func rounded(digitsToRound: Int, roundHalfUp: Bool) -> BigUInt {
        guard digitsToRound > 0 else { return self }
        let pow10 = _pow10(digitsToRound)
        let rem = self % pow10
        var result = self - rem
        if roundHalfUp {
            let half = pow10 >> 1
            if rem >= half {
                result += pow10
            }
        }
        return result
    }
    
    @inline(__always) private func _pow10(_ exponent: Int) -> BigUInt {
        return exponent < POW10.count ? POW10[exponent] : BigUInt(10).power(exponent)
    }
}

public extension BigInt {
    func rounded(digitsToRound: Int, roundHalfUp: Bool) -> BigInt {
        return BigInt(sign: self.sign, magnitude: self.magnitude.rounded(digitsToRound: digitsToRound, roundHalfUp: roundHalfUp))
    }
}
