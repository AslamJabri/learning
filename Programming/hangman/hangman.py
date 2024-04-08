import random
from hangman_art import logo
from hangman_art import stages
from word_list import word_list

print(logo)
chosen_word = random.choice(word_list)

display = []
word_length = (len(chosen_word))
for letter in range(word_length):
    display+="_"
print(display)
end_of_game = False
lives = 6


while not end_of_game:
    guess = input("letter? ").lower()
    
    if guess in display:
        print(f"You have already guessed it {guess}.")
    
    for position in range(word_length):
        letter = chosen_word[position] 
        if letter == guess:
            display[position] = letter
    if guess not in chosen_word:
        print(f"You guessed {guess}, thats not in word.lose life")
        
        lives -= 1
        if lives ==0:
            end_of_game = True
            print("You lose")
            print(f"The chosen word was {chosen_word}")
    print(f"{' '.join(display)}")
            
    if "_" not in display:
        end_of_game = True
        print("You Won")
    print(stages[lives])