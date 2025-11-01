# Solution 1

## Tutorial Question 1.1 Motivation

''' You are working in a software development company.
A customer sends you an email for developing a complex system.

a) What tasks do you have to do to run the project? '''

1. Get software requirements
2. Make software design
3. Implement and integrate both 
4. Check quality
5. Operate and maintain

## Tutorial Question 1.2 Software Engineering

''' a) What is Software Engineering? ''' 

Software Engineering - (1) The application of a systematic, disciplined, quantidiable approach to the development, operation, and maintenance of software: that is, the application of enginnering to software.
(2) the study of approaches as in

''' b) How does Software Engineering help to run projects successfully? '''

It helps to:

- make proper specification and documentation
- introduce further concepts

## Execise 1.1 Software Engineering

''' The characteristics of an engineering discipline are:

- using well-understood technologies,
- using well-defined processes,
- predictability of process stage results,
- repeatability of process steps 

a) How are these characteristics applied in Software Engineering? Provide two examples. '''

using well-defined processes -  the software guarantees a level of quality of service (weaker condition than correctness)

repeatability of process steps - avoid re-inverting the wheel: save development costs, and rely on previously used, tested and verified code

## Exercise 1.2 Software Crisis

''' In no more than 10 lines, explain the indicators of the software crisis, the problems that caused
the crisis, and how Software Engineering can tackle those problems. '''

"software crisis" or the "software gap" between what was hoped for from a complex software system, and what was typically achieved.

Symptoms:

- Software products are being delivered late
- Software projects exceed budget
- Delivered software often does not really do what is supposed to
- Software products are defective when delivered
- Large projects get abandened before delivery of a product

To solve this we need to use proper software Life-Cycle activities (process models)


## Exercise 1.3 Faults and Failures

''' Consider the following Java method that should compute the number of negative values in an array vec

1   public int countNeg ( int [] vec) {
2       int count = 0;
3       for ( int i = vec . length ; i > 0; i - -) {
4           if ( vec[i] < 0) {
5               count ++;
6           }
7       }
8       return count ;
9   }
10

a) Briefly explain "faults" and "failures." '''

fault - A manifestation of an error in software

failure - termination of the ability of a product to perform a required function or its inability to perform whithin previously specified limits. 

''' b) Identify the fault(s) in the above Java method and explain the associated failure(s). '''

fault - index is out of bound (line 4)
failure - the code does not compute, due to this out of bound. So, the function returns error

'''c) Does every execution of the method containing the faults lead to a failure? If you answer
"yes," briefly explain why this is the case. Otherwise, provide a value of vec for which
executing countNeg(vec) does not lead to a failure.
 '''

Nope, vec = {}, returns 0, which is true
