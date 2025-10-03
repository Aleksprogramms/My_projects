
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

## Feature-based Tagging[-]

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

## Unigram tagger[++]

How it works?

- We have access to an annotated text corpus (= our training data)
- We create statistics of how many times each token is seen with each POS tag(= the training process)
- Based on these learned frequencies, we use the training model on new, unseen text to associte with each word its most likely POS tag( = prediction)

Problem: the most frequent tag is obviously not always correct! we need to know in which sense that is being used. We need to take the context into account.

## N-grams POS tagger[++]

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

## Rule-based Tagging[+]

The Brill Tagger 

An example of transformation-based learning

- Core idea:

    - Use a probabilistic approach first
    - Then revise and correct it using contextual rules

- Similar to painting: sketch first, then paint propertly
- Very popular
- The rules are linguistically interpretable
- It is a supervies method and therefore require a tagged corpus

Process:

Intialization: 

- Tag each word with the most likely POS (as observed in corpus)
- For words that are not in the corpus
    - If it os capitalized: label as noun
    - For token that end in the same three letters as a word with known tag: use the tag of the known word(e.g., labeling[VBG])

Patching:
- Find suitable instances and apply patches to improve the result
- Example of patch:
    - If one of the two preceding words is tagged as a determiner, change the tag tokens that are tagged as a verb to noun

# Parsing

## Formal grammar [-]

A formal grammar G = (N, T, P, S) provides a scheme for generating a formal language, if consists of:

- A finite set of non-terminal symbols N (constituents)
- A finite set of terminal symbols T(words)
- A start symbol S (a sentence)
- A finite set of production rules P of the form: left hand side -> right hand side

The grammar's language L(G) is the set of all sequneces of terminal symbols that can be generated with the grammar. To generate a sentence from the language:

- Beginning with the start symbol, consecutively apply rules("derivation")
- Applying a rule replaces all symbols on the left hand side with the right hand side.
- Once any termianl symbols remain, the derivation is complete.

## Chomsky normal form[+]

Four types of languages:

- Type-0: Recursively enumerable languages
    - Rules have the form γ → α (no constraints)
- Type-1: Context-sensitive languages
    - Rules have the form: αAβ → αγβ
- Type-2: context-free languages
    - Rules have the form: A -> α
- Type-3: Regular languages
    - Rules have the form: A -> a or A -> aB

WhereL
a is a terminal symbol. \
A,B are non-terminal symbols. \
α, β, γ are arbitary sequences of terminal / non-terminal symbols. \
α and β maybe empty. γ cannot be empty. \

A context-free grammar (GCF), is said to be in Chomsky normal form if all of its production rules are in one of the following three forms:

- A -> BC
- A -> a
- S -> ε

Where:

- A,B,C are nonterminal symbols
- a is a terminal symbol
- S is the start symbol
- ε denotes the empty string
- Neither B nor C can be S

## Phrase structure [+]

Constituency

Phrase sturcture organizes words into nested constituents. But what is a constituent?

- A word or a group of words that function as a single unit withtin a hierarchial structure.
- A constituent behaves as a unit that can appear in different places.

Example:


Mr. Mackey talked [to the children] [about drugs].
Mr. Mackey talked [about drugs] [to the children].
*Mr. Mackey talked drugs about to the children.

A* in examples typically denotes ungrammatical or unobserved sentences.

Consider how we can generate sentences (S):

- A simple grammar for a single sentence: e.g., "Birds fly"

    - S -> NN VB
    - NN -> birds | planes | superheroes
    - VB -> fly | sing | fall
- Other sample sentences : "Birds sing", "Superheroes fly", etc.

Limitation: In the above examples, verbs are intransitive (they do not have a direct object)

- Example: superheroes save [who|what]
- We need transitive verbs and direct objects
- We need determiners, e.g. "the mayor", "the day"

## Syntactic ambiguity [+]

Syntactic ambiguities can result in semantically different but syntactiacally correct tree structures:

- prepositional phrase attachment: The boy saw the woman with the telescope
- coordination scope: small boys and girls are playing
- Particals vs. prepositions: she ran up a large bill
- Gerund vs. adjectives: Frigthening kids can cause troubles.

![alt text](image-1.png)

## Constituency parsing [++]

a parse tree (or derivation tree) is an ordered rooted tree that graphically represents the syntactic information of a string derived from a (context-free) grammar. There are twoo different approaches to generate a parse tree.

Top-down approach:

- Starts with the starting symbol S
- Iteratively moves down towards tree leaves using production ru;es
- Problem: Explores options that won't lead to a full parse

Bottom-up approach

