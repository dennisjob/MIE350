# On-Track

On-Track is a student job application tracking system that aims to break the ideology that job seeking is an individual process by providing students with the tools to share job postings, company events and important resources to groups that they participate in. 

## Disclaimer

On-Track was a web application developed as an undergraduate term project for MIE350 at the University of Toronto. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project at localhost.

### Prerequisites

You'll need [JDK 6](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html#jre-6u45-oth-JPR), [Apache Tomcat v7.0](https://tomcat.apache.org/tomcat-7.0-doc/appdev/installation.html), [UCanAccess v4.0.2](http://ucanaccess.sourceforge.net/site.html#examples), and [Microsoft Access 2016](https://www.microsoft.com/en-ca/download/details.aspx?id=50040) to install and run On-Track. The following installation instructions will be relevant to running the web app using the Eclipse Luna IDE.

### Installing

Clone the repository wherever you'd like on your local machine.

```
$ git clone https://github.com/dennisjob/MIE350.git
```

Open Eclipse. Select File > Import > Existing Projects into Workspace. Select archive file and input the file location of the cloned repository.

Select Window > Preferences > Java > Installed JREs. If JRE 1.6 is not installed, select Add > Standard VM > Next > select the file path to JRE 1.6 on your computer. Select Finish and check that the correct JRE is selected before exiting the window. 

In Project Explorer, expand the project. Go to Java Resources > src > db > right-click on the database file (mie350\_webapp_database.mdb) > select Properties. Copy the File Location. 

Go to Java Resources > src > db.properties and change the url field to the location of the database that you copied. Save the file.

You're now set-up for dev and testing purposes. 

### Deploying Locally

To run the web app, first extract the apache-tomcat-7.0.64.zip files in a directory.

Right-click on mie350webapp > select Run As > Run on Server. Under Select the server type, select Tomcat v7.0 Server and click Next.

Under Tomcat installation directory, select the directory where you extracted the binary files. Click Finish.

If you get Windows Firewall messages, click Allow Access. 

## Built With

* [Bootstrap 4](https://getbootstrap.com/docs/4.1/getting-started/introduction/)
* [jQuery](https://api.jquery.com/)
* [MDBoostrap](https://mdbootstrap.com/docs/)
* [Chart.js](https://www.chartjs.org/docs/latest/)

## Authors

* **Sydney Anonuevo** - *Lead Writer* - [Sydney0614](https://github.com/Sydney0614)
* **Lara Caglar** - *Lead Writer* - [laracaglar](https://github.com/laracaglar)
* **Kujtim (Bushi) Dokaj** - *Front-end Lead* - [BushiDokaj](https://github.com/BushiDokaj)
* **Kaye Fung** - *Back-end Lead* - [kayefung](https://github.com/kayefung)
* **Dennis Jon** - *Presenter* - [dennisjob](https://github.com/dennisjob)
* **Kyle Juliao** - *Designer* - [JonahofArc](https://github.com/JonahofArc)
* **Tyler McLeod** - *Project Manager* - [mcleodty](https://github.com/mcleodty)