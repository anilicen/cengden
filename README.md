# cengden

A marketplace for ceng mail users. 

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






