# Workshop for DevDays: Shaping data with Microsoft Fabric hands-on experience

Welcome to the Shaping data with Microsoft Fabric hands-on experience workshop.  The purpose of the workshop is to bring you up to speed on some of the data shaping tools in the Lakehouse, Data Engineering, Data Factory (Data Integration), Data Science, and Power BI experiences of Microsoft Fabric.  You will be using pre-configured trial resources in this workshop.  Each of you will recieve a userid and password to access the resources.  Please consult your instuctor if you have any questions or blockers.

### Datasets

* Time-based entry and exit statistics of each Taipei MRT station
https://data.gov.tw/dataset/128506

* The Taipei Mass Rapid Transit (MRT) MRTstations.csv data is from 
https://en.wikipedia.org/wiki/List_of_railway_and_metro_stations_in_Taiwan

### Workshop

The Workshop is broken up into three parts:
* Overview and Demo
* Hands-on Labs
* Wrap up

Prior to starting the hands-on activites you will recieve a userid and password to access the Fabric resources from your instructor.

While you are waiting please Clone this GitHub repo to your local machine by cutting and pasting and running this command.

    ```    
    git clone https://github.com/DataSnowman/shapedata.git
    ```
`Note` you can also download these repo files by clicking on the green `Code` button and selecting `Download ZIP`

![gitclone](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/gitclone.png)


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

## Shape 2 - Load the file(s) to Delta/Parquet tables in the Lakehouse using a Spark Notebook

Navigate to the Data Engineering experience by clicking the bottom left corner and selecting `Data Engineering`

![de](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/de.png)

Click on `Import notebook`under new

![dehome](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/dehome.png)

Select `Upload`

![uploadnb](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/uploadnb.png)

Navigate to the `LoadMRTfiles.ipynb` file and click `Open`

![open](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/open.png)

Click on `Go to workspace`

![gotows](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/gotows.png)

Click on the `LoadMRTfiles` notebook in your workspace

![clicknb1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/clicknb1.png)

When it opens up click on the pin next to the testing and select `Remove all lakehouses`

![ralh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/ralh.png)

Click continue to unlink it from any old lakehouses it may have been attached to. `Don't worry it is not going to do anything to your Lakehouse, and we will attach to your Lakehouse in the next step`

![ralhcontinue](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/ralhcontinue.png)

Click on `Add` which will bring up this dialog box and choose `Existing lakehouse` and click `Add`

![addlh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/addlh.png)

Click on your MRT Lakehouse for your user and click `Add`

![addmrtlh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/addmrtlh.png)

The notebook should look like this:

* The first cell provides the schema of the incoming csv file
* The second cell provides the schema of the Delta/Parquet table being loaded
* The third cell reads the csv, adds a filename column, and formats the date column, then writes to the Delta/Parquet table

Click `Run all`

![runnb](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/runnb.png)

When it completes successfully it should have read the csv file located in the lakehouse Files `Files/mrtfiles/raw/` and created a table called `mrt201912` in the lakehouse Tables `Tables/mrt201912` 

![nbsuccessful](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/nbsuccessful.png)

Navigate back to your MRT Lakehouse and you will be able to see the rows and columns of the `mrt201912` table

![mrt201912](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrt201912.png)

Count the number of rows using Spark SQL in a Notebook.  To do this click on `Open notebook` on the top menu of the Lakehouse and select `New notebook`

![opennb](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/opennb.png)

Click on the three dots to the right of the table and select `Load data > Spark`

![loadddataspark](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/loadddataspark.png)

This will create a new cell in the Notebook with the following Spark SQL in PySpark:

```
df = spark.sql("SELECT * FROM MRT.mrt201912 LIMIT 1000")
display(df)
```
Click the play button to Run cell.  You should get 1000 rows that look like this:

![limit1000](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/limit1000.png)

Hover between the two cells and click on `+ Code` to add a new cell

![pluscode](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/pluscode.png)

In the bottom right corner of the new cell click on the `PySpark (Python)` dropdown and select `Spark SQL`

