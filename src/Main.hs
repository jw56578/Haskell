-- Welcome to Leksah.  This is a quick sample package for you to
-- try things out with.  We hope it will be useful for those new
-- to Haskell or just new to Leksah.

-- If you are new to haskell then here are some great sites to visit
-- http://learnyouahaskell.com/
-- http://tryhaskell.org/
-- http://book.realworldhaskell.org/

-- To build this package use
--   * Just make a change while background build is activated
--   * Ctrl+B (OS X Command+B)
--   * Package -> Build

-- When you are ready to create your own workspace and package.
--   * Package -> New

-- Next we are importing some things from other modules.
-- Leksah can normally add these imports for you, just
-- press Ctrl+R (OS X Command+R)

import Data.Monoid ((<>))

-- This strange looking comment adds code only needed when running the
-- doctest tests embedded in the comments
-- $setup
-- >>> import Data.List (stripPrefix)

-- | Simple function to create a hello message.
--
-- The following tells doctest & QuickCheck that if you strip "Hello "
-- from the start of `hello s` you will be left with `s` (for any `s`).
-- QuickCheck will create the test data needed to run this test.
--
-- To automatically run the tests when the package is built, click on
-- the green tick on the tool leksah tool bar.
--
-- To see how this is configured take a look in leksah-welecome.cabal
-- (you can open it with Package -> Edit).
--
-- The code that runs the tests is in the file test/Main.hs.
--
-- prop> stripPrefix "Hello " (hello s) == Just s
hello :: String -> String
hello s = "Hello " <> s

-- | Executable Entry Point
--
-- Here is the entry point for the leksah-welcome executable
--
-- To run it
--   * Select Leksah menu item Package -> Run (or the cogs on the toolbar)
--   * Select "exeMain" and press Ctrl+Enter to run them in ghci
--   * Run "leksah-wellcome" from the command line
-- what the hell is this doing










-- The above was auto generated by Leksah, I don't really know what any of it means
-- The following are my own notes
-- I'm still kind of confused as to how the build system works
-- from leksah, you do File->Open-Package and find the cabal file, but this doesn' open any source code fileTypefileType
-- you just have to open files seperately if you want to edit the content
-- still don't know how to add additional files??

--main is the special keyword as the entry point for haskell program
--an IO action
-- just like c# public static void Main, you have to have this
main :: IO ()


-- you can create a function that is bound to the IO action of printing out to the console

printMyStuff :: IO()
printMyStuff = putStrLn "what is this"


--this is how you would create an infinite loop to constanly take input from the user
takeInput:: IO()
takeInput  = do
    putStrLn "enter input"
    input <- getLine
    --do something with inputNL
    putStrLn(input)

inputForever::IO()
inputForever = do
    takeInput
    inputForever

-- you don't necessarily have to assign putStrLn to main, but something has to be assigned to it
main = inputForever











-- define some variables
-- this isn't really a variable, you are just aliasing the value of hello 1 with string1
string1 = "hello 1"
string2 = "world 1"
--concat strings
greeting = string1 ++ " " ++ string2

-- calling functions
--dont need parenthesis or commas
--uh why is this not working
-- this will only work in the GHCI
--max 5 7

--if you are sending expressions into functions then you need parenthesis, but again no commas
--uh why is this not working - this will only work in the GHCI
--max (5+2) (sqrt 17)

-- define your own function
-- function name then arguments with no parenthesis or commas, there is no return keyword
square x = x * x

--use other functions in your function
multMax a b x = (max a b) * x

--if statements
-- don't need parenthesis, there must always be an else
posOrNeg x =
    if x >= 0
    then "Positive"
    else "Negative"


--do recursion
--there are no loops in haskel so you have to do recursion
--to the power of
pow2 n =
    if n == 0
    then 1
    else 2 * (pow2 (n-1))

