<h1 align="center">📱 CIBIL Score Card – User Data Collection App</h1>

<p align="center">
  A Flutter-based mobile application to collect user data for creditworthiness scoring (CIBIL Score).
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.10%2B-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/Android%20Studio-Arctic%20Fox%2B-green?logo=android" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-orange?logo=mobile" />
</p>

---

## 🚀 Features

- Clean, scrollable, mobile-friendly UI
- Input validation (name, phone, income, etc.)
- Form sections: Personal, Credit Details
- Designed for use in ML/credit analysis backend systems
- Ready for future API and authentication integration

---

## 🧑‍💻 Tech Stack

| Tool            | Description                       |
|----------------|-----------------------------------|
| **Flutter**     | UI Framework for Mobile           |
| **Dart**        | Programming Language              |
| **Android Studio** | IDE & Emulator for Android Dev  |
| **intl**        | Date formatting                   |


---

## 📦 Dependencies (`pubspec.yaml`)

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.18.1
  provider: ^6.1.1
  http: ^0.13.6
  flutter_form_builder: ^9.1.0
  flutter_spinkit: ^5.2.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
