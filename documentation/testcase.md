# Test case document

| Test case | Action | Expected reaction | Reaction given | Pass or Fail |
| ------------- | ------------- | ---------- | ------ | ----- |
|1|  Check to see if default page is the login page| login page is the default url | Upon accessing the root domain the login page is displayed | Pass |
|2| Login as admin using password stored in temp properties file | User logs in into the admin's account | Admin.jsp webpage opens up to enter bank details | Pass |
|3| Enter card details of the receiver| Card details should have been changed and saved in a temp tomcat folder | Card details have been saved | Pass |
|4| Press Go to Transaction Page or Logout | The admin page exits either to login page or transaction page | As expected | Pass |
|5| Login with wrong login details | System throws error as incorrect details have been entered | As expected | Pass |
|6| Enter card details in transaction page | In transaction page card details should have been entered with a keypad | As expected | Pass |
|7| Enter either letters, too less or too many digits in card number input field. | System throws an error and does not allow the user to enter further details | As expected. The same happens with any other bank details such as CVV, expiry date or amount | Pass |
|8| Enter input on user's keyboard | System should not allow entering any input by the user's keyboard when entering card's details | As expected; input set as readonly | Pass |
|9| If insufficient funds | If the account does not have enough money to make a payment, it should throw an error | System throws an error and the payment does not go through | Pass |
|10| If everything inserted properly and there are enough funds | System should allow to send a payment | As expected | Pass |
|11| Refund if the payment has been send properly | System should bring back the payment to the sender | As expected | Pass |
|12| Transaction upon being submitted interacts with the REST API | The API to accept the request and fulfill it | The API completes the transaction and transfer the funds | Pass |
|13| Configure properties file | The administrator/system manager is able to change username/password | The manager is able to change the password/username and any other details | Pass |
|14| Logger logs transaction history, declined and accepted ones | The logger is logging information that is useful and logs errors that are meaningful | Logger only displays during the transaction but does not save in any file | Fail |
