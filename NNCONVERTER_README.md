# Enhanced Neural Network Converter (nnconverter) Documentation

## Overview
The enhanced nnconverter is a neural network-style algorithm writer that learns types of commands and finds paths through mazes of commands. It has been significantly extended with new capabilities.

## Key Features

### 1. Expanded Type System
The nnconverter now includes 23+ type definitions for various operations:
- Basic operations: `append`, `member`, `reverse`, `length`
- Advanced list operations: `head`, `tail`, `concat`, `split`
- Functional programming: `map`, `filter`, `fold`
- Mathematical: `sum`, `product`, `max`, `min`
- Data manipulation: `sort`, `unique`, `zip`, `unzip`, `flatten`, `transpose`

### 2. Neural Network Style Learning
- **Weight-based command selection**: Commands have weights that are updated based on success/failure
- **Training function**: `train_network/1` learns from examples
- **Adaptive learning**: Weights are adjusted using reinforcement learning principles

### 3. Advanced Pattern Discovery
- **Fuzzy matching**: Finds similar type patterns even when exact matches don't exist
- **Pattern analysis**: Automatically discovers transformation patterns from examples
- **Similarity scoring**: Calculates similarity between different data structures

### 4. Multi-step Command Chaining
- **Chain induction**: `induct_chain/5` finds sequences of commands to achieve complex transformations
- **Enhanced induction**: `induct_enhanced/4` with better pattern matching
- **Depth-limited search**: Prevents infinite recursion in command chains

### 5. Ensemble Learning
- **Multiple approaches**: Combines different induction methods
- **Voting mechanism**: Selects best commands based on consensus
- **Robustness**: More reliable results through ensemble methods

## Usage Examples

### Basic Type Checking
```prolog
?- type(append, [a,b], Output).
Output = a:b.
```

### Pattern Discovery
```prolog
?- discover_patterns([[[a,b],[b,a]], [[1,2],[2,1]]], Patterns).
Patterns = [pattern(reverse,[])].
```

### Neural Network Training
```prolog
?- train_network([[[a,b],[b,a]], [[c,d],[d,c]]]).
true.
```

### Fuzzy Type Matching
```prolog
?- fuzzy_match_types([x,y], [y,x], SimilarTypes).
SimilarTypes = [1.0-type(reverse,[a:b],b:a)|_].
```

### Chain Induction
```prolog
?- induct_chain([a,b], Output, [], Commands, 2).
Output = ...,
Commands = [...].
```

## Key Improvements Over Original

1. **Expanded from 1 to 23+ type definitions**
2. **Added neural network style weight learning**
3. **Implemented pattern discovery and fuzzy matching**
4. **Added multi-step command chaining**
5. **Introduced ensemble learning methods**
6. **Improved robustness and error handling**
7. **Added comprehensive test suite**

## File Structure

- `nns_alg_writer.pl` - Main enhanced nnconverter
- `minimal_listprolog.pl` - Minimal List Prolog interpreter stub
- `test_nnconverter.pl` - Comprehensive test suite

## Testing

Run the test suite with:
```prolog
?- consult('test_nnconverter.pl'), run_all_tests.
```

Or use the interactive menu:
```prolog
?- test_menu.
```

## Future Extensions

The nnconverter framework is now well-positioned for:
- Deep learning integration
- More sophisticated pattern recognition
- Automatic algorithm synthesis
- Knowledge graph integration
- Natural language interface for algorithm description

## Technical Notes

- Uses Prolog's unification for pattern matching
- Implements backtracking for search space exploration
- Maintains state through dynamic predicates
- Supports both exact and fuzzy matching
- Provides extensible type system architecture