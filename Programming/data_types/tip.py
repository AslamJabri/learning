print("Welcome to the Tip calculator!")

total_bill = float(input("What was the total bill? $"))
tip = int(input("How much tip would you like to give? 10, 12, or 15? "))
split = int(input("How many people to split the bill?"))


tip_amount = (int(tip)/100)*float(total_bill)
add_tip = total_bill + tip_amount

splitting = add_tip/split

print(f"Each person has to pay: ${splitting:.2f}")