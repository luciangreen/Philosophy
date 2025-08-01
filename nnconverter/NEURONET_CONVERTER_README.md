# Prolog Algorithm → Manual Neuronet Converter

## Overview

This system transforms Prolog algorithms into neuronet-like inductive representations by detecting recursive structures, applying inductive transformations, and generating grammars. It's designed for teaching recursion and induction in AI pedagogy, algorithm analysis and simplification, and code-to-logic-based neuronet design.

## Features

The converter implements six core modules:

1. **Complexity Finder** (`complexity_finder/2`) - Analyzes computational complexity (O(1), O(n), O(n²), etc.)
2. **Type Finder** (`type_finder/2`) - Infers data types (list, atom, string, number, compound term)
3. **Inductive Transformation Engine** (`inductive_transform/2`) - Converts recursive predicates to base + inductive step form
4. **Pattern Unfolding Module** (`pattern_unfold/2`) - Expands predicate calls to inline definitions
5. **Grammar Generator** (`grammar_generate/2`) - Creates CFG-like grammars for lists, atoms, and strings
6. **Inductive Step Insertion** (`inductive_insert/3`) - Optimizes by replacing code with inductive patterns

## Installation

Requires SWI-Prolog 8.4+ (tested with SWI-Prolog 9.0.4).

```bash
# Install SWI-Prolog (Ubuntu/Debian)
sudo apt install swi-prolog

# Or on macOS with Homebrew
brew install swi-prolog
```

## Usage

### Basic Usage

```prolog
% Load the module
?- use_module(neuronet_converter).

% Define an algorithm as list of clauses
Algorithm = [
    (sum_list([], 0) :- true),
    (sum_list([H|T], S) :- sum_list(T, S1), S is H + S1)
].

% Convert to neuronet representation
?- convert_algorithm(Algorithm, Neuronet).
```

### Running Examples

```bash
# Run comprehensive demonstration
swipl -q -t "demo, halt" neuronet_demo.pl

# Run specific examples
swipl -q -t "test_sum_list, halt" neuronet_example.pl

# Run simple test
swipl -q -t "test_neuronet, halt" test_neuronet.pl
```

### Example Output

```
=== Prolog Algorithm → Manual Neuronet Converter ===

Original Algorithm:
  sum_list([], 0).
  sum_list([H|T], S) :- sum_list(T, S1), S is H + S1.

• Complexity Analysis:
    sum_list: o_1 (base case)
    sum_list: o_n (recursive case)

• Type Inference:
    sum_list: [list(var), number]

• Inductive Form:
    Base Case: sum_list([], 0)
    Inductive Step: sum_list([H|T], S) :- (sum_list(T, S1), S is H + S1)

• Generated Grammar:
    [list -> []]
    [list -> [element | list]]
    [sum_list_empty -> []]
```

## Files

- `neuronet_converter.pl` - Main converter module with all 6 components
- `neuronet_example.pl` - Worked examples with sum_list/2 and reverse/2
- `neuronet_demo.pl` - Comprehensive demonstration with multiple algorithms
- `test_neuronet.pl` - Simple test file for basic functionality

## API Reference

### Main Conversion

```prolog
convert_algorithm(+Algorithm, -Neuronet)
```
Converts a list of Prolog clauses into a structured neuronet representation.

**Parameters:**
- `Algorithm`: List of Prolog clauses `[(Head :- Body), ...]`
- `Neuronet`: Dictionary containing all transformation stages

### Individual Components

```prolog
complexity_finder(+Algorithm, -ComplexityInfo)
type_finder(+Algorithm, -TypeInfo)
inductive_transform(+Algorithm, -InductiveForm)
pattern_unfold(+InductiveForm, -UnfoldedForm)
grammar_generate(+UnfoldedForm, -Grammar)
inductive_insert(+UnfoldedForm, +Grammar, -OptimisedForm)
```

## Example Algorithms

The system has been tested with:

1. **Sum List** - O(n) list summation
2. **Factorial** - O(n) recursive factorial calculation  
3. **List Append** - O(n) list concatenation
4. **List Reverse** - O(n²) naive list reversal

## Workflow

1. **Input**: Prolog algorithm as list of clauses
2. **Complexity Analysis**: Detect recursion patterns and classify complexity
3. **Type Inference**: Infer argument types for each predicate
4. **Inductive Transformation**: Convert to base case + inductive step form
5. **Pattern Unfolding**: Expand all predicate calls inline
6. **Grammar Generation**: Create CFG-like grammar rules
7. **Optimization**: Replace code segments with inductive patterns
8. **Output**: Structured neuronet representation

## Applications

- **AI Education**: Teaching recursion and induction concepts
- **Algorithm Analysis**: Understanding algorithmic complexity and structure
- **Code Transformation**: Converting imperative patterns to inductive ones
- **Neuronet Design**: Creating logic-based neural network architectures

## Compatibility

- **Language**: Prolog (SWI-Prolog 8.4+)
- **Platform**: Cross-platform (Linux, macOS, Windows)
- **Dependencies**: None (pure Prolog implementation)

## License

This project is part of the Philosophy repository by luciangreen.