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

####Items available and Existing Behaviour:

Below I describe the existing behaviour of the item types at the point at which the code was handed over. This occasionally differs from the specification, in which case I have made a note.

I prioritize preserving existing behaviour over the spec, given that the code has been used satisfactorily up until now.

**"Sulfuras, Hand of Ragnaros"**
- sell_in - never has to be sold -> nil would make sense but code throws error unless argument is an integer. For now: give as any arbitrary integer which must never change.
- quality - never changes

**"Aged Brie"**
- Appears to be a typo in the instructions - existing code does not assume that "Aged Brie" is a backstage pass. Instead it behaves as below:
- sell_in - reduces by 1 at all times
- quality:
  - increases by 1 when quality < 50
  - does not increase above 50

**"Backstage passes to a TAFKAL80ETC concert"**

**Any other item name (string)**
- ?

### New Feature Required

### Other Functionality to Add

**Item class**
- Does not allow items to be initialized with quality > 50 (as per specification)
- Does not allow items to be initialized with quality < 0 (as per specification)
- Valid items defined in a set list - does not allow non-existent items (e.g. "unicorn hair") to be added.
