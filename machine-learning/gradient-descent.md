# Gradient Descent

When solving machine learning problem, we usually end up with a solution that needed to optimize some parameters of a model function -- sometimes called hypothesis function, to reduce the error (cost function).

A more accurate training model mean the lower value of a cost function. 

Gradient Descent is an algorithm used to optimize the parameters (coefficients) of hypothesis function (f) that minimizes its cost function (J). 

## Cost Function

The bowl-shape below is the plot of a cost function.

![](https://cdn-images-1.medium.com/max/1600/1*uorFgyflbSMtvfSo9hlI1A.png)

A random position on the graph is the cost of the current value of the coefficients (θ - theta)

The bottom point of the bowl is the cost of the best set of coefficients (θ) - the minimum of the function.

The goal of Gradient Descent algorithm is to try different values of coefficients many times to find the best values that make the cost function minimum.

## Gradient Descent Algorithm

![](https://queenscompsci.files.wordpress.com/2016/02/image-v0kzcy.png)

The Gradient Descent Algorithm is very simple: 

```
Repeat until cost = 0 or close enough to 0
  Step 1: Start with θ = 0 or some random values
  Step 2: Evaluate the value of cost funciton based on f(θ)
               cost = J(f(θ))
  Step 3: Calculate the derivative of J based on θ to know the slope of the function at a given point. So we will know the direction to move the θ values in order to minimize J 
               delta = derivative(cost)
  Step 4: Now we update the value of θ based on the direction (delta) 
               θ = θ - (learningRate * delta)
```

## Learning Rate

You may noticed the `learningRate` in the algorithm described above. This value tell the algorithm how far we can change the value of `θ` in each iterate.

The value of `learningRate` here must be chosen wisely to get more accurate changes for `θ`.

![](learningRate.gif)

If `learningRate` is too large, chances the Gradient Descent Algorithm will skip the minimum value of cost function, which will lead to inaccurate model.

If `learningRate` is too small, the Gradient Descent Algorithm will be slow as we have too many iterate to optimize the `θ` values.

## Gradient Descent in Action

In this section, we will see how Gradient Descent applied to solve real world machine learning problem: Linear Regession, Non-Linear Regression and Neural Network.

## Linear Regression
(TBD)

## Non-Linear Regression
(TBD)

## Neural Network
(TBD)

## References

- [Large Scale Machine Learning](http://www.holehouse.org/mlclass/17_Large_Scale_Machine_Learning.html)
- [Machine Learning is Fun](https://medium.com/@ageitgey/machine-learning-is-fun-80ea3ec3c471#.d1jr9oww6)
- [Logistic Regression](http://adit.io/posts/2016-03-13-Logistic-Regression.html)
- [Minimize Cost Function with Gradient Descent](http://labs.septeni-technology.jp/technote/ml-03-minimize-cost-function-with-gradient-descent-algorithm/)
- [Optimizing Gradient Descent](http://sebastianruder.com/optimizing-gradient-descent/)
