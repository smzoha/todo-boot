# Z-ToDo

A basic to-do application that is implemented using Java, Spring Boot & Spring Security.

# Motivation
The aim of the project was to test the functionalities of Spring Boot, Spring Data JPA and Spring Security, with the focus being mostly on the latter module of the framework. The commits have been separated based on the different approaches followed when developing the application, as well as implementing each individual module.

# Tech Used
* Java 1.8
* PostgreSQL
* Spring Boot
* Spring Data JPA
* Spring Security
* Bootstrap
* JQuery
* JSP
* Jaspyt

# How to Use
0. Your device must have JDK 1.8, Tomcat 9.0 and PostgreSQL installed
   * The project does not use Gradle wrapper, so you may have to configure it
1. Create a database named `todo`, such that the database is accessible as `localhost:5432/todo`
2. Create a user named `todo-app` and authorize permission to the aforementioned user
3. Run the database scripts found in `todo-boot/src/main/resources/db-scripts.sql` to initialize the database
   * The step may become automated in an upcoming release
4. Build the application using `gradle clean build`
5. Run the application by configuring the Tomcat server

# Notes
* In order to create the first user with administrative privilege, please create an user using the application and insert the `ADMIN` role in the privilege table for the user. For example:
   * `INSERT INTO prilvilege VALUES ('admin', 'ADMIN')` -- where 'admin' your user name
   
# Current Version
   1.1
   
# Prerequisite Links
* [Oracle JDK8](https://www.oracle.com/java/technologies/downloads/#java8)
* [PostgreSQL](https://www.postgresql.org/)
* [Gradle](https://gradle.org/)
* [Apache Tomcat](https://tomcat.apache.org/)

---

Created by Shamah Mahbub Zoha @ ZedApps
