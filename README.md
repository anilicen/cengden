# cengden

A marketplace for ceng mail users. 

## Render Deployment URL
URL: https://cengden-erl5.onrender.com/

## Login and Register Details

In the home page, the user can access to register and login page by clicking login and register buttons in the right-top. Registration only accepts ...@ceng.metu.edu.tr accounts. After registering user will recieve a verification code via email. If the user enters the code, the user will be registered and can login after that. 
If the system does not work, there is an admin trial email and password here:

email: deneme@ceng.metu.edu.tr 
password: password

## Introduction

This project is a e-marketplace web application for ceng mail users. 

It uses cloud Platform-as-a-Service (PaaS) Render with NoSQL database MongoDB. on the Database as-a-Service (DBaaS) cloud platform MongoDB Atlas. 
The application utilizes Email-as-a-Service (EaaS) cloud platform SendGrid for email functionality
This project is done by using Flutter-Web for frontend and AWS cloud functions for backend.

## Render

Render is utilized as the cloud Platform-as-a-Service (PaaS) provider for hosting the e-marketplace web application for ceng mail users. It is used to deploy the application seamlessly, ensuring reliability, scalability, and easy management of the infrastructure. With Render, the deployment process is simplified, allowing developers to focus more on building and improving the application rather than managing infrastructure configurations. Additionally, Render's automatic HTTPS, built-in monitoring, and horizontal scaling capabilities contribute to the efficient operation of the web application on the cloud.

Although there wasn't an option to deploy Flutter-web to Render, we collaboratively found a way. Firstly, I needed to build a flutter-web project and upload it to github. Then, on render, for publish directory section, I entered build/web. Then it worked.

## MongoDB

MongoDB, as a Database-as-a-Service (DBaaS), offers a cloud-based platform for managing data without the need for managing underlying infrastructure. Users can store, manage, and analyze their data in a scalable and flexible manner using MongoDB Atlas, the cloud-based DBaaS offering from MongoDB. 

In mongoDB, I used http(Dio) requests. I needed to get authorization key to send requests. 

```
static Future<void> sendPostRequest(List<bool> token) async {
  var url = Uri.parse(link);
  var response = await http.post(
    url,
  );
  Map<String, dynamic> parsedResponse = json.decode(response.body);

  accessToken = parsedResponse['access_token'];
  token[0] = true;
  refreshToken = parsedResponse['refresh_token'];
  userId = parsedResponse['user_id'];
}
```
This code runs at the start of the website to get authorization key. Then, I can continue to send requests. 

There are 2 collections in the database. Users and Items. Instead of having 4 different collections for Phones, Vehicles, Computers and PrivateLessons, I collected all the items under one collection. In this way, I could easily achieve pagination. 

## SendGrid
To use sendGrid, I looked for many packages for flutter but could not find any. So, I needed a backend service for sending request to sendGrid. Then I used AWS Lambda to send requests. 
```
exports.handler = async (event) => {
    // using Twilio SendGrid's v3 Node.js Library
    // https://github.com/sendgrid/sendgrid-nodejs
    
    const sgMail = require('@sendgrid/mail');
    sgMail.setApiKey('MY-API-KEY');
    const requestBody = JSON.parse(event['body']);
    const verificationCode = requestBody['verificationCode'];
    const htmlContent = '<p>Your verification code is: <strong>' +  verificationCode + '</strong></p>';
    const msg = {
        to: requestBody['email'],//Change to your recipient
        from: 'e2448488@ceng.metu.edu.tr', // Change to your verified sender
        subject: 'Verification Code Cengden',
        text: 'Your Verification Code is:' + verificationCode,
        html: htmlContent,
    };
    
    try {
        await sgMail.send(msg);
        console.log('Email sent');
        return {
            statusCode: 200,
            body: requestBody['email'],
            headers: {
                "Access-Control-Allow-Origin" : "*",
                "Access-Control-Allow-Credentials" : true,
            },
        };
    } catch (error) {
        console.error('Error sending email:', error);
        return {
            statusCode: 500,
            body: requestBody['email']+ error,
            headers: {
                "Access-Control-Allow-Origin" : "*",
                "Access-Control-Allow-Credentials" : true,
            },
        };
    }
};
```
Above is AWS Lambda function code. 

## Flutter-Web 
I chose flutter for the project because I am using Flutter for 2 years. Even though it was not easy to integrate some parts of the project, it was still viable. I was able to access mongoDB from Flutter after some research. 
I used clean architecture for the project because of the project size. 

For entities, I used Items as parent entity and Phone, Vehicle, Computer, PrivateLesson as their child entities. This eased my way to collect them into single list for showing all items and pagination. When I was showing only 1 type (let's say Phones) I got the phones from itemList and copied them to phoneList. Then got the remaining phones from DB. In this way I was able to achieve pagination in all items and selected items.

For register and login, I used SHA-1 hashing technique. I store the hash-codes instead of the passwords. 





