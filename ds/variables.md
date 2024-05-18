This is about the shell
Variables stay in the temp storage of the ram.
skill="Devops"
here skill is the storage and devops is the value

to print in the terminal 
echo $skill

### same thing now for python
print("Hello World")
skill = "Devops"
print(skill)

## Lists in Python
tools = ["Jenkins" , "Docker", "K8s" , "Terraform", 90]
print(tools[1])    #Docker

## Tuple 
tools = ("Jenkins" , "Docker", "K8s" , "Terraform", 90)


# Dictionary
key =value
devops = {
    "Ci/Cd" : "Jenkins",
    "Iac" : "Terraform"
}
print(devops["Iac"])    # Terraform


devops = {
    "Ci/Cd" : "Jenkins",
    "Iac" : "Terraform"
    "Tech":{
        "Cloud" : "AWS,
        "Containers":"K8s",
        "Gitops": ["Gitops","AgroCD","Tekton"]
    },
    "Year": 2024

}

### JSON
{
    "Ci/Cd" : "Jenkins",
    "Iac" : "Terraform",
    "Tech":
    {
        "Cloud" : "AWS",
        "Containers":"K8s",
        "Gitops": 
            [
                "Gitops",
                "AgroCD",
                "Tekton"
                ]
    },
    "Year": 2024

}

## Yaml


devops:
  Ci/Cd: Jenkins
  Iac: Terraform
  Tech:
    Cloud: AWS
    Containers: K8s
    Gitops
     - Gitops
     - AgroCD
     - Tekton
  Year: 2024

  To write configuration mostly Yaml is used and to read data mostly JSON is used.





# Networking Commands
ifconfig, ip addr - to see the ip address
traceroute -  give you the latency
netstat -antp - shows all the open ports
ss -tlpna - also show all the ports 
ps -ef - shows the processes
nmap is  used for scanning the networks.
dig - it shows dnslookup
nslookup same as dig
arp -a - shows all the neighbors in network
