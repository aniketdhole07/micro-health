App to manage any AVR IoT Board Sensor Data and Read User's Heart Rate using Phone's Camera


## [App Download Link](https://drive.google.com/file/d/1jK6fpLpQRyB33RrERERbQV7F4aveBjAn/view?usp=sharing)

<a href="https://ibb.co/kyXDxYt"><img src="https://i.ibb.co/hMVdypS/image-2021-01-31-T012541-426.png" alt="image-2021-01-31-T012541-426" border="0"></a>






# How I Build It
The App was build using Flutter and Firebase.

1. Flutter: Framework to develop Mobile Apps easily using Java.

2. Firebase: Database to connect Apps and also has Authentication Feature for easily integrating User Auth in App.

# How I used Microchip AVR IoT :
Not everyone can create a MP-Lab Project and then try to build it for his WIFI settings, So I tried to make it Universal for all the AVR IoT Boards by just entering the Board ID the App will link the Temperature and Light Sensor Data. As the most of users are from non-technical background they might not have tools or knowledge to Build the AVR Project and Flash it to the Board so using this app they can easily View the Sensor Data.

It would securely provide user his Data as I have included Authentication Features for each User and Board.

# For Reading Sensor Data:
Whenever User SignUp in the App it will take the Board ID of AVR IoT Board (eg. 012386XXXXXXXXB1FE). This will be stored in the Firebase Database. Any IoT WG Board's ID can be added here.

<a href="https://ibb.co/n6nsGMD"><img src="https://i.ibb.co/Gntv6QV/Screenshot-2021-01-31-00-58-57-600-com-example-firebase.jpg" alt="Screenshot-2021-01-31-00-58-57-600-com-example-firebase" border="0"></a>
<a href="https://ibb.co/R0Wq0FF"><img src="https://i.ibb.co/9Tj7TDD/IMG-20210131-020825.jpg" alt="IMG-20210131-020825" border="0"></a>

Whenever user is Authenticated he can see options to "View Sensor Data" ,here he can open that and view the Live Data from AVR IoT Board

<a href="https://ibb.co/VvCfVn8"><img src="https://i.ibb.co/tb2VBj5/Screenshot-2021-01-31-01-02-34-760-com-android-chrome-1.jpg" alt="Screenshot-2021-01-31-01-02-34-760-com-android-chrome-1" border="0"></a>
<a href="https://ibb.co/zrj0LTq"><img src="https://i.ibb.co/kxkWrsN/Screenshot-2021-01-31-01-02-46-551-com-android-chrome-1.jpg" alt="Screenshot-2021-01-31-01-02-46-551-com-android-chrome-1" border="0"></a>



# For Calculating Heart Rate:
I have used Phone's Camera to read Pulses from Index Fingers . The method is known as photoplethysmogram (PPG) it is an optically obtained plethysmogram that can be used to detect blood volume changes in the microvascular bed of tissue

<a href="https://ibb.co/n1HLc4H"><img src="https://i.ibb.co/B6XCZvX/1-75e0-L3-AW-FG9b-Ab9-AVn-Gz-Q.jpg" alt="1-75e0-L3-AW-FG9b-Ab9-AVn-Gz-Q" border="0"></a>

We measure the average value of all the pixel’s intensity of the camera image, the intensity measured will vary with the blood flow.


<a href="https://ibb.co/KhQGWrj"><img src="https://i.ibb.co/Gp1JR5v/Screenshot-2021-01-31-00-58-28-598-com-example-firebase.jpg" alt="Screenshot-2021-01-31-00-58-28-598-com-example-firebase" border="0"></a>



# Future Work
1. Adding More Health Features like Oxygen Level

2. Alerts
