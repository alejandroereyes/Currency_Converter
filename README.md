# Currency Converter
The currency converter folder contains files that allow the user to create a new currency object and convert between diffrerent currencies.

What do these files do?
-----------------------
Currently the converter holds a default static set of conversion rates that were assembled on 5/21/15 - rates do not reflect actual current rates. In order to convert to a new currency, a currency object will need to be given as an argument along with the code for the new curreny to the convert method. If to-be-converter to code is not part of the converter's list of rates, it will throw an error.

The currency class is able to be initialize with two arguments, the currency code and the amount. It can also take a single argument in the form of a monetary symbol and amount-"$1.34". The approrpiate code and amount will be assigned to the currency object.  The user is able to add, substract, and multiply currencies objects with the same code (same type of currency) using the usual math operators - + * . If currency codes are not equal, it will throw an error. User will need to convert a currency to equal another before doing performing any math on the two.

There is also a Currency Trader class. It is able to take in multiple converter objects in order to simulate rates from different time periods.

Where is everything?
-------------------------
Inside there are two folders; a lib folder holds the files for the currency class, the converter class, and the trader class. The spec folder holds the testing files, one for each class.


Where can I run these?
-----------------------
All files can be run from the command line.
