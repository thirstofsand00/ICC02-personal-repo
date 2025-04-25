#!/bin/env python3

def display_menu():
    print("\nMenu:\n")
    print("1) Read and display names")
    print("2) Add a new name")
    print("3) Exit")

def read_names():
    try: #(try + except) when using try, python tries to, in this case, open a file and if it doesn´t work, instead of crashing,
        #a warning message will appear with the print below FileNotFoundError
        with open("names.txt", "r") as file: #The with statement ensures the file is automatically closed when you're done, 
            #even if an error occurs. 
            names = file.readlines()
            print("\nList of names:")
            for name in names: #shows all names on the list = a loop
                print(name.strip()) #.strip() removes the extra line between names
    except FileNotFoundError:
        print("names.txt not found. Is it in the same directory as this script?")

def add_name():
    new_name = input("Enter the new name: ")
    with open("names.txt", "a") as file: # "a" = append; Again, "with" makes opening and closing a file authomatic and safer
        file.write(f"{new_name}\n")
    print(f"{new_name} added.")

# Main loop
while True: #infinite loop
    display_menu()
    choice = input("Enter your choice (1-3): ")

    if choice == "1":
        read_names()
    elif choice == "2":
        add_name()
    elif choice == "3":
        print("Thank You, Goodbye!")
        break #infinite loop stops
    else:
        print("Invalid option. Please enter 1, 2, or 3.")