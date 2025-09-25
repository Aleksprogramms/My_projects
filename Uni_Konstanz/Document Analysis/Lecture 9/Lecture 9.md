# Relation Extraction & Sentiment Analysis

# Relation Extraction

## Rule-based Relation Extraction

Intuition for a simple, rule-based relation extraction framework:

If the mention of a hyponym and a hyperonym in a sentence are connected in a clearly distnguishable pattern, we can construct a rule to extract the relation.

Example:

- Agar is a substance prepared from a mixture of red algae, such as Gelidium, for laboratory or industrtial use.
- A human can easily answer the question: What is Gelidium?
- We can create a rule:
    ... X, such as Y ... -> Y is a type of X


## Hand-Written Rules for Hyponym Extraction

We can expand the set of patterns to cover similar lingistic constructs and create a set of extraction rules:

![alt text](image.png)

## Hand-written Rules in a Nutshell

Advantages:
- Manually curated rules tend to have a high precision
- Can be tailored to specific domains

Disadvanteges:
- Manually curated rules often have low recall
- A lot of manual work is required to maintain rulesets

In other words:

- The usual caveats apply
- How can we uimprove this approach?

## Sidebar: Bootstrapping

Bootstrapping:

A self-starting process that continues and/or grows without further external input.

- The name is derived from the idea of "pulling oneself up by one's own bootstraps", describing an impossible task.
- Similar idea To the story of Baron Munchausen, who pulled himself(and his horse) out of a swamp by his hair.

Similar concept in statistics:

Bootstrap sampling to simulate having multiple different data sets (although you only have one) by repeatedly sub-sampling a single data set, for example to derive confidence intervals.

## Leveaging Named Entities for Pattern Discovery

In a knowledge base, relations are typically Encoded as triples:

- [Alan Turing] (PER) was employed by the [University of Manchester] (ORG)
- We can use such templates to identify patterns in which relations may occur in a corpus: [PER] was employed by [ORG]
-> Entity types can help us create pattern templates.

## Distantly Supervised Relation Extraction

Intuition:

Starting with a few seed entities, find cooccurrences of these entites to identify patterns. Use the patterns as templates for discovering new entities. Repeat.

Example:

- Seed entities: [Alan Turing] (PER) and [Univeristy of Manchester] (ORG)
- Matching cooccurence in a corpus: [Alan Turing] (PER) was employed by the [ UOM ] (ORG)
- Extracted pattern: [ PER ] was employed by [ ORG ]
- Finding other occurences of the Pattern in the corpus: [ Richard Feymann ] (PER) was employed by [ Cornell University ] (ORG)
- New entities: Richard Feyman and Cornell Univeristy

## Distantly Supervised Relation Extraction in a Nutshell

Advantages:

- We only need minimal manual input ( a few seed entites or patterns ) -> semi-supervised approach (also called distant supervision)
- System learns to extract new relations on its own
- Improved recall 

Disadvantages: 

- A trade-off between precision and recall becomes necessary: when do we stop mining for more rules?
- Recall is still not perfect - not all relations (always) occur in obvious patterns

##  Supervised Relation Extraction

Supervised methods can be used for relation extraction by following the usual approach.

Setup and design:

- Define a set of relations for extraction
- Selecting a set of relevant named entities 

Data:

- Compiling a representative training corpus
- Labeling named entities in the corpus
- Annotating relations between these entities (manually or pattern-based)

Training classifier

- Naive Bayes
- SVM
- ...


## Feature Examples For Supervised Relation Extraction

Example Sentence: 
American Airlines, a unit of AMR, immediately matched the move, spokesman Tim Wagner said.

Enitity-based features:

- Entity 1, type - ORG
- Entity 1, head - airlines
- Entity 2, type - PER
- Entity 2, head - Wagner
- Concatenated type - ORGPER

Word-based features:

- Between-entity bag-of-words {a, unit, of, AMR, immediately, matched, the, move, spokesman}
- Word(s) before Entity 1 - None
- Word(s) after Entity 2  - said

## Feature Exmaples for Supervised Relation Extraction

Example Sentence:

American Airlines, a unit of AMR, immediately matched the move, spokesman Tim Wagner said.

Syntactic features:

- Constituent path

NP ↑ NP ↑ S ↑ S ↓ NB

- Base syntactic chunk path 

NP → NP → PP → ADVP → VP → NP → NP 

- Typed dependency path 

Airlines <- [ subj ] matched <- [ comp ] said [ subj ] -> Wagner