import string
letters = list(string.ascii_lowercase)

def encode(text,shift):
    ciphertext = ""
    for letter in text:
        position = letters.index(letter)
        new_position = position+shift
        new_letter = letters[new_position]
        ciphertext += new_letter
    print(ciphertext)

def decode(text,shift):
    decoded_text = ""
    for letter in text:
        position = letters.index(letter)
        new_position = position - shift
        new_letter = letters[new_position]
        decoded_text += new_letter
    print(decoded_text)

user = input("Type 'encode' to encrypt and 'decode' to decrypt:\n")
message = (input("Type your message: \n").lower())
shift = int(input("Type the shift number: "))
if user == "encode":
    encode(message,shift)
elif user == "decode":
    decode(message,shift)



