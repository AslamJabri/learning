import random
rock = '''
    _______
---'   ____)
      (_____)
      (_____)
      (____)
---.__(___)
'''

paper = '''
    _______
---'   ____)____
          ______)
          _______)
         _______)
---.__________)
'''

scissors = '''
    _______
---'   ____)____
          ______)
       __________)
      (____)
---.__(___)
'''
user = int(input("What do you choose? Type 0 for Rock, 1 for Paper or 2 for Scissors.\n"))
if user == 0:
    print(rock)
elif user == 1:
    print(paper)
else:
    print(scissors)
computer = random.randint(0,2)
print("Computer Chose:")
if computer == 0:
    print(rock)
elif computer == 1:
    print(paper)
else:
    print(scissors)

if user > 2:
    print("Please select from the given numbers")
elif user == 0 and computer == 2:
    print("User Won!")
elif user == 1 and computer == 0:
    print("User Won!")
elif user == 2 and computer == 1:
    print("User Won!")
elif user == computer:
    print("draw!")
else:
    print("Computer Win!")