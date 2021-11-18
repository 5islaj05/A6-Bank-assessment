# Design documentation
Provided design documentation shows the whole process, design and plan for the project. The diagrams will be included as well.

## Use Cases
There were several key features that were the most important for this project to be fully functionate and it would also meet the requirements of the user. These are:
* Payee's details are read on startup from the properties file
* User should be able to:
  * Enter a new transaction
  * Reverse a transaction
  * Check credit card Lunn Code
  * Allow entry of card number, expiry date and CVV code
  
There should be at least two actors: admin and user whereas user should not be able to access any of confidential websites such as admin.jsp where an actor needs to be logged in to use it.
In admin.jsp, the admin can change the username and password of the administrator, bank details of the payee and URL to connect the bank application.

The use cases of different features in the application:

| Actor | Usage | Response |
| ----- | ----- | -------- |
| Admin | Admin enters logging details in the input fields | Admin logs into the account to configure the device |
| Admin | Admin enters card details in the input fields and presses Change Card Details | Payee's card details is being saved in the properties file and it will be read on startup |
| Admin | Admin enters user details and presses Change User Details | New admin details are being saved in a properties file |
| Admin | Admin presses Logout or Go to Transaction Page button | New webpage appears ready to use for the user |
| User | User presses Continue without Logging button in index.jsp (Home Page)| User is being transferred into transaction page where they can enter they card details to make a payment |
| User | User enters their bank details one by one pressing green button on the keypad | User's bank details are being saved as an object ready to make a payment |
| User | User presses Initiate Transaction button | The desired amount is being transferred into the payee's account |
| User | User presses Refund Transaction button (optional) | Refund is being processed |

## Diagrams

### Use Case Diagram

Use Case Diagram shows the exact same process described in the table above but as a drawing for better understanding.
