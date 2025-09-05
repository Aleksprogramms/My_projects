# Foundation & Pre-proccesing

NLP - Natural Language Processing

## Anaphora Resolution
We gave the monkeys bananas
because **they** were hungry.

We gave the monkeys bananas
because **they** were over-ripe.

## Heteronyms 
content, noun                         != content,adjective 
Definition:                              Definition:  
The topic treated in a written work      contented,satisfied
Example:                                 Example:
The content is exquisitely witten.       She was content with her life as it was

## Evolution of NLP Methods

### Rules and memorization

- Current thinking in psycholinguistics: we combine rules and memorization
- Similar to Two System Thinking
  - System 1: fast, instinctive, and emotional
  - System 2: slow, deliberative, and logical
- Note: it's contoversial
Mechanism:
- If applicable rule, apply the rule
- If memorized version, memory takes precedence
- Example: recognizing past tenses of irregular verb forms
  - think -> thought
  - blink -> blinked

 ## Resolving Linguistic Challenges Computationally

 Consecutive evolution of three major types of approaches:

 - Rule-based models (until the 1990s)
 - Statical models / corpus linguistics (until the 2010s)
 - (Deep) neural network models (work in progress)

### Rule-based NLP
- Languages are inherently rule-based (to a point)
- A skilled linguis can create rules that solve many problems in NLP quite well
- However, this doe not scale and meaning is not rule-based
-> Diminishing returns

### Statical Language Models and corpus linguistics

- The idea had been around longer, but in the 1990s, we reached thesholds for
  - computing power,
  - storage space, and
  - available digital text data
- Core idea: combine memorizing word cooccurrnece patterns and learned rules
- How to do it:
   - Obtain large text collections (called corpora)
   - compute statistics over words (co)occurences in those collections,
   - use these statistics to make "smarter" decisions with rules,
   - or learn rules directly from the statistics


## Corpus Linguistic Example: Grammar checker

Task: Decide whether to use <principle> or <principle> in the senctence:
Solution: Look at which words sorround each use in the corpus
Algorithm: Keep track of all words that coocur with each spelling in the corpus
At grammar-check time, choose the spelling best predicted by the "surrounding" words.
 
## Zipf's Law

## Deep Learning for NLP

Neural language models:

- In the early 2000s, we reacehd new thesholds for
  - parallel computing power
  - storage space, and
  - available text data.
- Core idea: feed web-scale corpora of unlabeled text into (deep) neural networks with billions of parameters to learn word cooccurence patterns
- Current deep neural language models:
  - can solve some MLP tasks better than humans
  - can solve tasks for which they have not or barely been trained (transfer learning, zero-shot learning)
  - can be quite biased (garbage in, garbage out)

## Elements of Language

Sound - Phonetics
Grammar - Phonology, Morphology, Syntax
Meaning - Semantics

## NLP Hierachy

Sentence -> Phrase -> Words

Words can be subdivided further:

- Phonemes: studies -> s-t-u-d-i-e-s
- Morphemes: studies -> studi-es
- Syllables: studies -> stud-ies
- Lemma: studies -> study
- Stem: Studies -> studi
  
## Morphology: Terminology

Morphology:
- The study of the way in which words are constructed from smaller units of meaning

Morpheme:
- The smallest meaningful unit in the grammar of a language

Contrasts in morphology:
- Derivational morphology vs. inflectional morphology
- Concatenative morphology vs. templatic morphology (root-and-pattern)
