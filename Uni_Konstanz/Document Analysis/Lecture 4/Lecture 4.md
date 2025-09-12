

# Named Entity Recognition and Linking


## Named Entites & Information Extraction


The 5 Ws of Journalism

Who was involved?
What happend? 
When did it happen?
Where did it happen?
Why did it happen?

## Definitions: Entities and Named Entites

Entity:
- Philosophically: A thing that exists as itself, either concretely or abstractly
- Pragmatically: A physical object

Named Entity:

- A unique entity that is Identified by its name
- Examples:
    - Lake Constance (but not: water)
    - University of Konstanz(but not: university)
    - Elon Musk(but not: people)
    - Excalibur(but not: sword)

## Common Types of Named Entites

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

## Information Extrraction (IE) Systems

Goals:

- Identify and understand relevant parts of texts
- Gather, collate, and link information within and between documnets in the corpus
- Produce a structured representation of relevant information
- Organize information so that it is useful to people
- Store information in a semantically precise format that is usable by algorithms

IE pipeline:

- Recognition of named Entities
- Extraction of relations between entities 
- Knowledge base population

# Named Entity Recognition

The goal:

- Identify named entites in a document and tag them with a type.

Applications:

- Named entities in a text can be indexed, linked to external databases,etc
- Sentiment can be attributed to companies or products
- Identify relations between named entities 
- In question answering: answers are often named entites
- Google knowledge graphs answers
- etc...


## NER: Sequence Labeling via Machine Learning

Training:

1. Collect set of representative training documents
2. Manually label each token for its entity class(PER, LOC, ORG, etc.) or other (O)
3. Design appropriate feature extractors for the text and classes
4. Train a sequence classifier to predict the labels from the data

Testing / Classification:

- For a set of new, unlabeled input documents:
    - Run the sequence model in inference mode to label each token
    - Output the recognized entities

In practice:

- Inside-Outside (IO) encoding is less prercise
- Inside-Outside-Beginning (IOB) encoding is more precise but requires a larger tagset (2c + 1 classes vs. c + 1 classes in IO encoding)
- But: the benefit is limited in practice, so IO is often used

## Token Features for NER Sequence Labeling

Token-level features

- Current token
    - Effectively, this is dictionary learning
    - Example: Barbara is typically (part of) a name
- Previous/next word (context)

Tag-level features

- Inferred linguistic classification (e.g. POS tags)

Label-level features:

- Previous (and perhaps next) named entity label in the currenct sequence
- Exmple: Jon [PER] Snow[PER]

Many types of named entities have characteristic name structures in which sunstrings increase the likelihood for a certain type of entity:

- Substring oxa in drug names
    - Ofloxacin, Cotrimoxazole, Oxazepam

- Substring field in location names:
    - Cloverfield, Bloomfield, Wakefield

- Special characters like a colon(:) in movie titles
    - Terminator 2: Judgment Day

Some named entity names tend to follow patterns that can be mapped to a simplified representation based on attributes such as:

- Token length
- Capitalization
- Numerals
- Greek letter
- Internal punctuation
- etc.

## Models for Named Entity Extraction

We can use many different kinds of sequence models for NER:

- Markov Models

    - Conditional Markov Models make a single decision at a time, conditioned on evidence from observations and previous decisions

- Conditional Random Fields

    - A whole-sequence conditional model, rather than a chain of local models

- Deep learning models

    - Bidirectional Long Short Term Memory models
    - Transformers


# Named 
