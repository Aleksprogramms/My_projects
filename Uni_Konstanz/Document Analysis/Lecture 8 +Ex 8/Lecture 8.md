# Text Mining

# Text Classification


Text classification: Given a set of documents (a corpus) D and a set of classes C, assign a class c ∈ C to each document d ∈ D. Classification is supervised learning task(we need labels)

Example applications:

- Tracking and filtering of news articles by topic
- Organizing web pages into category hierarchies
- Sorting scientific articles on arxiv.org by discipline
- Encoding patient records using international insurance categories
- E-mail message filtering (aka spam detection)
- Categorizing DocAna lecture context into (exam relevant) and ( I'll maybe read it later...) 
- Etc.


## Text classification Methods

Manually created rules(hand-coded):

- Rules are typically based on combinations of words or other features
    - Spam detection example: black-list-address OR (dollars AND you won)
    - Author gender: fraction(pronouns) > 0.058
- Advvantage:
    - Easy to achive high precision if rules are carefully defined by experts
- Disadvanteges:
    - Recall tends to be low since rules are not comprehensive
    - Creating and maintaining these rules is expensive

The (very typical) solution:
We instead train a classifier on a labeled training corpus (i.e., supervised learning)


## Naive Bayes Text Classification

Naive Bayes Classifier:

- A simple yet efficient word-based classifier for documents
- Relies on a simple bag-of-words representation of documents
- Naive relates to the underlying assumption of independence:
    - We assume that features (here: words) are statistically independent of each other
    - This is obviously a strong simplification(e.g., consider the relation between determiners and nouns)
- Based on Bayes rule:

![alt text](image.png)

## Naive Bayes Overview

Training input:

- A collection of N documents
- A set C of classes c_k ∈ C for k = 1, 2, ..., |C|
- The vocabulary V of all words w_i ∈ V for i = 1, 2, ..., |V|

Input at prediction time:

- A new document d consisting of words w_1, w_2, ..., w_n

Desired output:

- Tht most likely class class(d) of document d

## Naive BAyes Computation: Class Probability

To determine the most likely class for document d, we want to find:

![alt text](image-1.png)

But how do we obtain p(d|c) and p(c)?

Computing p(c) from our training data for all calsses c is simple: it is the overall frequency of each class in our training data. ThusL

![alt text](image-2.png)

To compute p(d|c), we rewite p(d|c) = p (w1, w2, ..., w_n|c) since d consists of these words (bag-of-words assumption). THen we use the independence assumption to further rewrite:

![alt text](image-3.png)

Computing the individual p(w_i|c) from our training data is also simple: It is overall frequency of word w_i in all documents with class c.

![alt text](image-4.png)


  
  