![sparksql](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/sparksql.png)

Copy the select statement from the cell below and paste it under the `%%SQL`.  These %% commands are the referred to as magic commands.  Those supported in Fabric Notbooks are: %%pyspark, %%spark, %%csharp, %%sql, %%configure 

```
SELECT * FROM MRT.mrt201912 LIMIT 1000
```
Lets modify the Spark SQL to count the number of rows.  The new statement should be like 

```
SELECT count(*) FROM MRT.mrt201912
```
Click the play button to Run cell.

![countstar](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/countstar.png)
  
You should get the following number of rows: 7639920

![count](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/count.png)

Click on the Notebook Name in the upper left corner and change the name to `CountRows`

![nbname](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/nbname.png)

You are done shaping data with Notebooks.

## Shape 3 - Query the new table in the SQL Analytics Endpoint and create a view

Back in the Lakehouse click on the Lakehouse dropdown next to the Share button in the top right corner and select `SQL analytic endpoint`

![sqlendpoint](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/sqlendpoint.png)

You now can query the table you created in the Lakehouse using PySpark, but this time using T-SQL.  The SQL analytic endpoint should look like this:

![sae](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/sae.png)

Click on `New SQL query` on the top menu.  Cut and paste the following query

```
SELECT [日期] as Date, count(*) as Countrows FROM [MRT].[dbo].[mrt201912] 
GROUP BY [日期]
```
Click on `Run` to get the count by date

![countbydate](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/countbydate.png)

Highlight (select) the entire SQL statement and click on `Save as view` 

![highlight](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/highlight.png)

Give the view a name like `rowsbydate` and click `Ok`

![saveasview](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/saveasview.png)

Find the view in the Schemas and click on it to see the data

![rbdview](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/rbdview.png)

We will return to the `SQL analytics endpoint` when we look at Semantic models

## Shape 4 - Get Data and Merge Data with Dataflow Gen2 and load it into a Lakehouse destination

### Get MRTstations.csv

Back in the Lakehouse click on `+ New` and select `Dataflow Gen2`

![newdf](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newdf.png)

Click on `Get data > TEXT/CSV`

![textcsv](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/textcsv.png)

Paste the following link to the `File path or URL`
Authentication kind: Anonymous
Privacy level: None
Click `Next` 

```
https://raw.githubusercontent.com/DataSnowman/shapedata/main/data/MRTstations.csv
```
Preview the file and click `Create`

![previewfile](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/previewfile.png)

Click on `Transform` on the ribbon and click `Use first row as headers`
This will move the first row that contains the headers to be headers

![usefirstrow](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/usefirstrow.png)

Click on `Home` on the ribbon and click `Advanced editor`

![home](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/home.png)

When the `Advanced editor` opens you will the the M language that is used in Power BI, and Power Query in Excel

![adveditor](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/adveditor.png)

Delete the code in the editor and copy and paste the following code

```
let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/DataSnowman/shapedata/main/data/MRTstations.csv"), [Delimiter = ",", Columns = 5, Encoding = 65001, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Replaced value" = Table.ReplaceValue(#"Promoted headers", "板橋", "BL板橋", Replacer.ReplaceText, {"Chinese"}),
  #"Replaced value 1" = Table.ReplaceValue(#"Replaced value", "大橋頭", "大橋頭站", Replacer.ReplaceText, {"Chinese"}),
  #"Replaced value 2" = Table.ReplaceValue(#"Replaced value 1", "頭前莊", "頭前庄", Replacer.ReplaceText, {"Chinese"})
in
  #"Replaced value 2"
```
The pasted code should look like this.  Click `OK`

`Note` the code above is also in the repo in the `MRTstations.txt` file under `code/dataflow`

![replace](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/replace.png)

