message = "Checking str built in function"

print(message.capitalize())

# we can use dir function which shows all the builtin functions
print(dir(message))

list1 = [1,"23",23]
print(dir(list1))

def add (a,b):
    total = a+b
    return total

print(add(3,2))
#   *args: It allows you to pass a variable number of positional arguments to a function. 
#   The *args parameter collects all the positional arguments passed to the function into a tuple.

 #  **kwargs: It allows you to pass a variable number of keyword arguments to a function. 
 # The **kwargs parameter collects all the keyword arguments passed to the function into a dictionary where the keys are the parameter names and the values are the corresponding argument values.
 
def example_function(*args, **kwargs):
    print("Positional arguments (*args):", args)
    print("Keyword arguments (**kwargs):", kwargs)

example_function(1, 2, 3, name="John", age=30)
