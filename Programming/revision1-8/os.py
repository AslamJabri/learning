import os

users = ["alpha","beta","gamma"]

for user in users:
    code = os.system("id {}".format(user))
    if code != 0:
        os.system(f"adduser {user}")
    else:
        print("User already exist")
code = os.system("grep science /etc/group")
if code != 0:
    print("Group Science does not exist.Adding it.")
    os.system("groupadd science")
else:
    print("Group already exist, skipping it.")