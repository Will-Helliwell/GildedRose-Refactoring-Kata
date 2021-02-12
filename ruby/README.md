# Gilded Rose Kata - Ruby

## Approach

1 - ensure test infrastructure working. Add SimpleCov to test code coverage and Rubocop to enforce code-style best practices.
2 - Before changing any code, write tests covering all existing functionality (should mostly match up with the spec) including edge cases.
3 - Refactor the existing code as best as possible
4 - Add the new feature

Reasoning:
- Adding automated tests is a necessary precursor for steps 3 and 4 because they will provide regression tests to reassure me that I am preserving all existing functionality (which I assume the client wants to keep, given that they have been using it without issue for a number of years). It will also communicate the intent of the code more clearly for any future developers in my position.
- Refactoring the code is a necessary precursor to step 4 because it will make it clearer exactly where the new functionality needs to sit within the code. A quick scan of the code in GildedRose.rb reveals plenty of opportunity for improvement e.g. removing nested conditionals, removing repetitions of variables (following DRY principles). Again, refactoring also future-proofs the code in terms of readability and maintainability.

### Isolating Tests
- It is very difficult to isolate GildedRose class tests from the Item class since GildedRose's only purpose is to update information stored in the item class. Decision - with no clear way to isolate and because Item class is so simple (pretty much just an initializer), I will not isolate the tests.


## Spec

### Existing Functionality

Item class:
- @sell_in - integer, days left to sell the item
- @quality - integer, how valuable the item is
*both of the above are amended at the end of each day by calling the update_quality method on an instance of GildedRose*
- @name

####Items available and Existing Behaviour:

Below I describe the existing behaviour of the item types, before I have made any changes. This occasionally differs from the specification (e.g. for aged brie), in which case I have made a note below. I have split the behaviour between the 4 item types, as I think it is easier to follow and reflects the logic of the code better than the explanation in the specification.

Where the code functionality differs from the spec, I have prioritized preserving existing behaviour over following the spec, given that the code has been used satisfactorily on a daily basis up until now.

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
- sell_in - reduces by 1 at all times
- Affect of update_quality on Item.quality:
  - increases by 1 when there are more than 10 days left to sell
  - increases by 2 when there are 6-10 days left to sell inclusive
  - increases by 3 when there are 1-5 days left to sell inclusive
  - reduces to zero if there are zero or fewer days left to sell
  - cannot be greater than 50

**Any other item name (I will refer to as 'misc' items)**
- sell_in - reduces by 1 at all times
- Affect of update_quality on Item.quality:
  - it never drops below zero
  - it decreases by 1 when it there are 1 or more days left to sell (and quality > 0)
  - it decreases by 2 when sell_in has reached zero or below (and quality > 0)

### New Feature Added

Spec - "Conjured items degrade in quality twice as fast as normal items"

Assumptions:
- 'Normal items' = any items other than Sulfuras, Aged Brie and the Backstage Pass.
- Conjured items will therefore have the same behaviour as misc items, except for their speedier degredation:
  - sell_in - reduces by 1 at all times
  - Affect of update_quality on Item.quality:
    - it never drops below zero
    - it decreases by 2 when it there are 1 or more days left to sell (and quality > 0)
    - it decreases by 4 when sell_in has reached zero or below (and quality > 0)

### Changes Made

**Refactoring** - the code has the same functionality as the original but is now significantly shorter, more readable and more changeable (primarily through the use of a case statement, but also extraction of constants, private methods etc.)

**Naming** - I have renamed the 'update_quality' method to 'update_products' as I feel it is more descriptive of its behaviour. The update_products methods is now composed of two private methods, 'update_quality' and 'update_sell_in'. Again this makes the code more readable and more changeable.

### Other Functionality to Add

**Item class**
- Does not allow items to be initialized with quality > 50 (as per specification)
- Does not allow items to be initialized with quality < 0 (as per specification)
- Valid items defined in a set list - does not allow non-existent items (e.g. "unicorn hair") to be added.
