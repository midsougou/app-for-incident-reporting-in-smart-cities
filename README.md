
# Incident Reporting - Mobile Application with Flutter

## Description

The **Incident Reporting** application is a mobile app developed using the Flutter SDK. It allows users to report issues occurring in their regions, such as faulty traffic lights, overturned trash bins, and more. The application utilizes the Google Maps API to let users select the incident's location on an interactive map.

## Key Features

- **Authentication**: Users can log in or create a new account to access the app's features.
- **Incident Reporting**: Users can report an incident by selecting the location on the map, the severity of the incident, the type of incident, the date, and providing a detailed description.
- **Image Upload**: Users can upload an image to accompany their incident report.
- **Dashboards and Reporting**: Dashboards and reports are available for administrators to monitor reported incidents and provide statistics on the most common types of incidents and their locations. These were developed using `Google Locker Studio`.

## Prerequisites

- Flutter SDK
- IDE (e.g., Android Studio or Visual Studio Code)
- Google Maps API Key (to use the interactive map)

## Installation

1. Clone this repository to your local machine.
2. Ensure the Flutter SDK is installed and configured on your system.
3. Configure your Google Maps API Key by following the instructions provided by Google.
4. Add your Google Maps API Key to the file `android/app/src/main/AndroidManifest.xml`:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY" />
```

## Running the Project

1. Start your emulator or connect your Android device to your computer.
2. Open the project in your preferred IDE (Android Studio or Visual Studio Code).
3. Run the following command to install dependencies:

```bash
flutter pub get
```

Then, run the application with the command:

```bash
flutter run
```

The `.dart` files and widgets are available in the `lib` folder. The application is compatible with the web, Android, and iOS. The server used to host the application is [000webhost](https://www.000webhost.com/).

## Future Work

To enhance the "Incident Reporting" application and provide advanced features, we could integrate artificial intelligence. For example, developing a computer vision model capable of automatically recognizing the type of incident from the image uploaded by the user. This would allow automatic completion of the incident report form and improve the detection of the incident's severity.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