The new code added 3 steps to the `Applied steps

![appliedsteps](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/appliedsteps.png)

This was just a way to add the 3 replace steps without using the UI of the Dataflow

Click on the gear on the last applied step

![replaceui](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/replaceui.png)

Click `OK` to close the dialog with no changes

This shows the GUI for changing the values in a column with and new value.  We did this because the source data we loaded in the Notebook has different labels for the Chinese name of the station.  We need to merge the two table together and we want to match these values.

Click in the top left corner of the Dataflow and change the name to `MRTstations` and hit `Enter` or `Return`

![dfname](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/dfname.png)

Next you want to set the `Data destination` by clicking the `+` in the bottom right corner above the `Publish` button
Select `Lakehouse`

![datadestination](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/datadestination.png)

Leave the connection as `Lakehouse (none)`and click `Next`

Find your workspace and Lakehouse.  With New table selected use the Table name `MRTstations` and click `Next`

![target](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/target.png)

Accept the default and click `Save settings`

![settings](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/settings.png)

Click `Publish` button in the bottom right corner

![publish](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/publish.png)

Back in your workspace you will see the Dataflow published and refreshing

![refresh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/refresh.png)

You can check the `Refresh history`

![refreshhistory](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/refreshhistory.png)

![rhs](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/rhs.png)

Now open up you `SQL analytics endpoint` and you will see the new table.

![mrtsae](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrtsae.png)

Also open the Lakehouse and you should see the new table

![mrtlh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrtlh.png)

### Get dayofweek.csv

Back in the Lakehouse click on `+ New` and select `Dataflow Gen2`

![newdf](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newdf.png)

Click on `Get data > TEXT/CSV`

![textcsv](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/textcsv.png)

Paste the following link to the `File path or URL`
Data gateway: (none)
Authentication kind: Anonymous
Privacy level: None
Click `Next` 

```
https://raw.githubusercontent.com/DataSnowman/shapedata/main/data/dayofweek.csv
```

Preview the file and click `Create`

![previewfile2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/previewfile2.png)

Click on `Home` on the ribbon and click the `ABC` next to the date column header and select `Date/Time`

![datetime](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/datetime.png)

This changes the date column datatype to `Date/Time` to match the date column in the `mrt201912` table

![dtformat](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/dtformat.png)

Click in the top left corner of the Dataflow and change the name to `dayofweek` and hit `Enter` or `Return`

![dfname2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/dfname2.png)

Next you want to set the `Data destination` by clicking the `+` in the bottom right corner above the `Publish` button
Select `Lakehouse`

![datadestination](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/datadestination.png)

Leave the connection as `Lakehouse (none)`and click `Next`

Find your workspace and Lakehouse.  With New table selected use the Table name `dayofweek` and click `Next`

![target2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/target2.png)

Accept the default and click `Save settings`

![settings2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/settings2.png)

Click `Publish` button in the bottom right corner

![publish](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/publish.png)

Back in your workspace you will see the Dataflow published and refreshing

![refresh2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/refresh2.png)

You can check the `Refresh history`

![refreshhistory2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/refreshhistory2.png)

![rhs2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/rhs2.png)

Open the Lakehouse and you should see the new table

![mrtlh2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrtlh2.png)

### Merge mrt201912 and MRTstations

`MergeStationNames`

Back in the Lakehouse click on `+ New` and select `Dataflow Gen2`

![newdf](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newdf.png)

Click on `Get data > More`

![getdatamore](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/getdatamore.png)

Click on `OneLake data hub` and select your MRT Lakehouse

![onelakedh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/onelakedh.png)

Select the `mrt201912` and `MRTstations` tables.  Click `Create`

![choosedata](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/choosedata.png)

The new Dataflow should look like this

![twotabs](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/twotabs.png)

Click on the `mrt201912` query and select `Advanced Editor` 

![adveditormrt201912](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/adveditormrt201912.png)

Delete the last two rows of the code

```
  #"Navigation 1" = Source{[Id = "mrt201912", ItemKind = "Table"]}[Data]
in
  #"Navigation 1"
```

![mcode1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mcode1.png)

![mcode2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mcode2.png)

Then past the following code to replace the last two lines

```
  #"Navigation 1" = Source{[Id = "mrt201912", ItemKind = "Table"]}[Data],
  #"Renamed columns" = Table.RenameColumns(#"Navigation 1", {{"日期", "date"}, {"時段", "hour"}, {"進站", "origin"}, {"出站", "destination"}, {"人次", "passenger_count"}})
