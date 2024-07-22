# Workshop for DevDays: Shaping data with Microsoft Fabric hands-on experience

The Taipei Mass Rapid Transit (MRT) MRTstations.csv data is from 
https://en.wikipedia.org/wiki/List_of_railway_and_metro_stations_in_Taiwan

Welcome to the Shaping data with Microsoft Fabric hands-on experience workshop.  The purpose of the workshop is to bring you up to speed on some of the data shaping tools in the Lakehouse, Data Engineering, Data Factory (Data Integration), Data Science, and Power BI experiences of Microsoft Fabric.  You will be using pre-configured trial resources in this workshop.  Each of you will recieve a userid and password to access the resources.  Please consult your instuctor if you have any questions or blockers.

The Workshop is broken up into three parts:
* Overview and Demo
* Hands-on Labs
* Wrap up

Prior to starting the hands-on activites you will recieve a userid and password to access the Fabric resources from your instructor.

## Login

In your browser (Incognito, InPrivate, Private) cut and paste this Link

```
https://fabric.microsoft.com/
```
 
Enter the userid (Email) assigned for you to use during the workshop and click `Submit`

![login1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/login1.png)

Enter the password provided by the instructor and click `Sign in`

![login2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/login2.png)

If this dialog pops up Click on `Ask later` button

![asklater](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/asklater.png)

This should land you on a home page that looks like this:

![landing](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/landing.png)

## Create a new Lakehouse in your Fabric workspace

To get started you can click on any of the experiences on the home page or on the Microsoft Fabric icon in the bottow left corner of the browser.  For example click on `Data Factory`

![datafactory](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/datafactory.png)

Now click on Workspaces to find your Fabric workspace.  Please click on the workspace that is the same as you userid (email) i.e. user1 or user2, etc

![workspace](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/workspace.png)

When you open the workspace it should be empty and look something like this:

![user1ws](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/user1ws.png)

Create a new Lakehouse by clicking +New and selecting Lakehouse

![lh1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/lh1.png)

Name the Lakehouse something like `MRT` since this lakehouse will used to collect and analyze public Taipei Mass Rapid Transit (MRT) data.  Click `Create`

![newlh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newlh.png)

The empty lakehouse should look like this with empty Tables and Files folders

![mrttablesfiles](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrttablesfiles.png)


## Shape 1 - Get zipped files with a Data Factory pipeline and unzip them in OneLake





### Create a New Power BI report

You are now ready to build a Power BI report

Click New report on the top bar above the Model

Build a simple PBI report

![fabricpbireport](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/fabricpbireport.png)


## Congrats you have finished the workshop!