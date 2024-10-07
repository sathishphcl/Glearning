

How To Create An Azure Function App that Calls an External 3rd Party API

Here we are going to xreate & use the Azure Function App with a .net app framework 

Let's deploy a an Azure Function App:

Login to Azure portal using the url  : 
Search for the Azure Function App from the Azure Universal search bar:
![alt text](image.png)

Select the Function App

![alt text](image-1.png)

Select the pricing modlea that you would like to use for your requirments. 
Please refer the Azure/ Microsoft URL to review the Function pricing model (https://azure.microsoft.com/en-in/pricing/details/functions/)![alt text](image-2.png)

I am using the consumption model for this lab scnario.
Proceed to 'Next' for the Storage Configuration:
![alt text](image-3.png)

In this lab case, I am going to create the default storage account choice defined by Azure random name. However, you can create your selecte name for th same.
![alt text](image-4.png)

Proceed to 'Next' for the Network Configuration:

![alt text](image-5.png)

Here, the the Public access has been selected with as this is a lab. However, in the production environment, if the network to be isolated, you can select the public access to 'Off' and configure the Azure virtual network and the needed network CIDR range (of Cloud or On-prem etc.. Proceed to 'Next' for the 'Monitoring' Configuration:

![alt text](image-6.png)

The Monitoring option will create and configure an App insights storage account for the troubleshooting purpose.
Proceed to 'Next' for the 'Deployment' Configuration:
![alt text](image-7.png)

The 'Deployment' option is basically for deployment options with a DevOps/ CICD models. For now, I am continuing to a default setting as disabled.
Click on 'Review+Create' to submit the deployment.
With this option selected, the Function deployment process will show up the review detailed with all the option you have slectes in the previous sections (all) and you can have a final review in one page before you submit the configuration.
![alt text](image-8.png)

 Once the deployment is completed, you can see the deployment 'Overview' page as below:

![alt text](image-9.png)

Note: If you would like to download the configuration that you have finishe with this process, that you can download in a JSON file for the fututre reference and you can create similar fuctions with same comfiguration in the futire.

This lab has created with a code that test the Weather API from the url : https://weatherstack.com/

Pre-requisites:
What are the pre-requisites tha tyou should have for this to test:

Step-1:
Open the web link in any browser that supporte https://weatherstack.com/ (All latest browsers are compatible for this WebApp)

Step-2:
Sign up if you do not have an account in the site/ Login to the application if you have already signedup

Step-3:
Once you are login you will have an API Key (auto-generated), or you can also create your own API key as well.
![alt text](image-10.png)

Now, you are good with the pre-requisites to test the API with the created Azure function App.

Open the Azure Function App that created, Select the 'Create in Azure Portal' Option
![alt text](image-11.png)

Create a Fucntion with 'Http Trigger' option and click on 'Next'
![alt text](image-12.png)

Select the Template details As below: Function 'Name' & the 'Authorization Level' --> "you would like to" 
![alt text](image-13.png)

Select 'Anonymous' for the public access.

Once the Configuration is completed, there is a default funtion Code will be auto-generated with the language/ code framework that we selected. Here as we selected the .Net, there is a auto matic code that has generated with the same framework.
![alt text](image-14.png)

And there is a message showing in the console that you have connected to the Function App and the logs message appears in it. which represents the Azure fuction has succesfullt created.

Now, to test with the Weather API for the web application that we are intended to, 
Please replace the default code with you own code which you generated/ developed to interact with the Weather APP Web applicaiton
You can find the code here dotnet\WeatherAPI.csx

This code has Rewrote to define the variable with the API key to configure under the Fucntion App setting under the Environment variables to avoid exposing the API key as RAW in the program. Which is a Production scenario. 
Created a Key with 'WEATHER_API_KEY'

![alt text](image-15.png)

Below is the refeence point how the code is reading the Environment variable formt he App settings of the fucntion App.
![alt text](image-16.png)

Once the code is copied, Click on 'Test/Run/ option under 'Code+Test'. Now you would be popped up with the 'input'/ 'Output' section. 
Please provide the input in the Name & Value field.
The Name Section is 'Location' and the Value section is the country name (Canada etc.) here as per the program. I have pin pointed how the API code is reading the inputs.
![alt text](image-17.png)

Note: Please make sure you are deleting any JSON content under the Body before you 'Run' the test function.

Now, you can observe the Status code : 200 (OK) which is success communication to the Weather APP, and the information has retrieved as below for the countr or location that we have input

![alt text](image-18.png)

The Green highlited is the one exact Weather/ condition/ temporature that recorded/ read form the Weathershak website through an API and showed up here.