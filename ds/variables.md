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
  Year
    2024

