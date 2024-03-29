# Homework 6 (20 Points + 2 Bonus Points)

The deadline for Homework 5 is Saturday, October 20, 6pm. The late
submission deadline is Monday, October 22, 6pm.

## Getting the code template

Before you perform the next steps, you first need to create your own
private copy of this git repository. To do so, click on the link
provided in the announcement of this homework assignment on
Piazza. After clicking on the link, you will receive an email from
GitHub, when your copy of the repository is ready. It will be
available at
`https://github.com/nyu-pl-fa18/hw06-<YOUR-GITHUB-USERNAME>`.  
Note that this may take a few minutes.

* Open a browser at `https://github.com/nyu-pl-fa18/hw06-<YOUR-GITHUB-USERNAME>` with your Github username inserted at the appropriate place in the URL.
* Choose a place on your computer for your homework assignments to reside and open a terminal to that location.
* Execute the following git command: <br/>
  ```git clone https://github.com/nyu-pl-fa18/hw06-<YOUR-GITHUB-USERNAME>.git```<br/>
  ```cd hw06```

A code template is provided in `solution.scm`. Complete this file with
your implementation to the problems.

## Submitting your solution

Once you have completed the assignment, you can submit your solution
by pushing the modified code template to GitHub. This can be done by
opening a terminal in the project's root directory and executing the
following commands:

```bash
git add .
git commit -m "solution"
git push
```

You can replace "solution" by a more meaningful commit message.

Refresh your browser window pointing at
```
https://github.com/nyu-pl-fa18/hw06-<YOUR-GITHUB-USERNAME>/
```
and double-check that your solution has been uploaded correctly.

You can resubmit an updated solution anytime by reexecuting the above
git commands. Though, please remember the rules for submitting
solutions after the homework deadline has passed.

## Remarks (read before you start!)

All of the problems in this homework assignment are related to Scheme
lists which are constructed from `cons` pairs. Some of the problems
refer to predefined functions on lists that you are allowed to use in
your implementation (and which we have already discussed in
class). For a more detailed documentation of pairs, lists, and the
functions defined on them, see:

https://docs.racket-lang.org/reference/pairs.html

Please follow the specific instructions for each problem regarding
which of these functions you are allowed to use in your solution. In
general, you are always allowed to use pattern matching and
non-recursive functions on lists and pairs such as `car`, `cdr`,
`cons`, `null?`.

The code template `solution.scm` also contains unit tests that you
can use to test your solutions.

## Problem 1: First-order Functions on Lists (10 Points)

1. Write a Scheme function `unzip` that takes a list of pairs and
   splits it component-wise into two lists. Some examples:
   
   ```scheme
   > (unzip '((1 . a) (2 . b) (3 . c)))
   ((1 2 3) . (a b c))
   > (unzip '())
   (() . ())
   ```

   Your implementation does not need to be tail-recursive. However,
   you are not allowed to use any predefined recursive functions on
   lists (including `foldl`, `foldr`, etc). **(4 Points)**

1. Write a Scheme function `flatten` that takes a value `xs` and
   returns

   1. the list containing `xs` if `xs` is an atom (i.e. not a list), or

   2. if `xs` is a list, the list of all the atoms contained in
      `xs` or in any nested list within `xs`.

   Examples:

   ```scheme
   > (flatten 1)
   (1)
   > (flatten (cons 1 2))
   ((1 . 2))
   > (flatten `(1 2 3))
   (1 2 3)
   > (flatten `(1 (3 4) 5))
   (1 3 4 5)
   > (flatten '(1 (2 3 (4 5) (6 7 (8)) 9) 10))
   (1 2 3 4 5 6 7 8 9 10)
   ```

   Note that the order of the atoms in the (nested) lists should be
   preserved in the output list. 
   
   Your implementation must be tail-recursive to obtain full
   points. The only predefined recursive functions on lists that you
   are allowed to use are `list?`, `reverse`, and `append` (you won't
   necessarily need all of them). **(6 Points)**

   Hints:

   * The predicate `(list? xs)` evaluates to true if `xs` is a list
     (including the empty list), false otherwise.

   * You may want to first implement a simpler non-tail-recursive version
     before you attempt the tail-recursive version.

   * To obtain a tail-recursive implementation, build up the result
     list in reverse order, then at the end use `reverse` to get the
     expected output list.

## Problem 2: Higher-order Functions on Lists (10 Points + 2 Bonus Points)

1. Reimplement the function `unzip` from Problem 1 using `foldr`. The
   new function should be named `unzip-alt`. Do not use any auxiliary
   recursive functions. **(4 Points)**

   Note: the predefined `foldl` and `foldr` are ternary
   functions. That is, they take their three arguments (the fold
   operation being applied, the initial value, and the list being
   folded) in one go rather than in curried form.

   Hint: keep in mind that you can group multiple intermediate result
   values together in a single intermediate result value using `cons`.

1. Implement the function `foldr` using `foldl`. The new function
   should be named `foldr-alt`. Do not use any auxiliary recursive
   functions. However, you are allowed to call `foldl` more than
   once. **(2 Points)**

   Note: unlike the `foldl` function that we discussed in
   class, the predefined `foldl` of Scheme expects a fold operation
   `op` that first takes in the current head element `hd` being
   processed and then the intermediate result computed for the prefix
   that has already been processed (just like `foldr`). So, we have for
   instance 
   
   ```scheme
   > (foldl (lambda (hd res) (cons (+ hd 1) res)) '() '(1 2 3))
   (4 3 2)
   ```
   
1. Implement a higher-order function `in-relation` that takes a binary
   predicate `p` and a list `xs` and checks whether `(p x y)`
   evaluates to true for all consecutive elements `x` and `y` in
   `xs`. In particular, if we call `in-relation` with `<` for `p`, it
   will check whether `xs` is strictly sorted in increasing order.
   
   Examples:
   
   ```scheme
   > (in-relation < '(1 2 3 5 6))
   #t
   > (in-relation < '(1))
   #t
   > (in-relation < '())
   #t
   > (in-relation < '(1 3 2))
   #f
   > (in-relation eq? '(1 1 1))
   #t
   > (in-relation eq? '(1 1 2))
   #f
   > (in-relation (lambda (x y) (eq? y (+ x 1))) '(1 2 3))
   #t
   > (in-relation (lambda (x y) (eq? y (+ x 1))) '(1 2 4))
   #f
   ```
   
   You are allowed to define auxiliary recursive functions but not
   allowed to use predefined recursive functions other than
   `foldl`. Using `foldl` is not mandatory. However, your
   implementation must be tail-recursive. You get 2 bonus points if
   your implementation uses only `foldl` and no other auxiliary
   recursive functions. **(4 Points + 2 Bonus Points)**
