# Tyler Sharretts
# GEOG 673 Week 01

### Variables

# Integer 
var1 = 1

# Floating point numbers 
var2 = 2.34

# Complex numbers
var3 = 5.6 + 7.8j

# Strings 
var4 = "Hello World"

# Booleans 
var5 = True

# Special value to indicate the absence of a value 
var6 = None 

# Miscellaneous
x = 5.333
y = int(x)
print(y, type(y))
print(x, type(x))

# More Miscellaneous
temp_c = 10
temp_f = (temp_c * 9/5) + 32

### In-class Exercise
height = 7
width = 4

# c squared is equal to height squared + width squared
c = height**2 + width**2

# Take square root of c
hyp = c**(1/2)

### Data types 

# Integer 
var1 = 1

# Floating point numbers
var2 = 2.34

# Complex numbers
var3 = 5.6 + 7.8j 

# Strings
var4 = "Hello World"

# Boolpeans
var5 = True

# Special value to indicate the absence of a value 
var6 = None

print("var1 value:", var1, "type:", type(var1))
print("var2 value:", var2, "type:", type(var2))
print("var3 value:", var3, "type:", type(var3))
print("var4 value:", var4, "type:", type(var4))
print("var5 value:", var5, "type:", type(var5))
print("var6 value:", var6, "type:", type(var6))

### Containers

# Lists (creating a list holding 3 elements)
weather = ['rain', 'snow', 'hail']

# Can print it out with the length
print(weather)
print("length:", len(weather))

# Can also have a mixed-type list
mix_type_list = ['rain', 4.5, 99, None]
print(mix_type_list)

### Elements can also be added or removed from list
 
# Adding
weather.append('drizzle')
print(weather)

weather.insert(1, 'graupel')
print(weather)

# Removing 
del weather[0]
print(weather)

# Removing an item from a list and storing it in a new one
observation = weather.pop(2)
print("observation:", observation)

print("weather:", weather)

### In-class Exercise

weather = ['rain', 'snow', 'hail']
txt = 'Within the last 4 hours there have been 5 inches of '
txt + weather[1]

### Elements of a list can be changed
weather = ['rain', 'snow', 'hail']
print("Before change:", weather)
weather[0] = 'sleet'
print("After change:", weather)

# List indexing & slicing 
weather = ['rain', 'hail']
weather.append('drizzle')
print(weather)
weather [1:2]
weather[1:3]

### In-clas exercise 
weather = ['rain', 'snow', 'hail', 'drizzle', 'graupel', 'sleet']
weather = ['rain', 'snow', 'sleet']
print(weather)
txt = ' are possible tomorrow'
weather[0], weather[1], weather [2] + txt

### Tuples

# Tuple with 3 elements 
observations = ('rain', 'snow', 'hail')

# Unpack tuple into Obs1, Obs2, & Obs3
obs1, obs2, obs3 = observations
print("observations:", observations)
print("obs1:", obs1)
print("obs2:", obs2)
print("obs3:", obs3)

### Character strings

# formatting function 
x = 9.356392
y = 29
print('The value of x is {}'. format(x))
print('The value of y is {}'. format(y))
print('The value of x is {} and the value of y is {}'. format(x, y))
print('The value of x is {:.3} and the value of y is {:04}'. format (x,y))

# Modulo (%) operator
print('The value of x is: %s' % x)
x = '%6.1f is less than %3d' % (x, 10)
print(x)

### In-class exercise 
dept = 'GEOG'
classNum1 = 473
classNum2 = 673
a = 'GEOG 673'
b = 'is the best class ever'
print(a+ b)

### Dictionaries 
d = {'site': 'KDOX', 'wind_speed': 20, 'wind direction': 'east'}
print(d.keys())
print(d.values())

### For loops
for x in weather:
    print(x)

for x in range(0,len(weather)):
    print(x)

### Libraries

# Importing the entire math module; typically imported in at the very beginning
import math

# We can use all available functions in math 
math.sqrt(5)    