in
  #"Renamed columns"
```

![mcode3](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mcode3.png)

This replaces all the headings with english alpha characters so I can read them since I can't read the orthodox characters 

![alphaheaders](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/alphaheaders.png)

If you prefer not do do this you can keep the heading as is

With the `mrt201912` query selected click on `Combine>Merge queries>Merge queries as new`

![combine1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/combine1.png)

Select `MRTstations` as the `Right table for merge` and select the `origin` column in the Left table and the `Chinese` column in the Right table.  
Click `OK`

![mergeorigin](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mergeorigin.png)

Scroll right until you get to the right most column `MRTstations`.  Click the double arrow icon to bring up the columns in the merged right table.  Just select `Name` and click `OK`

![originname](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/originname.png)

Click on the `Name` column header the change the name to `OriginName`

![nametooriginname](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/nametooriginname.png)

Also rename the Merge query to `MergeOrigin`

![mergeoriginquery](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mergeoriginquery.png)

Now we are going to do the same thing again but this time merge to the destination using the new `MergeOrigin` query and `MRTstations` query

With the `MergeOrigin` query selected click on `Combine>Merge queries>Merge queries as new`

![combine2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/combine2.png)

Select `MRTstations` as the `Right table for merge` and select the `destination` column in the Left table and the `Chinese` column in the Right table.  
Click `OK`

![mergedest](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mergedest.png)

Scroll right until you get to the right most column `MRTstations`.  Click the double arrow icon to bring up the columns in the merged right table.  Just select `Name` and click `OK`

![destname](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/destname.png)

Click on the `Name` column header the change the name to `DestinationName`

![nametodestname](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/nametodestname.png)

Also rename the Merge query to `MergeDest`

![mergedestquery](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mergedestquery.png)

One more thing to add before we Publish.  Create a new column called `Trip` that concatenates the `Origin to Destination` 

Click on `Add column` on the ribbon and click `Custom column`

![customcolumn](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/customcolumn.png)

Name the column `Trip` and cut and paste this formula into the Custom column formula and click `OK`

```
[OriginName] & " to " & [DestinationName]
```

![customcolformula](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/customcolformula.png)

The new column should look like this

![tripcolumn](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/tripcolumn.png)

Click in the top left corner of the Dataflow and change the name to `MergeTrips` and hit `Enter` or `Return`

![mergetripsdf](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mergetripsdf.png)

With the `MergeDest` query selected next you want to set the `Data destination` by clicking the `+` in the bottom right corner above the `Publish` button
Select `Lakehouse`

![datadestination](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/datadestination.png)

Leave the connection as `Lakehouse (none)`and click `Next`

Find your workspace and Lakehouse.  With New table selected use the Table name `Trips` and click `Next`

![tripstarget](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/tripstarget.png)

Accept the default and click `Save settings`

![tripsettings](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/tripsettings.png)

Click `Publish` button in the bottom right corner

![publish](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/publish.png)

Back in your workspace you will see the Dataflow published and refreshing

![triprefresh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/triprefresh.png)

You can check the `Refresh history`

![tripsrefreshhistory](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/tripsrefreshhistory.png)

![tripsrhs](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/tripsrhs.png)

Now open up you `SQL analytics endpoint` and you will see the new table.

![tripssae](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/tripssae.png)

Also open the Lakehouse and you should see the new table

![tripslh](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/tripslh.png)

## Shape 5 - Create a Semantic Model

Now that you have completed the shaping of a data in using a bunch of Fabric experiences let's create a simple two table `New semantic model` that includes the `Trips` table and the `dayofweek` table

Navigate back to your MRT Lakehouse and make sure you are able to see the `Trips` table and the `dayofweek` table

![mrtlhnsm](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/mrtlhnsm.png)

On the top menu bar click on `New semantic model` 

![nsm](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/nsm.png)

In the Direct Lake semantic model name enter `MrtTrips` and select the `Trips` and the `dayofweek` tables
Click on the `Confirm` button

![dlsm](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/dlsm.png)

The semantic model should look something like this:

![ttdlsm](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/ttdlsm.png)

Click on `Manage relationships`

![manarel](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/manarel.png)

Click on `+New relationship`

![newrel](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newrel.png)

For the From table select `Trips` and click on the `date` column
For the To table select `dayofweek` and click on the `date` column
Cardinality `Many to one`
Cross-filter direction `Single`
Make this relationship active `checked`
Assume referential integrity `checked`
Click `Save`

![newreltables](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/newreltables.png)

Look at the relationship and click `Close`

![closenewrel](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/closenewrel.png)

The tables in the semantic model should now be joined

![join](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/join.png)

If you look at the items in your workspace you will see the MrtTrips Semantic Model

![wsitemssm](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/wsitemssm.png) 

## Shape 6 - Create a New Power BI report with Auto-create Report

You are now ready to build a Power BI report

Click on the three dots to the right of the MrtTrips Semantic model and select `Auto-create Report`

![autocreate](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/autocreate.png)

You will get this

![acreportsplash](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/acreportsplash.png)

And then the Report with open

![acreport](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/acreport.png)

Click on `Edit report`

![editreport](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/editreport.png)

Lets add a new page to the report when it opens in edit mode

![editreport](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/editreport.png)

Click on the green `+` next to Page 1 on the bottom left

![page1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/page1.png)

This will add Page 2 

![page2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/page2.png)

Click on the `dayofweek` column in the `dayofweek` table
Click on the `passenger_count` column in the `Trips` table
This should create a table that looks like this

![dowpctable](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/dowpctable.png)

With the table highlighted click on the `Stacked column chart` in the Visualizations

![scc](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/scc.png)

Click on `File> Save Save this report`

![filesave](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/filesave.png)

Enter a name for your report `TripAnalysis` and click `Save`

![tripanalysis](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/tripanalysis.png)

If you look at the items in your workspace you will see the TripAnalysis report

![wsitemsreport](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/wsitemsreport.png) 

## Shape 7 - Automating it all in a pipeline

Wouldn't it be nice to automate much of this shaping so it can updated on a regular basis.  To do this we can create data pipelines that copy data with a pipeline copy activity --> load data with a Notebook and --> load and merge data in a dataflow

We can open the `copyandunzip`and click on `Save as`

![saveascopyandunzip](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/saveascopyandunzip.png)

Name it something like `runall` and click `Save`

![runall](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/runall.png)

Click on the `Notebook` activity on the menu bar

![runallnb](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/runallnb.png)

Under the Notebook settings select the `LoadMRTfiles` Notebook we created earlier

![nbsettings](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/nbsettings.png)

Drag the green checkmark on the copy activity to the Notebook activity.  This means if the Copy activity runs successfully then the Notebook activity runs.

![onsuccessnb](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/onsuccessnb.png)

Click on the `Dataflow` activity on the menu bar

![runalldf1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/runalldf1.png)

Under the Dataflow settings select the `MRTstations` Dataflow we created earlier

![dfsettings1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/dfsettings1.png)

Drag the green checkmark on the Notebook activity to the Dataflow activity.  This means if the Notebook activity runs successfully then the Dataflow activity runs.

![onsuccessdf1](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/onsuccessdf1.png)
 
Click on the `Dataflow` activity on the menu bar

![runalldf2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/runalldf2.png)

Under the Dataflow settings select the `MergeTrips` Dataflow we created earlier

![dfsettings2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/dfsettings2.png)

Drag the green checkmark on the Dataflow1 activity to the Dataflow2 activity.  This means if the Dataflow1 activity runs successfully then the Dataflow2 activity runs.

![onsuccessdf2](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/onsuccessdf2.png)

Click on Save

![saverunall](https://raw.githubusercontent.com/datasnowman/shapedata/main/images/saverunall.png)


`Don't do this now but if you run the pipeline it will re-run many of the things you created today`


## Congrats you have finished the workshop!