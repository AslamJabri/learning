import string
import random
import secrets
print("Welcome to the PyPassword Generator")

# attributes = dir(string)
# print(attributes)
lower_alphabets = string.ascii_lowercase
cap_alphabets = string.ascii_uppercase
symbols_list = list(string.punctuation)
numbers_list = list(string.digits)

alphabets = list(lower_alphabets + cap_alphabets)

letters = int(input("How many letters you want ? "))
symbols = int(input ("How many symbols you want? "))
numbers = int(input("How many numbers you want? "))

chosen_letters = list(random.sample(alphabets,letters))
chosen_symbols = list(random.sample(symbols_list,symbols))
chosen_numbers = list(random.sample(numbers_list,numbers))

password_join = chosen_letters+chosen_numbers+chosen_symbols
password = "".join(password_join)
secrets.choice(password)
#random.shuffle(password)
print(f"Here is your password : {password}")