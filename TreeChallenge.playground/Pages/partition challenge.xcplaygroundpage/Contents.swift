

import Foundation
/*
 * Complete the 'findPartitionCost' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY cost
 *  2. INTEGER k
 */
 
func findPartitionCost(cost: [Int], k: Int) -> [Int] {
    let cant = cost.count
    let costoBase = cost[0] + cost[cant - 1]
    print(costoBase)
    if k == 1 {
        return [costoBase, costoBase]
    }
    var adySum: [Int] = []
    for i in 0..<(cant - 1) {
        let sum = cost[i] + cost[i + 1]
        print(sum)
        adySum.append(sum)
    }
    adySum.sort()
    print(adySum)
    let sums = k - 1
    let minCost = adySum.prefix(sums).reduce(0, +)
    let maxCost = adySum.suffix(sums).reduce(0, +)
    let minTotalCost = costoBase + minCost
    let maxTotalCaost = costoBase + maxCost
    return [minTotalCost,maxTotalCaost]
}

print(findPartitionCost(cost: [1,2,3,2,5], k: 3))


