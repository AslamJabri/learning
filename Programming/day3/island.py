print("""
                       _
                    .-;;;.
                   .;;;;;;;;.
                 .;;;;;;;;;;;;.
                .;;;;;;;;;;;-'_\
                .;;;;;;;-'_,-' `
                .;;;-'_,-'___ __)
                |__,-'---'=)
                (( \::   `-   \-/
                 \- )    '  .__\
                  \       / ___/
                 /`'     ( '---)
               _/  \ \   `\ `-;
                \   \ ` .  --'
                 \   \    ` /
                  \  /     |\ """)

print("Welcome to Treasure Island")
turn = input("Your mission is to find the treasure? Do you want to take right or left ")


if turn == "left":
    action = input("You have reached to the shore. Wait for boat or swim? ")
    if action == "boat":
        door = input("You have reached which door you want to select? Red, Blue , Yellow.")
        if door == "Yellow":
            print("You Win!")
        else:
            print("Game Over!")
    else:
        print("Game Over!")
else:
    print("Game Over!")


