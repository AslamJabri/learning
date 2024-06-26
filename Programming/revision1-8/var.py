var1 = "Python"
var2 = 75
var3 = 3.5

print(var1)
print(var2)
print(var3)

#Multiple Assignment
a = b = c = 65

print(a,b,c)

#multiple assignments and multiple values
x,y,z = "alpha","beta",12

print("Value of x is ",x)
print("Value of y is ",y)
print("Value of z is ",z)

print(type(var3))

# Data Types
# List
list1 = [12, "list", 3.2, x, var3]
print(list1)

#Tuple enclosed in round bracket and it is immutable
tuple1 = (12, "tuple", 3.2, x, var3)
print(tuple1)

#Dictionary key value pairs
dict1 = {
    "List": "Mutable",
    "Tuple":"Immutable",
    "String": "Sequence of characters",
    "Conditionals": ["If-else",
                     "loops",
                     "while"]
    }
print(dict1)

#Boolean
o = True
t = False
print(type(o))

#print Formats
field = "software"
degree = "Engineering"
print("The name of the field is :",field)
print("The name of the degree is {}".format(degree))

print("I have done the {} in the {} field.".format(degree,field))

print(f"There is a {degree} degree called {field} Engineering.")

print("This is a "+ degree + " degree")


#String Slicing 
planet1 = "Earth"
print(planet1[0])
print(planet1[2])
print(planet1[-1])

print(planet1[0:3])
print(planet1[:])
print(planet1[:3])
print(planet1[2:])


#Tuple Slicing
devops = ("Linux","Vagrant","AWS","Bash","Jenkins","Python")
print(devops[0])
print(devops[4])
print(devops[-1])

print(devops[2:4])
print(devops[2:4][0])
print(devops[2:4][0][1:])


#List Slicing

cloud = ["Google","Azure","Cloudflare","Oracle","Akamai","Alibaba","AWS"]
print(cloud[0])
print(cloud[4])
print(cloud[-1])

print(cloud[2:4])
print(cloud[2:4][0])
print(cloud[2:4][0][1:])


#Dictionary
skills = {
    "devops":("Linux","Vagrant","AWS","Bash","Jenkins"),
    "Development": ["Java","C++","NodeJS"]
}

print(skills)
print(skills["devops"])
print(skills["Development"])
print(skills["devops"][0])
print(skills["Development"][1])
print(skills["devops"][0][2:])
print(skills["Development"][1][0:1])

#Operators
#Arithmetic Operators
arthimetic = ["+","-","/","*","%","**"]
#Assignment Operators
x = 2
y = 3
y+=1
#Comparison Operators
comparison = ("<",">","==","!=",">=","<=")
print("***Logical Operators***")
a = 2
b= 3
andop= a == 2 and b > 3
print(andop)
    # in this both condition has to be true then it return true
orop  = a <= 1 or b ==3
print(orop)
    #in this if any operand is true it retuen true
check = not(a<b)
print(check)  # output:False even though it is true
    # this will return 



print("*****Identity Operators*****")
l = 12
k=15
result = l is k
print(result)
result = l is not k
print(result)

print("***Membership Operators***")
devops_skills = ("Linux","Vagrant","AWS","Bash","Jenkins","Python")
ans = "Linux" in devops_skills
print(ans)
ans = "Bash" not in devops_skills
print(ans)

print("*** Decision Making ***")
food = "pizza"

if food == "pizza":
    print("I love pizza")
elif food == "Burger":
    print("I love Burger")
else:
    print("I love food")
    
print("********")

skills = ["Jenkins","Ansible","Docker"]
lang = ("c++","Python")
print("What skill do you have? ")
print("Which development language you know? ")
salry = {
    "Devops":10000,
    "Development":12000
}
contract1 = {
    "Name":"rocky",
    "skill":"AI"
}
contract2 = {
    "Name":"Smith",
    "skill":"Blockchain"
}
usr_skill = input("Enter Your skills? ")
if usr_skill in skills:
    print("We have that Requriement in Devops")
    print("Your salary will be",salry["Devops"])
elif usr_skill in lang:
    print("We have that Requriement in Development")
    print("Your salary will be",salry["Development"])
elif usr_skill in contract1.values() or usr_skill in contract2.values():
    print("We have that Requriement in Contract")
else:
    print("Sorry we dont have that Requriement")
    
print("********LOOPS***************")

planet = "Earth"
for i in planet:
    print(i)
vaccines = ["Moderna","Pfizer","Covaxin","Astrazeneca"]
for vac in vaccines:
    print(f"These are the vaccines we have {vac}")
    for i in vac:
        print(i)
    
print("*******While loop********")

x = 3
while x < 10:
    print(x)
    x+=1
    
print("Break statement provides you with the opportuinity to exit out of the loop")
for i in "python":
    print(i)
    if i =="h":
        break
print("Loop exited")

print("Continue is something which skips the value")
for i in "python":
    print(i)
    if i =="h":
        print("Data found")
        continue
    print(f"Value of i is {i}")
    
print("Loop exited")