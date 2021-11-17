# A6's point of sale application 

The Point of sale application is a single web app tha acts like a sales device which a shopkeeper at a store would use to take transactions from by taking money from the targets card and putting it into the shopkeepers card while also being able to give refunds

##  Notes

- Design documentation can be found [here](./documentation/design.md)
- Testing documentation (test plan) can be found [here](./documentation/testcase.md)
- We use the APACHE license V2 which can be found [here](./LICENSE) 

Our project is uses a combination of different technologies to create a working Web interface that interacts with a REST API . We use the following
- html, css and javascript to create a working and friendly user interface that allows the user to input the data needed via HTML forms
- Java server pages (JSP) to create the front end with the combination of the above to display the information given with the back end java code
-  JAX-RS and the Jersey module is used to communicate with the REST API we're given 

## How to compile the application
Upon downloading the project you can run a `mvn clean install` which should compile and allow you to run a TOMCAT webserver of this project. I recommend using Netbeans for simplicity


## How to get javadocs
You can compile Javadocs using `mvn javadoc:javadoc` <br>
You can read [this](https://maven.apache.org/plugins/maven-javadoc-plugin/index.html) if you wish for a deeper understanding of how this works


## Configuration
Requires Caballero's explanation.  Users are expected to fill out a properties file with a username, password.


# Using the application
Upon compiling and running the application you're directed to http://localhost:8080/creditcardchecker-web/ which prompts you to login with your user details. However it has a "guest" option incase you cannot login

Upon successfully logging in you're directed to the page where you can transfer funds (money) with the options of from which account to what account. 

# Requirements
The software requires the following software
- Java JDK 11 (8 will do)
- Google chrome/firefox/edge browser (some features may not work on edge/internet explorer and mobile may have limited support)
- Latest Linux OS (any distribution) or windows 10+ OS (mobile may work with limited support)


# Logging
Being worked on by sato. 





