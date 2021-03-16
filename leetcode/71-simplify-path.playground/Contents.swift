import Foundation

class Solution {
    func simplifyPath(_ path: String) -> String {
        let components = Array(path.split(separator: "/"))
        var stack: [String] = []
        for value in components {
            if value == "." || value == "" {
                continue
            }
            if value == ".." {
                if stack.count > 0 {
                    stack.popLast()
                }
            } else {
                stack.append(String(value))
            }
        }
        return "/" + stack.joined(separator: "/")
    }
}


print(Solution().simplifyPath("/home//foo/"))
print(Solution().simplifyPath("/a/./b/../../c/"))
print(Solution().simplifyPath("/../"))