-- mimic a for loop from other languages like C#
--notice the function aliasing, you are using the signature of another function to make a new function that only has 1 argument
-- the other arguments are hard coded to 1 and 0
loopedpow2 n = pow2loop n 1 0
pow2loop n x i =
    if i < n
    then pow2loop n (x*2) (i+1)
    else x


--- LISTS
x = [1,2,3]
empyt = []
-- take an existing list and create a new list with something added to the front
-- the colon is the cons keyword "construct"
--y now has a new list with 0 at the front
y = 0 : x

--con a list
--construct a list starting from an empty list and adding things into it
mylist = 1 : 2 : 3 : 4 : 5 : []


--create a new list from lists
combinedlist = [1,3,4,5] ++ [5,6,7,8]

thefirstthinginthelist = head combinedlist

everythinginthelistexceptthefirstthing = tail combinedlist


--this is a common way to work with lists since you cannot do loops
-- you do recursion sending in the tail of the list and then check for an empty list
--function that will take a list of numbers and return a list of all the numbers doubled
doublenumbers nums=
    if null nums -- this is how you check for null
    then [] -- returning and empty array
    -- this  is taking the first number and multiplying it by 2
    -- then it is combining it with the result of calling the function again sending in the tail
    else (2 * (head nums)) : (doublenumbers (tail nums))



--tuple, this is like object vs array
--lists can only have one type in them
--tuples can have any type in them
--just like in c# you only use these things in very simple cases
myfirsttuple = (1,"hello")


--Pattern matching
--this is pretty consusing because there is no equivelant in c#

--the parenthesis are consfusing, but they are not wrapping the arguments
--the parenthesis represent a tuple, because that is how you define tuples
--so this is a function that takes a tuple of any type a,b and just returns a, which is the first thing in it
myFirst (a,b) = a

--take a tuple and return the second thing in it b
mySecond (a,b) = b


--what if c# were able to handle actually knowing if a list was null or was empty and called a different method signature accordingly
--haskel can do that, you can define an argument as being of the type empty list
--take an empty list and return true
--note the keyword True is uppercase for boolean
--[] as an argument is like a key word for recognizing that a list is empty and call this specific function
checkNull [] = True
-- so just like in c# you can overload a function. just use the same name and define a different argument
--this is how you specify an argument of a list that does have something in it
--what it really means is that the argument represents a list with one thing in it x and then another thing after it xs, xs is another list that is either empty or has more stuff in it
checkNull (x : xs) = False

--This is how you handle functions that do things on list but would fail if the list was empty
--handle the scenario of an empty list with the [] argument, then throw an error the is descriptive
myHeadFunction [] = error "head of empty list"

--pattern matching is the technique that is prefered to be used when making functions
--this is another way to make the doublenumbers function
--if empty list is given then return empty list
betterdoublenumbers [] = []
--x automatically is the first thing in the list because of pattern matching
--xs is just whatever else is after it, it could be more of the list or the end of the list []
--you no longer have to check for null
betterdoublenumbers (x : xs) = (2*x) : (betterdoublenumbers xs) -- this will either call the function that takes more lists or the one that takes an empty one


--Guards
-- this is another way to define different method signature depending on what the value of the arguments are, NOT the type of the arguments
--take argument n, if n =0 return 1, else do this stuff
powerof2 n
    | n == 0 = 1
    | otherwise = 2 * (powerof2 (n-1))



--create a new list from a given list that only contains the even numbers
--handle the scenario of an empty list
removeOdd [] = []
removeOdd (x : xs)
    | mod x 2 == 0 = x :(removeOdd xs) -- if even then include the item in the list concatenation
    | otherwise    = removeOdd xs -- if odd ignore the item and continue on recursively with the tail of the list



--CASE
--this is when you want to do similiar to pattern matching but within the function
doublenumberswithcase nums = case nums of
    []      -> [] -- if empty list return empyt list
    (x :xs) -> (2 * x) : (doublenumberswithcase xs) -- if not empty list then multipley head by 2 and concat with the recursive result sending in the tail

