import Foundation

/**
 
 https://leetcode.com/problems/permutation-sequence/
 
 The set [1, 2, 3, ..., n] contains a total of n! unique permutations.

 By listing and labeling all of the permutations in order, we get the following sequence for n = 3:

 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 Given n and k, return the kth permutation sequence.
 
 Constraints:

 1 <= n <= 9
 1 <= k <= n!
 
 */
class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var numbers: [Int] = []
        var factorials: [Int] = []
        var sum = 1
        factorials.append(1)
        for i in 1...n {
            sum = sum * i
            factorials.append(sum)
            numbers.append(i)
        }
        
        var ans = ""
        var newKey = k - 1
        for i in 1...n {
            let index = newKey / factorials[n - i]
            ans += String(numbers[index])
            numbers.remove(at: index)
            newKey -= index * factorials[n - i]
        }
        return ans
    }
}


print(Solution().getPermutation(1, 1))
