
What do these files do?
-----------------------
The currency converter folder contains files that allow the user to create a new currency object and convert between diffrerent currencies.

Currently the converter holds a static set of conversion rates that were assembled on 5/21/15 - rates do not reflect actual current rates. In order to convert to a new currency, a currency object will need to be given as an argument along with the code for the new curreny to the convert method. If to-be-converter to code is not part of the converter's list of rates, it will throw an error.

The user is able to add, substract, and multiply currencies objects with the same code (same type of currency) using the usual math operators - + * . If currency codes are not equal, it will throw an error. User will need to convert a currency to equal another before doing performing any math on the two.


Where is everything?
-------------------------
Inside there are two folders; a lib folder holds the files for the currency class and for the converter class. The spec folder holds the testing files, one for the currency class and another for the converter class.


Where can I run these?
-----------------------
All files can be run from the command line.
