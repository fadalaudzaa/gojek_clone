
# Gojek Clone App 🚗

A Flutter application that replicates the Gojek app UI.
|Preview 1| Preview 2 | Preview 3 |
|--|--|--|
![Gojek Clone UI_1](https://raw.githubusercontent.com/fadalaudzaa/gojek_clone/refs/heads/main/screenshot/ss1.png)| ![Gojek Clone UI_2](https://raw.githubusercontent.com/fadalaudzaa/gojek_clone/refs/heads/main/screenshot/ss2.png) | ![Gojek Clone UI_3](https://raw.githubusercontent.com/fadalaudzaa/gojek_clone/refs/heads/main/screenshot/ss3.png) |  |

## 📱 Description

This project is a UI clone of the Gojek app, built using Flutter. It includes:

- Home screen with search bar scrolling effect
- Promotional banner
- Wallet card with balance and action buttons
- Main service grid with icons/badges
- Product cards
- Promo content cards
- Rating card for driver feedback
- Bottom navigation bar


## 🚀 Getting Started


### Prerequisites

- Flutter SDK

- Dart SDK

- Android Studio / VS Code with Flutter extensions

### Installation


1. Clone the repository
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## 📂 Project Structure


```
lib/
├── constants/
│ └── app_constants.dart
├── screens/
│ └── home_screen.dart
├── widgets/
│ ├── bottom_nav_bar.dart
│ ├── driver_rating_card.dart
│ ├── main_service_card.dart
│ ├── product_card.dart
│ ├── product_list.dart
│ ├── promo_content_card.dart
│ ├── search_bar_widget.dart
│ ├── services_grid.dart
│ ├── small_discount_card.dart
│ └── wallet_card.dart
└── main.dart

```

## 🧩 UI Components

### 💳 Wallet Card (Saldo)

The wallet card displays the user's balance and coins, along with action buttons for payments, top-ups, and more options.

### 🔍 Main Service Grid

The service grid displays the main Gojek services with icons, labels, and promotional badges in a 4-column grid.

### 🛒 Product Cards

Product cards display items available for purchase, including product name, description, price, and promotional badges *(horizontally scrollable)*

### 🎯 Promo Content Cards

Larger promotional cards that include a banner, title, and subtitle.

### 🧭 Bottom Navigation Bar

The bottom navigation bar provides access to the main app sections: Home, Promos, Activity, and Chat *(currently only the home page is implemented hehe)*


## 📝 Notes

- This is a UI clone only, with no actual backend functionality

- The images are not included in the repository, you need to add them manually

- To add images, add an image to the assets folder, update the pubspec.yaml, and input the path on home_screen.dart

- All icons are provided by Material Icons 🫶

-  *pardon me for the excess amount of drop shadows T_T*