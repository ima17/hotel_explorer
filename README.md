# Hotel Explorer

Hotel Explorer is a Flutter application that allows users to explore and view details of hotels. 

## Features

- Display a list of hotels with images, titles, and addresses.
- Show detailed information about each hotel, including a larger image, title, and description.
- Navigate to a map view to see the location of each hotel.
- Handle API requests to fetch hotel data asynchronously.

## Assumptions

- The hotel images are provided as URLs in the response, including both small and large sizes. However, in the provided API URLs, the images were not accessible. Therefore, a placeholder image is used instead.
- To load and cache images efficiently, the `CachedNetworkImage` package is used.
- Facebook authentication is not integrated into this app because Facebook now requires a valid Google Play Store URL and does not allow developer mode package names.

## Getting Started

To run the Hotel Explorer application on your local machine, follow these steps:

1. Make sure you have Flutter installed. If not, refer to the Flutter documentation for installation instructions.

2. Clone the repository:

3. Navigate to the project directory:

4. Install the dependencies:

5. Run the app:

This will launch the Hotel Explorer app on the connected device or emulator.

## Dependencies

The following dependencies are used in this project:

- http: ^1.1.0
- google_maps_flutter: ^2.3.1
- flutter_launcher_icons: ^0.13.1
- cached_network_image: ^3.2.0

Make sure to include these dependencies in your `pubspec.yaml` file and run `flutter pub get` to install them.









