
# Flutter E-commerce App

A simple e-commerce app built using Flutter and REST API. The app allows users to browse products, view product details, and manage a cart. It includes a login feature but also allows users to use the app without logging in.

## Features

-   **Product Listing**: Browse a list of products fetched from a REST API.
-   **Product Details**: View detailed information about a product.
-   **Cart Management**: Add or remove items from the cart.
-   **Login**: User authentication with the option to use the app without logging in.
-   **Offline Support**: Monitor network connectivity using `connectivity_plus`.
-   **Smooth Loading**: Shimmer effect during product image loading.

## Dependencies

-   **GetX**: For state management and routing.
-   **get_storage**: For local storage of user data.
-  **http**: For making REST API calls to fetch product data.
-   **connectivity_plus**: To handle network connectivity checks.
-   **cached_network_image**: For efficient image caching.
-   **shimmer**: For loading indicators when content is being fetched.

## SDK Version

-   **Flutter SDK**: ^3.5.1

## Login Information

-   **Username**: `emilys`
-   **Password**: `emilyspass`
-   Alternatively, the app can be used without logging in.

## Setup Instructions

### Prerequisites
-   Flutter SDK: Install Flutter
-   Dart SDK: Ensure Dart is set up with Flutter.

### Steps to Run the Project

1.  **Install dependencies**:

    `flutter pub get`

2.  **Run the app**:

    `flutter run` 