--this is an example of something that could only be done with case, not pattern matching
--call removeOdd to get a list of all the even numbers
--if the result is an empty string then there were no even numbers, return false
-- if the result has anything in it then TRUE
-- I GUESS THAT (x : xs) is similiar to c# checking the length on an array to see if it has something in it
listcontainsanyevennumber nums = case (removeOdd nums) of
    []      -> False
    (x :xs) -> True



--LOCAL VARIABLE
-- you have to assign to variables right when you declare them, then these variables can never change
-- declare multiple variables by lining them up with white space
--im not sure i understand this yet but i guess you can only use the variables after the "in" keyword
--how would a more complicated use of this look?
-- i guess the concept is that funcitons are suppose to do such a concise thing that variables aren't really needed
fancyseven =
    let a = 3
        b = 5
        c = 4
        d = 6
    in
        2 * a + 1 + b + c
        -- this will not work a + b + c + d

numberOfEvens nums =
    let evenNums = removeOdd nums
    in length evenNums



--WHERE CLAUSE
-- good god why do we need so many ways to declare variables

anotherfancyseven = 2 * a + 1 + b -- use the variable before they are declared
    where a = 3 -- now after it was used declare it and put a value in it
          b = 4


--let vs where
--fancyTen = 2 * (a + 1 where a = 4) -- this is not allowed
fancyTen = 2 * (let a = 4 in a + 1) -- this is okay

--the only reason for let vs where is up to the programmer for whatever makes more sense, no example of when it would be better to use either in whatever scenario

--WHITESPACE
--never use tabs
--always indent at least as much as lines above others that are suppose to be together




--LAZY EVALUATION
--
--this is a function that takes a number and increments it by one and then adds it to a list for infinity
intsFrom n = n : (intsFrom (n+ 1))
--this may look like this is executing the function starting at 1 which would then cause an infinite loop and crash the process
-- but it is not like that
--this is only assigning the curried function with the hard coded paramters of 1 to another variable
infinityFromOne = intsFrom 1
--because nothing is actually calling this so it will not run
-- null infinityFromOne , this call would not crash because haskell just knows that there is more than one entry so it returns false right away
-- it doesn't need to actually make the infinite list to know its not null
-- this is the same for all function like this, head, take...etc
--- but this would crash on calls to length or tail or just printing it out



--PASSING A FUNCTION TO ANOTHER FUNCTION
-- f is a function but how does haskell know this is a function?
-- because it is being called by f 4, anytime you have a thing and then a space and then another thing, the only thing that can mean is that you are calling
-- a function and sending in some argument
--its important to get used to seeing this Whatever "space" whatever means you are calling a function the end

passafunction f = f 4 * 3

addOne1 x = x + 1
mult2 x = 2 * x
--another example of knowing that you are dealing with functions g x means call g sending in x then call f with the result of that
--typical compose function to build a list of functions to be called one after the other
compose f g x = f (g x)

multiply2thenaddone x = compose addOne1 mult2 x

--so you can make this function that does only one thing ever however useful that would be
why_would_you_ever_want_a_function_that_just_calls_these_functions_for_235 =  multiply2thenaddone 235

--Constant
alwaysreturnthesamething8 = const 8

--you can still pass an argument but it does nothing
--alwaysreturnthesamething8 6

--PARTIAL APPLICATION
--THIS IS BUILT INTO THE LANGUAGE
-- if you call any function with less arguments than it expects that will partial apply it will the given arguments
--the order of the arguments is from left to right, so if you send in 1 argument it will hard code for the left most argument


--OPERATORS
-- operators can be used like functions also +, -, *, /
-- wrap them in parenthesis to use them as functions
-- 1 + 1 is the same as (+) 1 1
--and you can paritally apply them
--this is a function that will add one to whatever is passed in
alwaysaddone = (+) 1
--alwaysaddone 5




