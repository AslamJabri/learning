import random

guessed = True

random_num = random.randint(1,100)
print(random_num)
while guessed:
    user_guess = int(input("Guess the Number"))
    if user_guess == random_num:
        guessed = False
    elif user_guess > random_num:
        print("the guessed number is higher")
    elif user_guess < random_num:
        print("The guessed number is very low")
