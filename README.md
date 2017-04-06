# CP363_A3
My unnecessary rendition of assignment 3 for CP363


To run this project, you must first have a local installation of MYSQL, Python3, and virtualenv
I am also assuming you know how to setup a virtual environment and install requirements included in the requirements.txt file.
If not, there are plenty resources on google on how to get this set up.

Using this project
If you want to use the database already provided, go ahead and run the Database.SQL file, this will set up the tables, and add all the data included in the database all at once. The location by default is port 3306, the default MySQL Port.

To **understand whats going on**, look below, If you want to **just see it** scroll to the first photo
The main folders in this project are


**static folder**
 - js : Javascript libraries used in this project
 - css: the css files used in the html, this makes the website look... nice?
 - fonts: Stored the glyphicons (icons) in here to make it easier to navigate
 
This folder contains the static assets, such as javascript library and the css

**templates**
This folder contains the HTML files, the HTML files is also where the javascript is directly coded into.

**app.py**
This is the module that contains the flask app and views, it handles routing and running the application

**functions.py**
Since the same function can be called multiple times in the main, its easier to separate the big functions into their own file
this file contains all functions that access the database (read/write), it also contains the SQL code used to do each operation



**Steps of using the project**.
First you Login

![Alt text](img/login.png?raw=true "Login")

If not a user, you can register, the register page looks like this

![Alt text](img/register.png?raw=true "Register")

Once you've logged on, your homepage should look like this (empty if no albums purchased)

![Alt text](img/pre-home.png?raw=true "Home")

To add more albums, you can either, Search for the album/artist/composer via keyword

![Alt text](img/search.png?raw=true "Search")

Or to see all albums, simply click All Albums

![Alt text](img/all-albums.png?raw=true "All Albums")

You can add albums you like by clicking add, if you already own it, it will not let you

![Alt text](img/already-owned.png?raw=true "Already Owned")

After you've found some albums you like, press checkout in the top tab.

![Alt text](img/checkout.png?raw=true "Checkout")

After you confirm purchase, the albums will be added to your personal library

![Alt text](img/added.png?raw=true "Added Albums")



Well thats about it, this was an assignment for school that was interpretted to be done as a CLI assignment, but I felt that would be too boring.