- Starts from tree-leaves (= tokens)
- Proceeds upward to the root (= the starting symbol S)
- Problem: Explores options that don't match the full sentence(-> backtracking)

## Leftmost Derivation[+]

Leftmost derivation is not a specific algorithm, but rather a class of Algorithms (further reading: see "LL parsers"). It is designed for restricted context free grammars (e.g., programming languages) and does not work perfectly on natural language.

Leftmost derivation is an example of top-down parsing

Algorithm outline:

- Starts with S
- In each step, apply a production rule to the leftmost non-termial symbol
- Produce the observed terminal symbols (= tokens)
- Terminates once all observed words have been created.
Example: 
- S
- [S -> NP VP]
- [NP - > DT NN] VP
- [DT -> The] NN VP
- The [NN -> apple] VP
- The apple [VP -> ...]

![alt text](image-2.png)

## Shift Reduce Parser[++]

A shift reduce parser is effectively a pushdown automaton that uses a stack of recognizing a context free language. It is an example of bottom-up parsing

Algorithm outline:

- SHIFT operation: Push a word from the input sentence onto the stack
- REDUCE operation: if the top n words on the top of the stack match the right hand side of a production rule, then they are popped and replaced by the left hand side of the production.
- STOPPING condition: The process stops when the input has been processed and S have been popped from the stack

![alt text](image-3.png)

## CKY parser[+]

The Cocke-Kasami-Younger parser uses dynamic programming. it is an example of a bottom-up parser.

Core idea:

- Cache indermediate results
- For building a parse for a sequence [i,j], keep track of all parser of subsequences [i,k] and [k,j] that are included in it (i <= k <= j).

Advantage:

- Backtracking: if the parser gets stuck, we can easily go back to a previous alternative

Downside:

- Required a binarized grammar
- The grammar must be in Chomsky Normal Form

![alt text](image-4.png)

![alt text](image-5.png)

## Statistical parsing [-]

How can we resolve ambigous parse trees?

Core idea:

- Use a grammar that attaches a probaility to a production rule: probabilistic context free grammar (PCFG)
- All probabilities p of identical left hand side symbols in rules must sum up to 1
- The probability of a parse tree is the product of all used production rules
- Probabilities can be learned from a lebeled training corpus(treebank): p (S -> NP VP) = count (S -> NP VP) / count (S)

## Lexicalized Parsing [-]

Using corpus statistics, we can go even further and construct a parse that takes lexical relations into account to compute probabilities.

Core idea: 

- we dont just check the probability of rules, e.g. VP -> VP PP
- Instead, we also check the Probabilities of terminals, e.g. VP[ate] -> VP[ate] PP [with]
- We can better model whether a specific PP belongs to a VP or NP

![alt text](image-6.png)

## Dependency parsing [--]

Dependency grammar assumes that syntactic structure consists only of dependencies between tokens,

- Dependencies are (labeled) asymmetric binary between two token
- Dependencies typically from a tree with a single head (the root)

![alt text](image-7.png)

Dependency parsing vs. Constituency parsing

Dependency parsing:

- Models natural language via a dependency grammar
- Create linguistic structure from the dependencies of tokens
- Useful when we are interested in relations between words

Constituency parsing:

- Models natural language as a context free grammar
- Breaks text down into a phrase structure (constituents)
- Constructs the syntactic structure from constituents
- Useful when we are interested in phrases


# Named Enity Recognition and Linking 

## Events [--]

The 5 Ws of Journalism

Who was involved? What happend? When did it happen? Where did it happen? Why did it happen?

## Named Entity types[-]

Common types of named Entities

The core set:

- Persons
- Locations
- Organizations

Further useful named entity types:

- Dates
- Times
- Numeric expressions

Domain-specific entity types:

- Chemicals
- Genes
- Stock symbols
- Laws 
- URLs
- etc

## The NER Task [++]

Goal:

- identify named entities in a document and tag them with a type.

Applications:

- Named entity in a text can be indexed, linked to external databases, etc
- Sentiment can be attributed to companies or products
- Identify relations between named entites
- In question answering: answers are often named entities
- Google knowledge graphs answers
- etc...

## Sequence Labeling for NER[+]

via Machine Learning

Training:

1. Collect set of representative training documents
2. Manually label each token for its entity class (PER, LOC, ORG, etc.) or other (O)
3. Design appropriate feature extractors for the text and classes
4. Train a sequence classifier to predict the labels from the data

Testing / Classification:

- For a set of new. unlabeled input documents:
    - Run the sequence model in inference mode to label each token
    - Output the recognized entities

In practice:

