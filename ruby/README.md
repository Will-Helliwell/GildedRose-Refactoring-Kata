# Gilded Rose Kata - Ruby

## Approach

1 - ensure test infrastructure working. Add SimpleCov to test code coverage and Rubocop to enforce code-style best practices.
2 - Write tests covering all existing functionality (should mostly match up with the spec) including edge cases.
3 - Refactor the existing code as best as possible
4 - Add the new feature

Reasoning:
- Adding automated tests is a necessary precursor for steps 3 and 4 because they will provide regression tests to reassure me that I am preserving all existing functionality (which I assume the client wants to keep, given that they have been using it without issue for a number of years). It will also communicate the intent of the code more clearly for any future developers in my position.
- Refactoring the code is a necessary precursor to step 4 because it will make it clearer exactly where the new functionality needs to sit within the code. A quick scan of the code in GildedRose.rb reveals plenty of opportunity for improvement e.g. removing nested conditionals, removing repetitions of variables (following DRY principles). Again, refactoring also future-proofs the code in terms of readability and maintainability.
