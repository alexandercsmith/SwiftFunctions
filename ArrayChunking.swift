// Array Chunking Algorithm

import UIKit

let numbers = [2, 3, 4, 6, 7, 8, 11, 13, 15, 17]

extension Array {

  func chunked(into size: Int) ->[[Element]] {
    return stride(from: 0, to: count, by: size).map {
      Array(self[$0..<Swift.min($0 + size, count)])
    }
  }

}

// print(numbers.chunked(into: 2))
// => [[2,3], [4,6], [7,8], [11,13], [15,17]]
