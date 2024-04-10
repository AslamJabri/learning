def prime_checker(n):
    is_prime = True
    for i in range(2,n):
        if n%i == 0:
            is_prime = False
    if is_prime:
        print("Prime Number")
    else:
        print("Not a Prime Number")



number = int(input())
prime_checker(n=number)       