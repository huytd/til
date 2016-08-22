# Perceptron Algorithm (aka: Single-layer Neural Network)

## Brief Information

Some brief information about Perceptron algorithm: 

- Is a supervised learning algorithm (which was given a set of training data - input - and the corresponding answer - output)  
- Is an online learning algorithm (which able to train the model with given input and return output in realtime)
- Is the simplest form of Neural Network
- It's following the "feed forward" model

## Terms and Notations

![](http://homepages.gold.ac.uk/nikolaev/perceptr.gif)

- Input Vector: A set of input (x1, x2,... xn) to the perceptron
- Weights: Weight of the perceptron, they're real numbers (w1, w2,..., wn, wn+1), wn+1 is the extended weight vector

For example: We're implementing the AND function with perceptron, so here is the input vectors and the corresponding output:

```
(0, 0) → 0
(0, 1) → 0
(1, 0) → 0
(1, 1) → 1
```

> Each pair (0, 1) is a vector

## Perceptron Algorithm

So, how perceptron works? This is a feedforward algorithm for a perceptron:

1. For every input, multiply that input by its weight
2. Sum all the weighted input
3. Compute the output of the perceptron based on the sum passed throught an activate function

**Pseudo-code** feedforward function

```
sum := 0

for every input x[i] in vector x:
    sum += w[i] * x[i] 

output := activate(sum)
```

**Pseudo-code:** activate function

```
func activate(sum):
    if sum > 0:
        return 1
    else
        return 0
```

The weight vector should be set randomlly at the beginning.

**Pseudo-code:** init function

```
for every weight[i] in weight vector:
    weight[i] = random(-1, 1)
```

A perceptron's job is to "guess" the output from given input, based on some weight values.

You may noticed the output will never be exactly same as the given output. So, we need to "train" the perceptron by optimizing its weight vector.

## Training Perceptron

To optimize the weight vector, firstly, we need to find the distance between the actual output and the expected answer, let's call this value is **Error**:

```
Guess := feedforward(x)
Error := Expected -  Guess
```

And the optimize step is actually adjusting the weight value:

```
New Weight := Weight + Δ Weight
```

Δ Weight can be calculated by multiply the error with the input:

```
Δ Weight := Error * Input
```

Therefore:

```
New Weight := Weight + Error * Input
```

The training algorithm should be represented in pseudo code like this:

**Pseudo-code:** train function

```
guess := feedforward(x)

error := expected - guess

for each weight[i] in weight vector:
    weight[i] := weight[i] + error * x[i]
```

By execute training function multiple times, the weight vector will be more accurate. 

After training, the weight vector can be saved in a static files for further use (Offline learning)

## References:

1. Perceptron-based Learning Algorithm - Stephen Gallan - 1990 (http://www.ling.upenn.edu/courses/Fall_2007/cogs501/Gallant1990.pdf)
2. Neural Networks / Chapter 4 - R. Rojas - 1996 (https://page.mi.fu-berlin.de/rojas/neural/chapter/K4.pdf)
3. Machine Learning Theory / Lecture 4 - Avrim Blum - 2010 (http://www.cs.cmu.edu/~avrim/ML10/lect0125.pdf)
4. Single-layer Neural Networks - Dr. Mark Humphrys (http://computing.dcu.ie/~humphrys/Notes/Neural/single.neural.html)
5. Data Science from Scratch - Book / Page 213
6. Understanding Machine Learning: From Theory to Algorithm - Book / Page 120 / Page 301
7. The Nature of Code / Chahpter 10 (http://natureofcode.com/book/chapter-10-neural-networks/)
