# Gilded Rose Kata - Ruby
----

## To Run from the Terminal:

### Installation:
- Clone this repository and navigate to root/ruby
- `bundle install`

### To run:
- Can be run from any REPL
  - e.g. in IRB: `irb -r "./lib/gilded_rose.rb"`

#### Methods available:
- `your_item_name = <item_subclass_name>.new(name, sell_in, quality)`
  --> creates a new item of the given subclass    
  Item subclass names available:
  ```
  StandardItem.new
  Sulfuras.new
  AgedBrie.new
  BackstagePass.new
  Conjured.new
  ```

- `your_inn_name = GildedRose.new([your_item_name, your_second_item_name...])`
  --> creates a new inn with an inventory consisting of the argument provided (inteded to be an array of Item subclass instances)

- `your_inn_name.update_products`
  --> updates the sell_in and quality for each item subclass instance in the inn's inventory as if one day has passed

### To run tests
- `rspec` (must be in root/ruby)
- 99.41% test coverage
- 26 unit tests and 1 feature test. All passing.

---

## Approach

Steps:    
1 - ensure test infrastructure working. Add SimpleCov to test code coverage and Rubocop to enforce code-style best practices.   
2 - Before changing any code, write tests covering all existing functionality (should mostly match up with the spec) including edge cases.    
3 - Refactor the existing code as best as possible     
4 - Add the new feature ('conjured' items)      

Reasoning:
- Adding automated tests is a necessary precursor for steps 3 and 4 because they will provide regression tests to reassure me that I am preserving all existing functionality (which I assume the client wants to keep, given that they have been using it without issue for a number of years). It will also communicate the intent of the code more clearly for any future developers in my position.
- Refactoring the code is a necessary precursor to step 4 because it will make it clearer exactly where the new functionality needs to sit within the code. A quick scan of the code in GildedRose.rb reveals plenty of opportunity for improvement e.g. removing nested conditionals, removing repetitions of variables (following DRY principles). Again, refactoring also future-proofs the code in terms of readability and maintainability.

### Isolating Tests

Item class is very simple, basically just a data container with no logic. I will therefore will not isolate its tests.

---

## Interpretation of Spec

Item class:
- @sell_in - integer, days left to sell the item
- @quality - integer, how valuable the item is   
(*both of the above are amended at the end of each day by calling the update_quality method on an instance of GildedRose*)
- @name

#### Items available and Existing Behaviour:

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

**Any other item name (I will refer to as 'standard' items)**
- sell_in - reduces by 1 at all times
- Affect of update_quality on Item.quality:
  - it never drops below zero
  - it decreases by 1 when it there are 1 or more days left to sell (and quality > 0)
  - it decreases by 2 when sell_in has reached zero or below (and quality > 0)

---

## Work Completed 

### 1 - Tests Added

- Passing unit tests added to preserve all existing functionality I observed and took from the brief.
- Single feature test also passing

### 2 - Refactoring 

I decided that any changes to the Item class were necessary, and am happy to take this up with the coding gremlin.

#### Minor Refactoring 
- the code has the same functionality as the original but is now significantly shorter, more readable and more changeable (e.g. through the use of a case statements instead of if/else, extraction of constants, private methods etc.)

#### Using Inheritance
Logic:
- There are a set number of item types which tend to share some common behviour/data (e.g. having a quality attribute, reducing their sell_in by one each day) but also tend to respond differently to a specific method (update_quality). This naturally suggests a structure where all items inherit basic data/behaviour from a parent class, and then overwrite/add other behaviours as necessary. 
- Structuring the code like this separated the different pieces of logic for each item type's response to update_quality into a different file, and removed the need for the long case statement (which was the best I could get to without using inheritance).

Summary of Item class structure:
- All item types inherit attributes for name, quality and sell_in from the Item superclass.
- All item types inherit a response to update_sell_in by reducing the sell_in by 1 (except for 'sulfuras' which overrides this)
- All item types define their own particular response to update_quality

#### Additional Changes to Item Class
  - Extracted constants for Item::MIN_QUALITY and Item::MAX_QUALITY
  - Item class moved to a separate file

#### Naming
Renamed the 'update_quality' method to 'update_products' as I feel it is more descriptive of its behaviour. The update_products methods is now composed of two private methods, 'update_quality' and 'update_sell_in'. Again this makes the code more readable and more changeable.

### 3 - New Feature Added

Spec - "Conjured items degrade in quality twice as fast as normal items"

Assumptions:
- 'Standard items' = any items other than Sulfuras, Aged Brie and the Backstage Pass.
- Conjured items will therefore have the same behaviour as standard items, except for their speedier degredation:
  - sell_in - reduces by 1 at all times
  - Affect of update_quality on Item.quality:
    - it never drops below zero
    - it decreases by 2 when it there are 1 or more days left to sell (and quality > 0)
    - it decreases by 4 when sell_in has reached zero or below (and quality > 0)

---

## Functionality to Add in Future

**Item class**
- Does not allow items to be initialized with quality > 50 (as per specification)
- Does not allow items to be initialized with quality < 0 (as per specification)
- Valid items defined in a set list - does not allow non-existent items (e.g. "unicorn hair") to be added.
