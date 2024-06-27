![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 05 32](https://github.com/alexmaxu/DalilyGYM/assets/151617333/dbc6b522-ca18-421c-a3a5-e705eafa90ac)# DailyGYM App

Hi! My name is Alex, and this is a personal project to improve my skills as an iOS developer. 

## Architecture (MVVM)

MVVM is an architecture that clearly separates presentation logic (View) from business logic (ViewModel) and data (Model). 

- *Model:* Defines the "ExerciseModel" struct representing an exercise with the name, type muscle, the intensity lvl, video, It implements Identifiable to uniquely identify each exercise in a list, and so on.

   ![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/9c50fa13-42e8-4542-8aaa-6678dad433d8)

- *ViewModel:* Acts as an intermediary between the View (UI) and the Model (data and business logic) and manages the state of the View. *@Published* is a Property Wrapper SwiftUI and Combine framework. It is used in ViewModels to automatically notify the View when a property changes. This enables reactive UI updates based on data changes.
  
   ![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/c1587e0b-a135-4b7e-b227-88dce9bc2dc3)

- *View:* The view primarily focuses on rendering the user interface and responding to user interactions. In ContentView, it binds to view models to display profile information, daily routines, and exercise lists. It also manages navigation to different views and displays history in a modal sheet based on user actions.

![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/e6a52067-c9ed-45e7-8950-42cbb03902a2)




## Data Persistence

DailyGYM utilizes JSON for data persistence, allowing efficient storage and retrieval of exercise routines. Here's how it works:

- *Encoding and Storage:* Exercise routines are encoded into JSON format using JSONEncoder and stored in the local file system of the application.
- *Data Retrieval:* Upon application launch, DailyGYM checks for previously saved data. If data is found, it is loaded and used; otherwise, it initializes with an empty array.
![image](https://github.com/alexmaxu/DalilyGYM/assets/151617333/d4a4209f-770d-448a-966b-21de10d443f1)

This approach ensures users can maintain and customize their exercise routines, even when offline.



I hope you find it interesting!

## Overview

DailyGYM is a fitness app designed for iOS to help users maintain an active lifestyle conveniently from their devices. Whether you're a beginner or a seasoned fitness enthusiast, DailyGYM provides tailored daily exercise routines to fit your skill level and personal goals.

## Features

- Daily Routines: Automatically generated daily exercise routines based on your skills and preferences.
  
   ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 08 43](https://github.com/alexmaxu/DalilyGYM/assets/151617333/47e6c0bb-04a1-4fb4-8688-eecd5592b5d2)

- Customization: Ability to create and customize personal workout routines from a wide variety of exercises.
  
   ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 05 32](https://github.com/alexmaxu/DalilyGYM/assets/151617333/9d0cf9b3-a15b-4e80-b385-dbbe62dccfab)

- User-Friendly Interface: Intuitive and easy-to-use design for a seamless fitness experience.
  
   ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 03 19](https://github.com/alexmaxu/DalilyGYM/assets/151617333/18cf7c4f-d658-492f-8f3a-8b63c5602e76)

- Motivation: Track your progress and stay motivated with built-in features.
  
   ![Simulator Screen Recording - iPhone 15 Pro - 2024-06-27 at 10 11 20](https://github.com/alexmaxu/DalilyGYM/assets/151617333/859f2c3e-bc3c-4941-8ff1-b6c674a54cab)

## Why DailyGYM?

Many of us spend long hours in front of screens. DailyGYM aims to simplify fitness by eliminating the guesswork and making it easy to stay active, whether you're at home, at work, or on the go.

## Installation

To install DailyGYM, simply clone the repository and run it on your iOS device using Xcode.

## Usage

Launch the App: Open DailyGYM on your iOS device.

Explore and Customize: Browse through daily routines or create your own by selecting exercises that suit your needs.

Stay Active: Follow your chosen routine daily to maintain a healthy lifestyle.

## Feedback

Your feedback is valuable! If you have any suggestions, issues, or feature requests, please submit an issue or contact us through alexmaxu12@gmail.com.

