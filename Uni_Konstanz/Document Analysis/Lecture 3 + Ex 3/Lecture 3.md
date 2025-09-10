# Parsing

## What is Parsing?

Parsing is the process of determining the syntactical structure of a sentence with respect to a given grammar(from which the sentence was generated).

### Syntax

- A simple sentence includes just a subject and a predicate.
- The subject is a noun phrase and the predicate is a verb phrase:
    - Noun phrase: The cat, Samantha, She
    - Verb phrase: arrived, went away, had dinner

## Formal Grammars

A  formal grammar G = (N, T, P, S) provides a scheme for generating a formal language. if consists of:

- A finite set of non-terminal symbols N (constituents)
- A finite set of terminal symbols T (words)
- A start symbol S (a sentence)
- A finite set of production rules P of the form: left hand side -> right hand side

The grammar's language L(G) is the set of all sequences of terminal symbols that can be generated with the grammar. To generate a sentence from the language:

- Beginning with the start symbol, consecutively apply rules("derivation")
- Applying a rule replaces all symbols on the left hand side with the right hand side.
- Once only terminal symbols remain, the derivation is complete.
 

