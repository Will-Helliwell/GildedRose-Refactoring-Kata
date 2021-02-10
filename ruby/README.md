# Gilded Rose Kata - Ruby

## Approach

1 - ensure test infrastructure working. Add SimpleCov to test code coverage and Rubocop to enforce code-style best practices.
2 - Before changing any code, write tests covering all existing functionality (should mostly match up with the spec) including edge cases.
3 - Refactor the existing code as best as possible
4 - Add the new feature

Reasoning:
- Adding automated tests is a necessary precursor for steps 3 and 4 because they will provide regression tests to reassure me that I am preserving all existing functionality (which I assume the client wants to keep, given that they have been using it without issue for a number of years). It will also communicate the intent of the code more clearly for any future developers in my position.
- Refactoring the code is a necessary precursor to step 4 because it will make it clearer exactly where the new functionality needs to sit within the code. A quick scan of the code in GildedRose.rb reveals plenty of opportunity for improvement e.g. removing nested conditionals, removing repetitions of variables (following DRY principles). Again, refactoring also future-proofs the code in terms of readability and maintainability.

### Isolating
- It is very difficult to isolate GildedRose class tests from the Item class since GildedRose's only purpose is to update information stored in the item class. Decision - with no clear way to isolate and because Item class is so simple (pretty much just an initializer), I will not isolate the tests.


## Spec

### Existing Functionality

Item class:
- @sell_in - integer, days left to sell the item
- @quality - integer, how valuable the item is
*both of the above are amended at the end of each day by calling the update_quality method on an instance of GildedRose*
- @name

####Items available:

**"Sulfuras, Hand of Ragnaros"**
- sell_in - never has to be sold -> nil would make sense but code throws error unless argument is an integer. For now: give as any arbitrary integer which must never change.
- quality - never changes

**"Aged Brie"**
-
**"Backstage passes to a TAFKAL80ETC concert"**

**Any other item name (string)**
- ?

### New Feature Required
