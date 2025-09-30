
# Foundations

NLP - Natural Languages Processing

## The challenges of NLP [+]

?

## Evolution of NLP Methods [+]

Rule-based NLP

- Languages are inherently rule-based (to a point)
- A skilled linguist can create rules that solve many problems in NLP quite well
- However, this does not scale and meaning is not rule-based

Statical Language Models and Corpus linguistics

- The idea had been around longer, but in the 1990s, we reached thresholds for
    - computing power
    - storage space
    - available digital text data

- Core idea: combine memorizing word cooccurence patterns and learned rules
- How to do it: 
    - Obtain large text collections
    - Compute statistics over words (co)occurences in those collections
    - Use these statistics to make 'smarter' decisions with rules
    - Or learn rules directly from the statistics

Deep Learning for NLP

Neural language models:

- In the early 2000s, we reached new thresholds for
    - parallel computing power
    - storage space, and
    - available text data

- Core idea: feed web-scale corpora of unlabeled text into (deep) neural networks with billions of parameters to learn word cooccurence patterns
- Current deep neural language models:
    - can solve NLP tasks better than humans
    - can solve tasks for which they have not or barely been trained (transfer learning, zero-shot learning)
    - can be quite biased (GAGO)

## Distributional sematics [++]

?

## Zipf's law [+++]

the most frequent word will occur approximately twice as often as the second most frequent word, three times as often as the third most frequent word, etc.

## Elements of Language [-]

- Sound - Phonetic 
- Grammar - Phonology, Morpholohy, Syntax
- Meaning - Semantics

## Morphology [++]

Morphology:
- The study of the way in which words are constructed from smaller units of meaning

Morpheme:
- The smallest meaningful unit in the grammar of a language

Example of Morphemes 

unladylike

- 3 morphemes, 4 syllables
    - un-: meaning "not"
    - lady: meaning "(well behaved) female adult human"
    - -like: meaning "Having the characteristics of"

techinque 

- 1 morpheme, 2 syllables

dogs

- 2 morphemes, 1 syllable
    - dog: meaning "a domestic animal"
    - -s: a plural marker for nouns

Typical word classes:

- Parts of speech: noun, verb, adjectives, etc.

Inflection:

- Variation in the form of a word, typically by means of an affix, that expresses a grammatical contrast.
- Does not change the word class.
- Usually produces a predictable, non-idiosyncratic change of meaning.
- Example: run -> runs | running

Derivation:

- The formation of a new word or inflectable stem from anther word or stem.
- Example: compute -> computer -> computerization 

Inflectional Morphology:

Typically, inflectional morphology:

- Does not change the word class
- Modifies words to serve a new grammatical role
- Adds morphemes that encode
    - tense, number, person, mood, aspect, etc.
- English example:
    - The pizza guy arrives at noon.
    - arrive is inflected for person (3rd person) and number (singular)

Derivational Morphology

Normalization: formation of nouns from other parts of speech

- compute -> computerization
- appoint -> appointee
- kill -> killer
- fuzzy -> fuzziness formation of adjectives (primarily from nouns)
- computer -> computational
- clue -> clueless
- embrace -> embraceable

Morphemes: Terminology

Root: The components of word is that 

- common to a set of derived or inflected forms, if any, when all affixes are removed
- cannot be split futher into meaningful components
- carries the principal portion of meaning of the words

## Tokenization [+]

Token:

- The occurence of a word in a text

Tokenization:

- Segmentation of an input stream into an ordered sequence of tokens 

Tokemizer:

- A system that splits text into word tokens

Example:

- Input text: John likes Mary and Mary likes John.

- Tokens: {"John", "likes", "Mary", "and", "Mary", "likes", "John", "."}

## Stemming [+]

Stemming usually refers to a crude heuristic process that chops off the ends of words in the hope of achieving this goal correctly most of the time.

Example: studying / studies -> studi

## Porter Stemmer [-]

A simple approach:

- We effectively chop off the end of the word
- Only suffixies are considered for removal
- Frequently used algorithm
- Results are pretty ugly

caresses -> caress
libraries -> librari
dogs -> dog

## Lemmatization [+]

Lemmatization usually refers to doing things properly with the use of a vocabulary and moprhological analysis of words, normally aiming to remove inflectional endings only and return the based or dictionary form of a word, which is known as the lemma.

Example: studying / studies -> (to) study

# Part of Speech Tagging

## POS hierarchy[+]

![alt text](image.png)

## The POS tagging task[++]

Words often have more than one POS

The POS tagging problem addresses how to determine the POS tag for a particular instance of a word in a given context.

The purpose of POS tagging

1. Collapsing distinction into equivalence classes
    - All personal pronouns (You, they, etc) tagged with PRP

2. Introducing distinctions to resolve ambiguities
    - E.g. leaves could be tagged with NN or VB

3. Helpful features in classification and prediction tasks
    - Named Entity Extraction
    - Machine Translation

Terminology

Tagging
- The process of assosiating labels with each token in text
- Not limited to parts of speech

Tags
- The labels that are assigned to the tokens

Tag Set
- The collection of tags that is used for a particular task
- Tag sets are defined by linguists and not unambigous
- Different languages require different language-specific tag sets-> it is difficult to compare tags between different languages

## Feature-based Tagging

Probabilistic methods 

- Use a corpus for training
- Obtain POS probabilities from manual annotations of the corpus
- Language-agnostic: Method can be applied to different languages

Tagging with Lexical Frequencies

Problem: How can we determine the most likely POS tag for a given token?
Solution: Derive probabilities from a large, annotated text corpus

Rule-based methods

- Use linguistic knowledge
- Knowledge is mapped to rules
- Rules are easy to interpret
- Each language needs its own rules

## Unigram tager

How it works?

- We have access to an annotated text corpus (= our training data)
- We create statistics of how many times each token is seen with each POS tag(= the training process)
- Based on these learned frequencies, we use the training model on new, unseen text to associte with each word its most likely POS tag( = prediction)

Problem: the most frequent tag is obviously not always correct! we need to know in which sense that is being used. We need to take the context into account.

## N-grams POS tagger

Core idea:

- Use the unigram probability for the current token (-> unigram tagger)
- Use the predicted preceding n-1 tags
- Optionally: We could also use the preceding n-1 tokens, but this is impractical

Bigram tagger:

- Prediction: What is the most likely tag for token n, given token n and tag n - 1?
- The tagger picks the tag which is most likely, given the context

Backoff: Combining Multiple Taggers

- Attempt to tag the token with the 1st order tagger (e.g. bigram tagger)
- If the 1st order tagger is unable to find a tag for the token, fall back to using a 0th order tagger (e.g., unigram tagger)
- If the 0th order tagger is also unable to find a tag, use the default tagger to find a tag(e.g. feature based tagger)


Important note:
Bigram and trigram taggers need the previous tag context to assign new tags. If they see a [ na ] tag in the previous context, they will also print [ na ]. -> Error propagation

## Rule-based Tagging

The Brill Tagger 

An example of transformation-based learning

- Core idea:

    - Use a probabilistic approach first
    - Then revise and correct it using contextual rules

- Similar to painting: sketch first, then paint propertly
- Very popular
- The rules are linguistically interpretable
- It is a supervies method and therefore require a tagged corpus

