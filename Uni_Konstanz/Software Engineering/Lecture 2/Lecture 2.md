# Lecture 2

## Importance of Requirements Engineering

### System Design

- problem and system requirements
- feasibility study
- define main subsystems
    - allocate to hw/sw
- system design document
    - informal, with costumer
    - sometimes: user manuals, user interfaces and test plans defined

### SW Requirements Analysis and Specification

- "what" the system has to do, not how
- elicit software requirements describing expected observable external behavior
- edit software requirements document
    - Software Requirements Specification (SRS)
    - Lastenheft/Pflichtenheft

### Requirement

- "what"
- feature of the system or description of some system capability necessary to fulfill the purpose of the system, i.e. to provide its intended service
- standardized definition of a requirement:
    1. A condition or capability needed by a user to solve a problem or achieve an objective.
    2. A condition or capability that must be met or possessed by a system or system component to satisfy a contract, standart, specification, or other formally imposed documents
    3. A document representation of a condition or capability as in (1) or (2).

#### Example

- requirements for a smart home information system
    - R1: The system shall offer a user-friendly interface.
    - R2: The house information system shall generate a monthly report containing all granted and defined admittances to the house.
    - R3: If the PIN the user enters at the keypad is correct, the system shall open the door and record the granted access
    - R4: The system shall be available on the market by May 2006.
    - R5: The unlocking of the door shall happen within 0.8s after the PIN has been entered correctly.

### Classification to K.Pohl"
    - functional requirements
    - quality requirements
    - constrains
    - (non-functional requirements)

#### Functional requirements

- define services the system should provide
- behaviour of the system
- in some cases also what the system should not do
- examples:
    - R1: The airbag shall deploy in case of an accident
    - R2: The airbag shall not deploy unless a crash has been detected
    - R3: The house information system shall generate a monthly report containing all granted and defined admittances to the house.
    - R4: If the PIN the user enters at the keypad is correct, the system shall open the door and record the granted access; i.e. It should record the date and time, and the name of the PIN owner

#### Quality requirements

- define quality properties of the system, a component, a service or a function (e.g., perfomance)
- examples
    - R5: The system shall recover from an invalid API input.
    - R6: The system shall offer a user-friendly interface.
    - R7: The unlocking of the door shall happen within 0.8s after the PIN has been enterred correctly.

![alt text](image.png)

#### Constrains 

- an organisational or technological requirement that restricts the way in which the system shall be developed, e.g.:
    - the software for the Airbag Electronic Unit (ECU) shall be developed in accordance with the safery processes required by the ISO 26262 standard
    - the software for the Airbag ECU shall be completed and have successfully passed the acceptance testing three months prior to start of production
    - the software requirements specification (Pflichtheft/Lastenheft) document shall be editied in accordance with the German DIN 69906 standerd

#### Non-functional requirements

- type of requirements frequently used in the literature and in industrial practice
    - quality characteristics that the software solution must possess
- according to K. Pohl: term used in the literature, but non-functional requiremetns do not really exist
    - mainly underspecified functional requirements
    - few of them are quality requirements

### Alternative Classification (after Sommerville)

- Functional Requirements
    - statement which services the system shoul provide
    - interaction between system and enviroment
        - system states, input/output
    - how the system should behave in particular situations

- Non-functional Requirements
    - not primarily related to the system's functions/services themselves, but to the quality and additional characterics of the service
    - constrains on the servies / functions offered by the system
        - reliability (availibility, integrity, security, safety, etc.)
        - accuracy of results
        - perfomance / timing
        - human-computer interface issues
        - operating and physical contraints
        - portability and interoperability
        - standarts...

![alt text](image-1.png)

- Further Classification
    - user / system requirments
    - domain requirements
        - describe system characterics and features that reflect the domain
        - constrains on existing requirements 
        - define specific computations


### Conclusion

- RE is commonly accepted to the most important, critical and complex process in the software development process
- the RE process is pivotal, and his the highest impact on the capabilities of the emerging software product of any software lifecycle stage
- RE is important because it helps to define the purpose of any project by defining the constraints, specifying the process involved, and documenting both
- it is crucial to determine the mix of effective techiques to use for requirement elicitation and porpely document the process and the requirements to reduce the challenges and chances of failure
- RE should therefore be the starting point and backbone of any project or decision because
    - it helps to determine and focus on the objective
    - match the needs of stakeholders to the product development process, and
    - thereby increase the chances of achieving the best result

## Requirements Specification Properties

### Correctness

- all facts stated in the requirements specification represent required properties of the system to be designed
- counterexample (telephony system)
    - specification requires that callee receives a dial tone when the caller hangs up. while the system is supposed to provide a busy tone in this situation
- notice that this is different from the definition of (partial / total) program correctness!

### Unambiguity

- all facts stated in the specification have a single interpretation
- natural language desriptions are frquently ambiguous
- for up to 12 aircrafts on the control screen, the small display format is to be used, otherwise the large format is required
    - to satisfy the abstract system requirement to avoidance of clutter it is irrelevant whether this is interpreted as < 12 or =< 12
    - this may, however, lead to problems if both display formats are designed by different design teams, none of the two teams feels responsible for the case = 12 (empty display in that case?)

### Completness

- definition 1: every required property of the system is expressed in the specification
    - does this imply that the specification needs to include the description of behavior that is not permitted?
        - may be difficult to achieve due to large number of possible system behaviors
        - formal specification may help in this situation, e.g., 
        ![alt text](image-2.png) \
        however, there may be good reasons for allowing oher phones to ring... \
    
- definition 2: the responses of the software system on all types of possible input values are specified.
- further interpretations can be found in the literature

### Verifiability

- there exists an effective, either manual or automated procedure for checking whether a software product satisfies the required properties
- examples: 
    - use of mathematical proof
        - formalization
            - implementation => specification
    
    - experiments with a model to check validity of a property
        - testing 
        - model checking
        - simulation

- many requirements are verifiable
    - after every command the operating system is supposed to return control to the user
    - the software is never supposed to enter an infinite loop
    - the user interface is required to be easy to operate
