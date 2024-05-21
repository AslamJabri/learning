number = int(input())
add = 0
for i in range(2,number +2,2):
    #print(i)
    if i % 2 == 0:
        add += i 
        
print(add)