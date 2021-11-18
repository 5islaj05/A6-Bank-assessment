# Test plan document

|Test plan|Action |Expected result|result given|pass or fail |
|---------|------|-----------------|--------------|--------------|
|1| user enters the url to website | Upon accessing the root domain the login page is displayed | login page is shown and user can input username/password | pass |
|2| entering the correct  username and password | only accepts right password/username and im logged in | Logged in successfully and redirected to terminal while incorrect credentials just does nothing | pass |
|3| missing property or misconfigured properties file | It should give us an error to explain whats missing | program only errors if it cannot load file | fail |
|4| Website loads up terminal | A terminal with numberpad to load | Havent been implemented yet | Fail |
|5| Refund action if account has enough money| refund to occur successfully | the account received the refund and the other accounts balance has been updated | pass |
|5.1| Refund action if account have not enough money| Transaction declined with error message | The user is informed the transaction was not successful due to insufficient funds  | pass |
|6| transaction upon being submitted interacts with the REST API | the API to accept the request and fulfill it | The api completes the transaction and transfer the funds | Fail |
|7| transaction successfully completed | The transaction details are locally logged  except cvv number| All transaction details except cvv is stored | pass |
|8| configure properties file | The administrator/system manager is able to change username/password | The manager is able to change the password/username and any other details | pass |
|9| logger logs information  | The logger is logging information that is useful and logs errors that are meaningful | Logger does not work | fail |

