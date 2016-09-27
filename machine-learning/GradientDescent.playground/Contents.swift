// h(x) = θ₀ + θ₁x
func hypothesisFunction(theta: [Double]) -> (Double) -> Double {
    return { theta[0] + theta[1] * $0 }
}

func costFunction(theta: [Double], x: [Double], y: [Double]) -> Double {
    let h = hypothesisFunction(theta: theta)
    let m = x.count
    var sum = 0.0
    
    for i in 0..<m {
        let error = h(x[i]) - y[i]
        sum = sum + (error * error)
    }
    
    return sum / (2 * Double(m))
}

func batchGradientDescent(steps: Int, x: [Double], y: [Double], learningRate: Double) -> [Double] {
    var theta = [0.0, 0.0]
    for _ in 0..<steps {
        for j in 0..<theta.count {
            let h = hypothesisFunction(theta: theta)
            var sum = 0.0
            for i in 0..<x.count {
                sum = sum + ((h(x[i]) - y[i]) * x[j])
            }
            theta[j] = theta[j] - learningRate * (1.0/Double(x.count)) * sum
        }
    }
    return theta
}

func stochasticGradientDescent(steps: Int, x: [Double], y: [Double], learningRate: Double) -> [Double] {
    var theta = [0.0, 0.0]
    for _ in 0..<steps {
        let h = hypothesisFunction(theta: theta)
        for i in 0..<x.count {
            for j in 0..<theta.count {
                theta[j] = theta[j] - learningRate * ((h(x[i]) - y[i]) * x[j])
            }
        }
    }
    return theta
}

let dataX = [1.0, 2.0, 3.0, 4.0, 5.0]
let dataY = [1.0, 3.0, 2.0, 4.0, 5.0]

let predictThetaWithBatchGD = batchGradientDescent(steps: 1000, x: dataX, y: dataY, learningRate: 0.01)
print("Batch Gradient Descent Training: ", predictThetaWithBatchGD)

let ageWeightPredict = hypothesisFunction(theta: predictThetaWithBatchGD)

for age in 1..<10 {
    print("Age = \(age), Weight = ", ageWeightPredict(Double(age)))
}

let predictThetaWithStochasticGD = stochasticGradientDescent(steps: 1000, x: dataX, y: dataY, learningRate: 0.01)
print("Stochastic Gradient Descent Training: ", predictThetaWithStochasticGD)

let ageWeightPredictS = hypothesisFunction(theta: predictThetaWithStochasticGD)

for age in 1..<10 {
    print("Age = \(age), Weight = ", ageWeightPredictS(Double(age)))
}