class RandomNumber {
    static func getRandomNumber(_ startOfRange: Int, _ endOfRange: Int) -> Int {
        Int.random(in: startOfRange...endOfRange)
    }
}
