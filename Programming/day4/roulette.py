import random
name = input("give me all the names with commas: ")

names = name.split(",")
length = len(names)
#print(length)
random_int = random.randint(1,length)
#print(random_int)

print(f"{names[random_int]} will pay the bill")