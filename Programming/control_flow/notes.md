## Control Statements
In Python, control statements are used to alter the flow of execution in a program based on certain conditions. Here are the key rules for using control statements in Python:

    Indentation: Python uses indentation to define blocks of code. The standard convention is to use four spaces for each level of indentation. Incorrect indentation can lead to syntax errors or unexpected behavior.

### syntax    if Statement:


if condition:
    # Code block to execute if condition is True
else:
    # Code block to execute if condition is False

#####
The else block is optional.
You can also use elif for multiple conditions.
## Example:
x = 10
if x > 5:
    print("x is greater than 5")

## Comparision Operator

Equal to (==):

    Returns True if the values on both sides of the operator are equal, otherwise False.
    Example:

    python

    x = 5
    y = 5
    print(x == y)  # Output: True

Not equal to (!=):

    Returns True if the values on both sides of the operator are not equal, otherwise False.
    Example:

    python

    x = 5
    y = 10
    print(x != y)  # Output: True

Greater than (>):

    Returns True if the value on the left side of the operator is greater than the value on the right side, otherwise False.
    Example:

    python

    x = 10
    y = 5
    print(x > y)  # Output: True

Greater than or equal to (>=):

    Returns True if the value on the left side of the operator is greater than or equal to the value on the right side, otherwise False.
    Example:

    python

    x = 10
    y = 10
    print(x >= y)  # Output: True

Less than (<):

    Returns True if the value on the left side of the operator is less than the value on the right side, otherwise False.
    Example:

    python

    x = 5
    y = 10
    print(x < y)  # Output: True

Less than or equal to (<=):

    Returns True if the value on the left side of the operator is less than or equal to the value on the right side, otherwise False.
    Example:

    python

x = 5
y = 5
print(x <= y)  # Output: True
