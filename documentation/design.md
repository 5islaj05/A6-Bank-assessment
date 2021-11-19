# Design documentation
Provided design documentation shows the whole process, design and plan for the project. The diagrams will be included as well.

## Use Cases
There were several key features that were the most important for this project to be fully functional and it would also meet the requirements of the user. These are:
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

![](/documentation/images/usecase.drawio.png)

### UML Class Diagram

UML Class Diagram describes the process behind the whole project, so called "backend". It shows how different functions and classes have been used to meet the requirements in the application that will make it more readable for everyone, especially for those who do not want to look at the code itself.

![](/documentation/images/uml.drawio.png)

### UML Robustness Diagram

Robustness diagram describes the basic concept of the application explaining how different functions are being provided and their usage starting from the actor; user in this case. 

![](/documentation/images/Robustness.drawio.png)


## Plan & Design
| Task | Description | Participation |
| ---- | ----------- | ------------- |
| Project Plan | Project plan on GitHub to work out the most important features to create and assign the tasks to group members | Ismail & Jamil |
| Documentation | Documentation of the whole project, built in markdown in GitHub | Kacper & Jamil |
| Use Cases | Use Case Diagram that would explain all the features in the project | Kacper |
| UML Class Diagram | UML Class Diagram that would explain all the classes and functions in the project | Kacper |
| Robustness Diagram | Robustnesses Diagram to define and summarize the whole project | Ilyass |
| Website Design | Website design for creating the frontend with meeting the requirements to the maximum | Guillermo, Ismail, Jamil, Ilyass & Kacper |

## Development Process
| Task | Description | Participation |
| ---- | ----------- | ------------- |
| Modules | Connecting different modules and class to make fully functional website | Ismail |
| REST Client | Creating REST client | Guillermo |
| Transaction page (backend) | Creating backend for the transaction page that would send payments from one account to the other one | Guillermo |
| Transaction page (frontend) | Creating frontend for the transaction page to make the webpage more readable | Ismail, Jamil, Guillermo, Kacper |
| Logger | Creating a logger as a transaction history | Ilyass |
| Admin page | Creating an admin.jsp page (frontend & backend) | Ismail |
| Login functionality | Login webpage | Guillermo & Ismail |
| Keypad | Keypad functionality | Guillermo & Kacper & jamil (consultant) |
| General improvements | General improvements such as grammar spellings, polishing the front end and fixing/identifying bugs | Jamil |


# Git strategy
Github is a tool that allows us to display our code and allow collaboration/a developer to keep track of their progress. A git strategy is very important as we want to make sure our code does not end up breaking the repository which is why the process we deemed the Master repo as the one that has important pushes sent to it after being verified that it works. While other branches are used
 ## Git branching
 We use github's branching feature to split the coding into tasks where we assemble the code at the end and check for compatibility issues and any improvements that can come into place which is done via an active conversation, demonstration of code and how we could merge the code. After our checks are done we merge the code into the master branch although i believe we might have benefited more from using github's features to do this.

 ## Using CI (Continuos integration)
 CI is a pretty useful tool when we fish to automate the process of testing code and making sure the project compiles successfully.  In our project we use it during every push sent to the master branch, dev branch or test branch (which we currently don't use). The benefit given is

 - Any code we now submit will be automatically checked and if it doesn't compile/give us a pass then we know theres an issue and why which is useful if the tests we conducted locally somehow did not pickup the bugs/compilation issue. This means a faster notice in bugs and fixes/features if we believe we need to add them 
  
 - We reduce the potential countless fixes we may have to do if the code we merged with another dev fails and we don't know why. Usually our devs run local tests on their workstation and check for compatibility but the final check fully makes sure.

- users are reassured when they know the project compiled/pasts the test so they're confident in running the program as they can see tests we conducted which is less costly compared to alternative choices
