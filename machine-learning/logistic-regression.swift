import Foundation

let x = [1.0, 1.2, 1.3, 1.4, 1.6, 1.8, 1.9, 2.0, 2.1, 2.2, 2.3, 2.4]
let y = [0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]

func sigmoid(z: Double) -> Double {
  return 1.0 / (1.0 + exp(-z))
}

func h(x: Double, theta: [Double]) -> Double {
  return sigmoid(z: theta[0] + theta[1] * x)
}

func cost(theta: [Double], x: [Double], y: [Double]) -> Double {
  var distance = 0.0
  for i in 0..<x.count {
    if y[i] == 1 {
      distance += -log(h(x: x[i], theta: theta))
    } else {
      distance += -log(1 - h(x: x[i], theta: theta))
    }
  }
  return distance
}

func logisticRegression(steps: Int, learningRate: Double, x: [Double], y: [Double]) -> [Double] {
  var theta = [0.0, 0.0]
  var cost = [0.0, 0.0]
  var temp = [0.0, 0.0]
  let m = x.count
  for _ in 0..<steps {
    cost = [0.0, 0.0]
    for i in 0..<m {
      cost[0] += (h(x: x[i], theta: theta) - y[i])
      cost[1] += ((h(x: x[i], theta: theta) - y[i]) * x[i])
    }
    temp[0] = theta[0] - learningRate * 1.0/Double(m) * cost[0]
    temp[1] = theta[1] - learningRate * 1.0/Double(m) * cost[1]

    theta = temp
  }
  return theta
}

let theta = logisticRegression(steps: 1500, learningRate: 0.1, x: x, y: y)
print("Theta: ", theta)
for i in stride(from: 0.0, through: 2.0, by: 0.5) {
  print("i = ", i, " predict = ", round(h(x: i, theta: theta) * 100), "%")
}
