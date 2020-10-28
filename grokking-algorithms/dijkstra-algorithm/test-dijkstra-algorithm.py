#coding: utf-8

# 测试迪克拉斯特算法
graph = {}

graph["start"] = {}
graph["start"]["a"] = 6
graph["start"]["b"] = 2

graph["a"] = {}
graph["a"]["fin"] = 1

graph["b"] = {}
graph["b"]["a"] = 3
graph["b"]["fin"] = 5

graph["fin"] = {}

# 表示无穷大
infinity = float("inf")

# 节点开销列表， 记录从起点出发前往该节点需要多长时间
costs = {}
costs["a"] = 6
costs["b"] = 2
costs["fin"] = infinity

# 存储父节点
parents = {}
parents["a"] = "start"
parents["b"] = "start"
parents["fin"] = None

# 记录已经处理过的节点
processed = []

print "graph: ", graph
print "costs: ", costs
print "parents: ", parents

print "\nworking ..."
def find_lowest_cost_node(costs):
    lowest_cost = infinity
    lowest_cost_node = None
    for node in costs:
        cost = costs[node]
        if cost < lowest_cost and node not in processed:
            lowest_cost = cost
            lowest_cost_node = node
    return lowest_cost_node

node = find_lowest_cost_node(costs)
while node is not None:
    cost = costs[node]
    neighbors = graph[node]
    for n in neighbors.keys():
        new_cost = cost + neighbors[n]
        if costs[n] > new_cost:
            costs[n] = new_cost
            parents[n] = node
    processed.append(node)
    node = find_lowest_cost_node(costs)
    print "lowest cost node: ", node

print "\nfinish working..."
print "graph: ", graph
print "costs: ", costs
print "parents: ", parents

paths = []
node = parents["fin"]
paths.append(node)
while parents.has_key(node):
    node = parents[node]
    paths.append(node)

final_path = ""
while paths:
    final_path += paths.pop()
    final_path += " -> "
final_path += "fin"
print "final path is: ", final_path