#  Language Models

## Turing test

Can a machine pretend to be a human well enough in a (blind) conversation to fool a human into thinking it is a human?

## Applications of Language Models

- Natural language understanding (NLU)
    - Question answering systems
    - Chatbots
- Natural language generation (NLG)
    - Text summarization
    - Automated journalism
    - Chatbots
- Machine translation
- Text classification
- Named entity recognition
- Opinion mining
- Sentiment analysis
- ...

## Language models: Definition

Language model:

A language model is a probability distribution over sequences of words.

By using a language model, we can assign probabilities to words, given a sequence of other words. That is, we can predict the occurence of words.

![alt text](image.png)

Language model examples:

- n-grams
- Static embeddings
    - Word2vec
    - GloVe
    - FastText
    - etc
- Contextualized word embeddings
    - BERT
    - Llama
    - GPT-2/ GTP-3/ GPT-4
    - DeepSeek R1
    - etc.

# Limitaions of Discrete models of language


## A core NLP task: Word Similarity

Many applications in text processing and information retrieval rely on word similarity as a core task that needs to be solved.

- Spell checking 
    - Similarity between individual words
- Search
    - Similarity between a sentence and the content of a document
- Duplicate Detection
    - Similarity between two documents
- Summarization
    - Removal of redundant (= similar) sentences in a document
- Translation
    - Finding a similar words in a different language

A similarity between sentences or documents can often be derived from word similarities.

## Word similarity in manually created models

We already know that manually curated models of language like WordNet are a great resouce that can be used to compute word similarities. But:

- WordNet is missing nuance
- WordNet is missing new meanings of words until they are added
- WordNet is subjective and biased by the annotators' perspective
- Requires constant human labor to create and update

## Similarity in the Vector Space Model

We also know how to compute similaritites between a query sentence and a document in the vector space model:

- Represent the query as a tf-idf encoded vector
- Represent each document as a tf-idf encoded vector
- Compute cosine similarities between query and documents

Can we use this to handle word similarities? Not really...

- Word 1: Hotel, w1 = [0, 0, 0, 0, 1, 0, 0]
- Word 2: Hotel, w2 = [0, 0, 0, 1, 0, 0, 0]
- CosineSim(w1,w2) = 0
- Normalizing the values of w1 and w2 with tf-idf does not change this "similarity". 

## One-Hot Vector Encodings

In the vector space model, we are using a localist representation:

- The dimension of the vector space is equal to the vocabulary size
- Each word (or lemma, or stem) corresponds to exactly on dimension
- A single word is encoded by a one-hot vector:
    - All but one vector components are equal to 0 (these components are "cold")
    - Only the component in the dimension that coresponds to the word itself has a value of 1 (the component is "hot")
- Individual word vectors are orthogonal by definition 
- There is no notion of word similarity in the vector space model

![alt text](image-1.png)

## Fundamental limitations of the Vector Space Model

The vector space model is designed to compare sequences of text based on the words they contain. But even that is problematic.

Historical solution in information retrieval: Query expansion

- Keep a dictionary of similar words and use it to expand the queries
- E.g., if a user searches for motel, also add hotel to the query

## Towards Sematically Meaningful Word representations

Query expansion is a (set of) heuristic(s) specifically designed to work around the inability of the vector space model to represent semantic meaning.

## Dense word vector representations

In theory:

Instead of a term-document matrix, we want a term-concept matrix, in which each word is ranked according to the strength of its relation to a semantic concept.

- hotel and motel are very similar and differ mostly in room prices and the quality of service.
- They are both similarly low on a scale that rates the relevance for teaching, while an university is higher on that scale.

The rows of such a matrix could then be used as vector representations of the words. Similar words would have similar vectors.

![alt text](image-2.png)
![alt text](image-3.png)

In practice:

How can we create such a matrix? Manual curation is entirely infeasible:

- How do we decide on the values?
- How do we choose the concepts? 
- We still have to update the model with new words
- The also have to update in case of semantic shifts

-> We need a way of learning dense vector representations from data.

# Word Embeddings

## Word Embeddings: Definitions

Embedding of words:

Given a training corpus, the embedding of words is the process of assigning a vector (in a latent space) to each word, based on the content of the corpus (by using some algorithm)

Word Embedding:

The vector that is assigned to a word as the result of the above process is often called the embedding of the word.

## Latent Space

A latent space(also called embedding space) is a vector space in which items are placed in such a way that similar items are placed in proximity. Typically (but not always), latent spaces have a lower rank (dimensionality) than the original space of the data.

![alt text](image-4.png)

## Embedding Spaces for Words

For creating word embedding, the embedding algorithm should:

- Place similar and/or related words in close proximity in the latent space
- Use word (co-)occurrence information from the corpus
- Work without supervision (labeling data at this scale is infeasible)

Embedding Pipeline:

![alt text](image-5.png)

# Latent Semantic Analysis

## Dimensionality Reduction of Term-Document Matrices

