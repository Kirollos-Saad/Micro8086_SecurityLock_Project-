# Micro8086_SecurityLock_Project-
In the bank, a security lock is used to access some rooms. This lock accepts two inputs: the
employee identification number (16 bits) and his/her password (4 bits).The bank has 20
employees, and their database is constructed and stored in the memory. 
The inputs of the program are the employee identification and the password.
The output is one bit (0/1) that means (denied/allowed) and a message will appear as an output(whether denied or allowed)

Here's a breakdown of the code:

1️⃣ Initialization: The program sets up the required data segment and initializes registers.

2️⃣ Input Prompts:
The user is prompted to enter their ID and password.
The code uses predefined messages to display prompts and error messages.

3️⃣ ID Validation:The program compares the entered ID with the IDs stored in the database.
If a match is found, the program proceeds to the password validation step.
Otherwise, an error message is displayed, and the user is prompted to enter their ID again.

4️⃣ Password Validation:
The program compares the entered password with the corresponding password from the database.
If the passwords match, access is granted.
Otherwise, an error message is displayed, and the user is prompted to enter their ID again.

5️⃣ Access Granted/Denied: Depending on the outcome of the ID and password validation, the program displays a message indicating whether access is granted or denied.

6️⃣ Additional Checks:The code includes checks for a long password (greater than 4 bits) to provide user feedback.
