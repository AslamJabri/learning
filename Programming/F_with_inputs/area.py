import math

def paint_calc(height,width,cover):
    number_of_cans = (height * width)/cover
    print(f"You'll need {math.ceil(number_of_cans)} cans of paint")


test_h = int(input())
test_w = int(input())
coverage = 5

paint_calc(height=test_h,width=test_w,cover=coverage)