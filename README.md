# DailyGYM App

Hi! My name is Alex, and this is a personal project to improve my skills as an iOS developer. 

## Why DailyGYM?

Many of us spend long hours in front of screens. DailyGYM aims to simplify fitness by eliminating the guesswork and making it easy to stay active, whether you're at home, at work, or on the go.

## Overview

DailyGYM is a fitness app designed for iOS to help users maintain an active lifestyle conveniently from their devices. Whether you're a beginner or a seasoned fitness enthusiast, DailyGYM provides tailored daily exercise routines to fit your skill level and personal goals.

![MainView](https://github.com/user-attachments/assets/6cc5147c-77c3-4e73-86fd-4e95da69a487) ![DailyRoutine](https://github.com/user-attachments/assets/36bf1ab6-43ca-42b1-83a3-2a45cbe449d4) ![ExerciseDaily](https://github.com/user-attachments/assets/a5ddd02d-3363-4b4e-b0e5-df9fc9dba1c5) ![Congrats](https://github.com/user-attachments/assets/c234dcf3-baf0-4afa-930f-0e09a37c7796) ![NewRoutine](https://github.com/user-attachments/assets/e46c0c61-79b4-4ac7-9f26-6abb954bdc53) ![History](https://github.com/user-attachments/assets/b5ae3110-e9e9-4e6b-bb09-0cb7c0d01789) ![Profile](https://github.com/user-attachments/assets/90feb534-00b5-427d-af02-b84eb84a8929)












## Features

- **Daily Routines:** Automatically generated daily exercise routines based on your skills and preferences.
  
   ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 08 43](https://github.com/alexmaxu/DalilyGYM/assets/151617333/47e6c0bb-04a1-4fb4-8688-eecd5592b5d2)

- **Customization:** Ability to create and customize personal workout routines from a wide variety of exercises.
  
   ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 05 32](https://github.com/alexmaxu/DalilyGYM/assets/151617333/9d0cf9b3-a15b-4e80-b385-dbbe62dccfab)

- **User-Friendly Interface:** Intuitive and easy-to-use design for a seamless fitness experience.
  
   ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 03 19](https://github.com/alexmaxu/DalilyGYM/assets/151617333/18cf7c4f-d658-492f-8f3a-8b63c5602e76)

- **Motivation:** Track your progress and stay motivated with built-in features.
  
   ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 11 20](https://github.com/alexmaxu/DalilyGYM/assets/151617333/859f2c3e-bc3c-4941-8ff1-b6c674a54cab)



## Architecture (MVVM)

MVVM is an architecture that clearly separates presentation logic (View) from business logic (ViewModel) and data (Model). 

- **Model:** Defines the "Exercise" struct representing an exercise with the name, type muscle, the intensity lvl, video, It implements Identifiable to uniquely identify each exercise in a list, and so on.

   ![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/9c50fa13-42e8-4542-8aaa-6678dad433d8)

- **ViewModel:** Acts as an intermediary between the View (UI) and the Model (data and business logic) and manages the state of the View. *@Published* is a Property Wrapper SwiftUI and Combine framework. It is used in ViewModels to automatically notify the View when a property changes. This enables reactive UI updates based on data changes.
  
   ![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/c1587e0b-a135-4b7e-b227-88dce9bc2dc3)

- **View:** The view primarily focuses on rendering the user interface and responding to user interactions. In ContentView, it binds to view models to display profile information, daily routines, and exercise lists. It also manages navigation to different views and displays history in a modal sheet based on user actions.

![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/e6a52067-c9ed-45e7-8950-42cbb03902a2)

## Data Persistence

DailyGYM utilizes JSON for data persistence, allowing efficient storage and retrieval of exercise routines. Here's how it works:

- *Encoding and Storage:* Exercise routines are encoded into JSON format using JSONEncoder and stored in the local file system of the application.
- *Data Retrieval:* Upon application launch, DailyGYM checks for previously saved data. If data is found, it is loaded and used; otherwise, it initializes with an empty array.
![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/d4a4209f-770d-448a-966b-21de10d443f1)

This approach ensures users can maintain and customize their exercise routines, even when offline.

## API 

All data we use for the app is obtained from an API. DailyGYM connects to an external API to fetch tailored daily exercises and user profiles. We use URLSession in Swift to make HTTP GET requests to the API, which returns data in JSON format. The received data is decoded using JSONDecoder and used to update the local data models in our application.

![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/f8fa7177-24ef-44cd-a9dd-9830280477a2)
![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/b3c4c4aa-dd52-42ba-b81a-d92f2fd4a37b)

The API accepts query parameters that allow filtering by a list of specific muscles, name, equipment, and more. However, for simplicity and to keep the app intuitive, DailyGYM primarily uses the muscle type query parameter.

I hope you find it interesting!

## Installation

To install DailyGYM, simply clone the repository and run it on your iOS device using Xcode.

## Usage

Launch the App: Open DailyGYM on your iOS device.

Explore and Customize: Browse through daily routines or create your own by selecting exercises that suit your needs.

Stay Active: Follow your chosen routine daily to maintain a healthy lifestyle.

## Feedback

Your feedback is valuable! If you have any suggestions, issues, or feature requests, please submit an issue or contact us through alexmaxu12@gmail.com.