- Inside-Outside (IO) encoding is less precise
- Inside-Outside-Begging(IOB) encoding is more precise but requires a larger tagset (2c + 1 classes vs, c+ 1 classes in IO encoding)
- But: the benefit is limited in practice, so IO is often used

## Features for NER[+]

Token-level features

- Current token
    - Effectively, this is dictionary learning
    - Example: Barbara is typically (part of) a name
- Previous/ next word (token)

Tag-level features

- Inferred linguistic classification (e.g. POS tags)

Label-level features:

- Previous (and perhaps next) named entity label in the current sequence
- Example: Jon [PER] Snow [PER]

Many types of named entities have characteristics name structures in which substrings increase the likelihood for a certain type of entity:

- Substring "oxa" in drug names

- Substring field in location names

- Special characters like a colon(:) in movie titles

Some named entity names tend to follow patterns that can be mapped to a simplified representation based on attributes such as:

- Token length
- Capitalization
- Numerals
- Greek letter
- Internal punctuation
- etc. 

## Named entity disambiguation[+]

Named entity ambiguity - The Tesla chief executive.... Who? Company? Person? Unit?

Normalization: Reducing or rewriting something to a common (normal) form. Example:

- Mathematics: normalizing a fraction
    - 1 / 2 = 2 / 4

- Mathematics: normalizing a vector to unit length
    - v' = v / |v|

- Formal grammars:
    - Chomsky Normal Form for CFGs

- Databases:
    - 1NF, 2NF, 3NF, EKNF, etc.

- Person names:
    - Donald Trump, also known as: Donald J. Trump, POTUS, 45-47, President Trump...

## Named Entity Linking [+]

How can we match entity mentions in a text to identities in a knowledge base? This is often modeled as a ML prediction task: Given an entity mention in a text, predict the most likely corresponding entity in a knowledge base.

Core steps:
    - Mention detection (= named entity recognition)
    - Candidate generation (= string matching to knowledge base entries)
    - Candidate ranking using features:
        - Context features: tokens around the entity ,entions
        - Knowldege graph structural features (e.g. graph centratility)
        - Unambiguous entity mentions in the context
        - Heuristic features (e.g., overall popularity of an entity)

Drawbacks:

- Engineering the strcuture of a knowledge graph(an ontology) is difficult and subjective, but directly affects how useful it is. 

Examples:

- Places categories in Wikidata: Are they populated places or levels in an organizational hierarchy? 
- Jesus in Wikidata: A person? God? A prophet? Real or fictional?



## Normalizing temporal expressions [-]

For temporal expressions, we can use a rule-based normalization tather than tlinking them to a knowldege graph. For example:

January 12, 2022 at 2 pm -> 2022-01-12 14:00 UTC

But different types of temporal expressions require different rules for normalization:

- Absolute temporal expressions:
    - January 12, 2022; International Worker's day 1997; during the Council of Conctance

- Relative temporal expressions
    - yesterday; this afternoon; the day before


For relative temporal expressions, a reference time is necessary, which requires domain knowledge to retrieve.

News-style texts: Use publicatin metadata

- Elon-Musk revealed on Thursday that...
- New article published on Saturday, 16.04.2022
- Thursday -> 2022-04-14

Narrative texts: use preceding information in paragraph

- Keep track of last mentioned date
- Use as reference for normalization

## NE-based Application:

implicit Network vs. Knowledge graph

![alt text](image-8.png)

Generating Implicit networks from a corpus

![alt text](image-9.png)

implicit Networks: Pipeline Architecture

![alt text](image-10.png)

Extracting implicit entity relations

problem: How can we discover complex relations for a (a set of) entities? Query ⟨Location | Barack Obama, Hillary Clinton⟩

![alt text](image-11.png)

![alt text](image-12.png)

# Similarity and Search

## Types of word similarity[+]

Surface form similarity:

- Phonological similarity (e.g. brake | break)
- Morphological similarity (e.g. respect | resctful)
- Spelling similarity (e.g. theater | theather)

Semantic similarity:

- Synonymy (e.g. verbose | wordy)
- Hypernymy, Hyponymy (e.g. color | red)

Content similarity:

- Sentence similarity (e.g. paraphrases)
- Document similairy (e.g. two news stories on the same event)

## Phonological similarity[-]

Words with the similar pronunciation are encoded to the same representation so they can be mathced despite minor differences in spelling.

## Soundex algorithm [--]

Idea:

- Turn every tokeninto a 4-character reduced form
- Build an index on the reduced forms
- Apply the same encoding to query terms(= tokens in the query)
- Search the index for phonetically similar tokens that have some encoding

Algorithm:

