# Upload Metadata Of Files To Firebase

<img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">

This app is to pick a file (Any type of files: pdf, doc, png, jpg, video, audio, etc..) and upload its metadata (name, size, extension, upload date) to Firebase Firestore. And get list of metadata of files from Firebase Firestore.

## Screenshot
<img src="https://github.com/Abdullah-Jacksi/upload-medtadata-files-to-firebase/blob/master/upload_medtadata_firebase/assets/screenshot.jpg" width="300" />

## What has been implemented
The basic features that are fulfilled include:

- [x] As a User I should be able to pick a any type of files from mobile storage.
- [x] As a User I should be able to upload metadata of picked file to Firebase Firestore.
- [x] As a User I should be able to get list of metadata of uploaded files from Firebase Firestore.
- [x] As a User I should be able to see for each metadata of uploaded files the following details:
    * File name.
    * File size.
    * File extension.
    * upload date.

## Folder Structure
```bash
.
├── core
│   ├── constants
│   ├── models
│   ├── services
│   └── view_models
├── ui
│   ├── utils
│   ├── views
│   └── widgets
└── config

```

## Folder Structure explanation
The lib folder is divided into three folders; core, ui, and config. Core contains all the files associated with the logic. Ui contains all the files associated with the ui. Config is for configurations.

* core
    * constants
        * Holds app constants and enums.
    * models
        * Contains all the plain data models.
    * services
        * Contains the classes that interacts directly with an API (REST API or Firebase, a device API).
    * view_models
        * contains a view model for each view which will act as an interface (transforms or manipulates the data that the API provides) between a view and services.

* ui
    * utils
        * Contains functions or constants that are used in multiple other UI files.
    * views
        * Contains the main app screens.
    * widgets
        * Contains widget files that are too big to keep in the view files.
        * Usually contains shared widgets that are classes extending stateless widgets.

* config
    * configuration files for routing, providers, and locators

## Plugins used ##
- intl: ^0.17.0
- provider: ^6.0.2
- file_picker: ^4.5.1
- firebase_core: ^1.14.0
- cloud_firestore: ^3.1.11
- fake_cloud_firestore: ^1.2.2
- mocktail: ^0.2.0

## How to run ##
- Run `flutter packages get` to download pubspec dependencies.
- Run `flutter clean` for most of first run errors you may face.
- Run `flutter test` to execute tests.
- Run `flutter run` to try it live on running emulator or usb connected device.
- You can target a specific device to run by run `flutter devices` and getting the id and running `flutter run -d <device_id>`.
- Run `flutter build apk` to generate APK file.
- Run `flutter build ios` to package iOS app.
  

