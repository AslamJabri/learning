def greet():
    print("Hello")
    print("How are You?")
    
greet()
print("Parameter")
def greet_name(name):
    print(f"Hello {name}")
    print(f"How are You {name}?")
greet_name("Tiger")
print("*Positional Argument*********")
def greet_loc(name,location):
    print(f"Hello {name}")
    print(f"How's is the weather in {location}?")
greet_loc("Tiger","Amazon")

print("*Keyword Argument*********")


def greet_loc(name,location):
    print(f"Hello {name}")
    print(f"How's is the weather in {location}?")
greet_loc(location = "Amazon",name = "Lion")