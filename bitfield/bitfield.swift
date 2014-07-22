import Foundation

extension UInt32 {
    private func makemask(length: UInt32, position: UInt32) -> UInt32 {
        return ((UInt32.max << length) ^ UInt32.max) << position
    }
    public subscript (range: Range<UInt32>) -> UInt32 {
        get {
            return self >> range.startIndex & makemask(range.endIndex - range.startIndex, position: 0)
        }
        set {
            let mask = makemask(range.endIndex - range.startIndex, position: range.startIndex)
            let part1 = self & (mask ^ UInt32.max)
            let part2 = (newValue << range.startIndex) & mask
            self = part1 | part2
        }
    }
}