--BUILT IN FUNCTIONS
--run the length function over this array
anewlistofresultsfromafunction = map length ["hello","how", "are"]

--foldl = fold left is like reduce
addallnumberstogether = foldl (+) 0 [1,2,3,4]

--foldr = fold right is where the looping starts at the end of the list


--ZIP
--take 2 lists and combine the items from the same index in each list


--composition
-- combine functions into one function just like every other compse implemenation
-- show = toString in haskel
--executed from right to left)
mycombinedfunction :: String -> Int -- why did i have to put this in order for it to work
mycombinedfunction = (length . show)


--EXPLICTLY DEFNING WHAT SOMETHING IS


-- make a variable that is of type string
myStrIsCool :: String
--you cannot just define something, you have to assign something to it, or bind iterate
myStrIsCool = "ooooo yeaaaa"

--explicitly define a function with ->
-- its kind of like the C# Func generic you define all the parameters on the left and the last thing
--  to the right of the arrow is the return type
doStuff :: Int -> Int -> Int -> Int
doStuff x y z = x + y + z

--TYPE ANNOTATION
--THIS IS WHERE  you define the type of something and bind it in the same lines
ifyoudidnotalreadyknowiamanint = 3 :: Int
-- there is no point to this as the compiler already knows that 3 is an int



--Functional polymorphism which is not the same as OOP polymorphism
-- this is how you can make functions that take arguments of any Type
-- this is similiar to c# generics

--this says take a list of anything and return an int
-- the a part can be anything starting with lower case letter
--known types start with an upper case letter
domystufftolistgenerics :: [a] -> Int
-- if the thing send in is an empty list return 0
domystufftolistgenerics [] = 0

--this says take anything and return an int
dostufftoathing :: aSSSS -> Int
dostufftoathing x = 0


--Type constraints
-- just like c# generic where. you can't just do any operation on anything

--if you created a sum function and specified that you could return a, which is anything
--this isn't valid as you can't sum anything, you can't sum strings

--define a sum function
 --Num a=> this is what you use to contrain things to a type
 -- Num is a built in haskel type that says you have to handle plus sign and know what zero is
mysumgenericfunction :: Num a=> [a] -> a
mysumgenericfunction [] = 0
mysumgenericfunction (x : xs) = x + sum xs

--multiple contraints
mysumtostring :: (Num a, Show a) => [a] -> [Char]
mysumtostring xs = show(sum xs)


--Type Synonyms
--just giving a random alias to something already defined
type MyStringType = [Char]
-- this is as if in c# you had a gneric List of List<Person> and you wanted to alias it back into PersonList
-- type PersonList = List<Person>
-- var pl = new PersonList();


--New type, this makes a new type from an existing type that cannot be interchanged
-- make a customer id type that is of type Int but the customer id cannot be just a normal int
-- this is similiar to if you had a c# Customer object with an id field that was integer but instead of making it just an integer you made
--   it a specific type like public class CustomerId, that held and internal int id field

--CustsomerId is the type, MakeCustomerId is the name of the constructor to make it, this is unlike C# where the constructor has to be named the same
-- the constructor can be named the same if you want but doesn't have to
newtype CustomerId = MakeCustomerId Int
-- or could do newtype CustomerId = CustomerId Int16

--so then any variable defined to be of type CustomerId cannot be assigned an Int
badCustomerId :: CustomerId
goodCustomerId :: CustomerId
---badCustomerId = 3  no worky

goodCustomerId = MakeCustomerId 3
-- what if you have the customer id but you want to get the actual integer from iterateiterate
--you have to make a function specifically to do this

getCustomerId :: CustomerId -> Int --- take a customerid type and return an int
getCustomerId (MakeCustomerId id) = id ---- take a customerid type that was made from the MakeCustomerId contructor and return the id part








































--constructor is just like contructor overload except instead of differen method signatures,you give differnet names
