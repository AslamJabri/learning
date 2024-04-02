height = float(input("What's the height? "))
weight = int(input("What's the weight? "))

bmi = weight/height**2
if bmi <= 18.5:
    print(f"Your bmi is {bmi}. you are Underweight")
elif bmi > 18.5 and bmi < 25:
    print(f"Your bmi is {bmi}. Your are normal Weight!")
elif bmi >= 25 and bmi < 30:
    print(f"Your bmi is {bmi}. You are slightly overweight")
elif bmi >= 30 and bmi< 35:
    print(f"Your bmi is {bmi}. You are Obese")
else:
    print(f"Your bmi is {bmi}. You are Clinically Obese")