![alt text](image-6.png)

Core idea: Use dimensionality reduction techniques to reduce the corpus dimension to a manageable size (e.g., n = 300) but leave the vocabulary dimension as it is. The resulting row vectors are dense and capture information regarding the occurence of words in the documents.

## Latent Semantic Analysis (LSA)

Formal approach:

- Compute a singular value decomposition A = UDV of the term-document matrix A 
- Reduce the number of dimensions to retain only the k most important dimensions
- Use the row vectors of U_k as wprd embeddings 

## Disadvanteges of LSA

Latent Semantic Analysis has a few downsides:

- It works solely based on global cooccurrence statistics (it only knows whether words occur in the same documents)
- It does not enable us to use compositional semantics 

## Distibutional Semantics

Distributional Semantics:

- The meaning of words is indicated by the context in which they occur
- So let's use the context of a word to represent it!
-> we are using word coocurence inforamtion.

Word embeddings derived from principle are called distributed representations (in contrast to localist represenations)

## Cooccurrence: Context and Context Windows

Core idea:

- When a word w appears in a text, its context is the set of words that appear nearby
- We use the combined contexts to learn the representation of word w

Example (window size = 2) for the word banking:

...decisions [causing a banking crises as] in 2009...
...Europe [needs unified banking regulations to] replace...
...India has just [given its banking system a] shot in the arm...


# word2vec

## The Cloze Task

Cloze Task:

The cloze test (also called cloze deletion test) is a fill-in-the-blank style examination taks. For example, we can easily fill in this blank:

Natural language processing is all about ____ models.

When using word2vec to create word embeddings, we are essentially training a computer to solve this task on two variantions:

- Given some context, learn to predict a missing word. (this is called contionous bag of words or CBOW)
- Given a word, learn to predict the context(this is called skipgram)

## From a corpus to Training Data: skipgram

We generate training data by:

- Iterating over the corpus step-by=step with a fixed window size 
- Extracting pairs of the input word in the center of the window and one target word
![alt text](image-7.png)
![alt text](image-8.png)
Generating training data for CBOW works the same way, except input and target words are reversed.

## From a corpus to Training DataL Negative Samppling

We have so far generated on;y positive example(words that actually do cooccur)

- Training a classifier only on this data would be pointless!
- Learning nothing and always predicting cooccurrence would result in perfect accuracy
-> We need to add negative examples by picking random output words

![alt text](image-9.png)

## Word2vec: Model Intialization

Word2vec is a shallow network architecture with just tow layers. The layers are an embedding layer (used for learning representations of the input words) and a context layer (used for learning represenatations of the output words).

The matrices are initialized with random values. The embedding size is the selected dimensionality of our latent space (typically 300 dimensions).

![alt text](image-10.png)

## Word2vec: Model Training (1)

When training word2vec, we repeatedly iterate over the training data.

- For each input word, we find the corresponding row in the embedding matrix and retrieve the current embedding
- For the positive and negative output words, we find the corresponding rows in the context matrix and retrieve the current embeddings

![alt text](image-11.png)

![alt text](image-12.png)

## Word2vec: Model Training (2)

For each embedding-context pair, we compute the dot product (~ cosine similarity)

- The similarity is used topredict the likelihood of the target occuring in the context
- We use the error to update the embeddings in both matrices
- This process is repeated for multiple cycles over all data points until it converges

![alt text](image-13.png)

## Word2vec: Output 

After convergence is reached, we discard the context matrix and use the embedding matrix for our word embeddings. Each row contains the embedding of the corresponding word in the vocanbulary. 

![alt text](image-14.png)

## How word2vec Works Intuitively

Why does word2vec produce word embeddings that produce meaningful word similarity?

- During Intialization, each word starts at a random location in the latent space
- During training, each word is pulled closer towards frequently cooccurring words
- During training, each word is pushed away from non-cooccuring words
- Words end up in the proximilty of other words that occur in similar contexts
- Think of it as similutaneous high-dimensional tug-of-war

![alt text](image-15.png)

## Dense word embeddings: Visulaized 

![alt text](image-16.png)

# Compositional Semantics

## Additive Compositionality

Word2vec was created with the idea of supproting arithmetic solution of analogy tasks:

king - man + woman = queen

![alt text](image-17.png)

##  Compositional Semantics in a Nutshell

The idea behind compositional semantics:

- Common semantic concepts are implicity encoded as directions in the latent space
    - Gender
    - Verb tenses
    - Country/capital relations
    - etc.

- The relevance of this is hard to overstate:
    Being able to arithmetically solve semantic challenges on data from an ussupervised model is a huge step towards machine intelligence! 


But this ability of language models was (and still is) severely overhyped....:))))


## Word of Caution: Similarity != Relatedness

Word embeddings can be used for many downstream applications. Make sure that the assumptions used when applying them match the assumptions made during training!

![alt text](image-18.png)

![alt text](image-19.png)

