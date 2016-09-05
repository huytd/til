# Neural Network - Part 1

In the [last post](perceptron-algorithm.md), we studied how a perceptron works, and how to optimize the perceptron based on its weight.

Biologically, the human brain are constructed from neurons, each neuron is working exactly the same way as a perceptron works. 

Neural Network is a computer science technique that simulate the human brain by connecting multiple perceptrons in to a network, so we can train the computer to remember and recognize things.

## Perceptron's limitation

Perceptron itself has a limitation, we only able to work with linear data:

![](http://natureofcode.com/book/imgs/chapter10/ch10_11.png)

In the image above, perceptron works well with the dataset on the left, because it's linear (we can separate cases in the data by a single line).

With the dataset on the right, this is where perceptron couldn't handle. Let's take a closer look at the AND, OR and XOR operator.

With AND and OR, we have the dataset (the truth table) as the image below:

![](http://natureofcode.com/book/imgs/chapter10/ch10_12.png)

They're linearlly separated by a single line, and the perceptron algorithm just works well with this data.

But for XOR operation, the truth table should look like this:

![](http://natureofcode.com/book/imgs/chapter10/ch10_13.png)

As you see, True case are bounded in an oval-like shape. We can't just solve this problem by a single perceptron at all.

So what will we do now?

## Combination of problems

I want you to take a step back, have a deep breath, and look at your math textbook again.

What do you see in it: **XOR is a result of OR and NOT AND operators**

So, to solve XOR problem, we can combine the XOR perceptron and NAND perceptron.

![](http://uk-calling.com/other/uni/xor.gif)

![](https://cdn-images-1.medium.com/max/1600/1*ZbQVdusvAgS50nq0k2aiqA.png)

What we got here is a **multi-layered perceptron**, or in another words: a **neural network**

Each layer in the middle of network could also called **hidden layer**

## How to train a network

Training a network of perceptron is more complicated than training just single perceptron. 

What we need to keep in mind is: **The output of the first layer will be the input of the next layer.**

So, to optimize the whole network, we optimize the weights of each layer.

There are many algorithms to optimize the weights between multiple layers, such as Backpropagation, Feedforwards,...

In the next post, we will take a closer look on how each algorithm works and what is the pros/cons between algorithms.
