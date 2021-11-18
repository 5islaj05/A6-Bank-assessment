# A6's point of sale application 

The Point of sale application is a single web app tha acts like a sales device which a shopkeeper at a store would use to take transactions from by taking money from the targets card and putting it into the shopkeepers card while also being able to give refunds

##  Notes

- Design documentation can be found [here](./documentation/design.md)
- Test plan can be found [here](./documentation/test_plan.md)
- We use the APACHE license V2 which can be found [here](./LICENSE) 

Our project is a combination of different technologies which is used to create a working Web interface that interacts with a REST API to conduct transaction . We use the following
- html, css and javascript (coding languages) to create a working and friendly user interface that allows the user to input the data needed via HTML forms
- Java server pages (JSP) to create the front end with the combination of the above to display the information given with the back end java code
-  JAX-RS and the Jersey module is used to communicate with the REST API we're given 
-  java is used as the backend (card validation, password hashing, bank to api system etc)

## How to compile the application
Upon downloading the project you can run a `mvn clean install` which should compile and allow you to run a TOMCAT webserver of this project. I recommend using Netbeans which allows you to open this application and run it as a tomcat server rather than trying to do this with just a tomcat server and war file [see here for info if interested](https://www.codejava.net/servers/tomcat/how-to-deploy-a-java-web-application-on-tomcat).

## How to get javadocs
You can compile Javadocs using `mvn javadoc:javadoc` <br>
You can read [this](https://maven.apache.org/plugins/maven-javadoc-plugin/index.html) if you wish for a deeper understanding of how this works


## Configuration
Upon the downloading, compilations and running of the project you're able to configure the project via the admin page which occurs when you login. The username is `admin` and password is `admin`, we recommend you to change the username/password as a security measure (Read below to know how). 

# Using the application
Upon compiling and running the application you're directed to http://localhost:8080/creditcardchecker-web/home.jsp which prompts you to login if you're an admin or just continue as a user which then lets you take the clients card details.You're also able to refund that transaction if for some reason you need to. 

The client also allows you to update the default card its stores money/refunds money from while also letting you change the admin account details.



# Requirements
The software requires the following software
- Java JDK 11 (8 will do)
- Google chrome/firefox/edge browser (some features may not work on edge/internet explorer and mobile may have limited support)
- Latest Linux OS (any distribution) or windows 10+ OS (mobile may work with limited support)
- apache tomcat 9 (to act as a webserver)
- Netbeans (OPTIONAL- easy setup of webserver)
  


# Contributors
Our project developers are listed below. You also may check [here](https://github.com/5islaj05/A6-Bank-assessment/graphs/contributors) for github contribution data however please note that the data may not be accurate due to the fact some code have been done in lab sessions with the team helping each other out.

- [5islaj05](https://github.com/5islaj05)
- [GuishermoCaballero](https://github.com/GuishermoCaballero)
- [IsmailKefokeris](https://github.com/IsmailKefokeris)
- [IsmailKefokeris](https://github.com/IsmailKefokeris) or [kapol](https://github.com/Kaapol)
- [sato2021-el](https://github.com/sato2021-el)