1. Retain the first character of the word
2. Replace all occurrences A, E, I, O, U, H, W, Y with digit  0
3. Characters from the following sets into digits:
    - 1 <- B,F,P,V
    - 2 <- C, G, J, K, Q, S, X, Z 
    - 3 <- D, T
    - 4 <- L
    - 5 <- M, N
    - 6 <- R
4. If two adjacent digits are identical, remove one of them
5. Remove all zeros from the string
6. Return the list four characters of the string (pad with trailing 0s if necessary)

Disadvanteges:

- Language specificness: originaly developed for English
- Homophonous names starting with a different character
    - Craft (C613)
    - Kraft (K613)
- Unable to discriminate between long words (4-character limit)
- Conflation of unrelated family names:
    - Saint (S530)
    - Sand  (S530)
    - Snead (S530)
    - Sunday (S530)

## Morphological similarity [+]

?

## Levenstein distance [++]

Idea benind the Levenstein Distance (also called edit distance): Given two strings s1 and s2, count the minimum number of basic operations to convert one string to the other.

Basic-operations are typically character-level:

- Insert
- Delete
- Replace (i.e., subsitute)

Example:

- The edit distance between rain and shine is 3
- We need to replace two characters and insert one character

Wagner-Fischer Algorithm

Step 1: Setup and parameters

Set n to be the length of string s \
Set  m to be the length of string t \ 
If n = 0, return m and exit \
If m = 0, return n and exit. \
Construct a matrix containing 0...m rows and 0...n columns. 

Step 2: Initialization

initialize the zeroth row to 0..n \
initialize the zeroth column to 0..m 

Step 3: iteration

For i from 1 ... m // iterate over rows \
For j from 1...n // iterate over columns

if s[i] = t[j] then SubCost:= 0 // retain character \
if s[i] != t[j] then SubCost := 1 // replace character 

d[i,j] := minimum (d[i - 1, j] + 1), // Deletion \
d[i, j - 1] + 1, // Insertion \
d[i - 1, j - 1] + subCost) //substitution

return d[m,n]

![alt text](image-13.png)

## Semantic relations [+]

Synonymy: 

- Different words with similar meaning (e.g., big | large)
- Synonyms differ in their frequency of use and the context

Antonymy:

- Words that are near opposites (e.g., raise | lower)

Hypernymy:

- Supertype of a words (e.g., red is a color)

Hyponymy:

- Subtype of a word (inverse of hypernymy)

Meronymy:

- A word is part of lager whole (e.g. a flock of sheep includes a sheep)

## WordNet[-]

WordNet is a database of words and semantic relations between them. The main relation is hypernymy, so the overall structure is tree-like.

Parent hierarchy of the different meanings of bar:

- Barroom, bar → room → area → structure → artifact ...
- Bar → counter → table → furniture → ... → artifact ...
- Bar → implement → instrumentation → artifact ...
- Bar → musical notation → notation → writing → ...

However:

- Not all words share the same root
- WordNet has multiple roots
- WordNet is a forest, not just a tree

In principle, the higher distance the lower the similarity! But there are problems:

- A specific word may not be in any tree
- Hypernymy edges are not all equally apart in similarity space
- Many more detailed graph-based semantic similarity measures have been developed

## The vector space model [++]

Boolean retrieval

The simpliest information retrieval system:

- Create an index of all words in the documents
- Represent queries as Boolean Expressions (Caesar AND Brutus)
- The retriecal engine returns all documents that match the expression
- Stemming and Lemmatization can help to improve recall

Indexing and retrieval:

- Create a matrix of the document collection that contains all distinct terms
- Set the value to 1 if the corresponding document contains the given term
- Return all documents that have a value of 1 in all cells corresponding to query terms

Scoring for ranked retrieval

But what happens if many documents match?

-> we want to return the documents in an order that is likely to be useful to the searcher

How can we rank (= order) the documents in the collection with respect to a query?

- Assign a score to each document (typically in the range [0,1])
- The score measures how well the document and the query "match"
- We need a way to assign (similarity) score to a query/document pair

## TF - IDF [+++]

Term friquency matrix

To have data for a scoring function, term frequency informatoin is helpful:

- We can store term frequency counts instead of binary values in the matrix
- Each document is now represented by a count vector
- Note: word order is nor retained in a vector. This approach is called bag of words(BOW)

Term frequency

The term frequency tf_(t,d) of document d is defined as the number of times that t occurs in d.

- A document with 10 occurences if the term Hamlet is more relevant for a query containing Hamlet than a document with just one occurence
- But probably not 10 times more relevant

-> Relevance does not increase proportionally with term frequency