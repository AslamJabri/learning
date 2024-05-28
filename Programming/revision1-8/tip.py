print("Welcome to the tip calculator!")
total_bill = float(input("What was the total bill? $"))
tip = int(input("How much tip would you like to give? 10 , 12 or 15? "))
split = int(input("How many people to split the bill? "))

add_tip = (total_bill * tip)/100
total_amount = total_bill + add_tip
split_amount = total_amount / split
print(f"Each person should pay: ${split_amount:.2f}")