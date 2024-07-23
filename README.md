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

To get started you can click on any of the experiences on the home page or on the Microsoft Fabric icon in the bottow left corner of the browser.  For example click on `Data Factory` or `Data Engineering`

![datafactory](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/datafactory.png)

Now click on Workspaces to find your Fabric workspace.  Please click on the workspace that is the same as the userid (email i.e. user1 or user2, etc) you logged on as.

![workspace](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/workspace.png)

When you open the workspace it should be empty and look something like this:

![user1ws](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/user1ws.png)

Create a new Lakehouse by clicking `+New` and selecting `Lakehouse`

![lh1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/lh1.png)

Name the Lakehouse something like `MRT` since this lakehouse will used to collect and analyze public Taipei Mass Rapid Transit (MRT) data.  Click `Create`

![newlh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newlh.png)

The empty lakehouse should look like this with empty Tables and Files folders

![mrttablesfiles](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrttablesfiles.png)


## Shape 1 - Get zipped files with a Data Factory pipeline and unzip them into the Lakehouse OneLake

### Setup the files in the Lakehouse

In the MRT Lakehouse click on the three dots to the right of the Folders icon and select `New subfolder`

![newsubfolder](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newsubfolder.png)

Name it something like `mrtfiles` and click `Create`

![mrtfiles](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrtfiles.png)

Click on the three dots to the right of the the `mrtfiles` and select `New shortcut`

This will bring up this screen

![newsc](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newsc.png)

Select `Microsoft OneLake` and then select the `mrtdata` Lakehouse and click `Next`

![mrtdatalh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrtdatalh.png)

Select the `2019zip` folder and click `Next`

![2019zip](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/2019zip.png)

Click `Create`

![createsc](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/createsc.png)

The files are now available in your `mrtfiles` subfolder

![scfiles](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/scfiles.png)

Create one more subfolder in the `mrtfiles` folder. Click on the three dots to the right of the `mrtfiles` folders icon and select `New subfolder`

![newsubfolderraw](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newsubfolderraw.png)

Name it something like `raw` and click `Create`

![raw](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/raw.png)

The Files should look somehing like this:

![lhdone](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/lhdone.png)

### Copy and unzip the files into raw subfolder using a Data pipeline

Go back into your workspace and select `+New` and select `More options`

![moreoptions](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/moreoptions.png)

This brings up a list of all the Fabric items.  Find `Data Factory` and click on `Data pipeline`

![datapl](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/datapl.png)

Name the pipeline `copyandunzip` and click `Create`

![copyandunzip](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/copyandunzip.png)

Click on the green `Pipeline activity` and select `Copy data`

![copydata](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/copydata.png)

On the General tab name the Copy activity `copyandunzip`

![generaltab](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/generaltab.png)

Click on the Source tab and click on the Connection dropdown and select `More`

![more](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/more.png)

Select `OneLake data hub` and select your MRT Lakehouse in your workspace (user?)

![sourcecon](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/sourcecon.png)

Browse to the File path: `mrtfiles/2019zip`
Make sure the `Recursively` checkbox is checked

![sourcefp](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/sourcefp.png)

`Leave the File format` as `Binary`
but click on the `File format` `Settings` button and select `Zip Deflate (.zip)` and click `OK`

![ffsettings](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/ffsettings.png)

Under the `Advanced` section uncheck the `Preserve zip file name as folder` checkbox

![advanced](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/advanced.png)

Click on the Destination tab and click on the Connection dropdown and select the same `MRT` Lakehouse connection you used in the Source. Browse to the File path: `mrtfiles/raw`.  `Leave the File format` as `Binary`
 
Click on `Run`

![runpl](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/runpl.png)

Click `Save and run`

![saveandrun](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/saveandrun.png)

It should run in about 60 seconds and should look like this when it succeeded

![succeeded](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/succeeded.png)

Check the `raw` folder in the MRT Lakehouse and see if the files are unzipped and in the file.  Should look like this:

![uzraw](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/uzraw.png)








### Create a New Power BI report

You are now ready to build a Power BI report

Click New report on the top bar above the Model

Build a simple PBI report

![fabricpbireport](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/fabricpbireport.png)


## Congrats you have finished the workshop!