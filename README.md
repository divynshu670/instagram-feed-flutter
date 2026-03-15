# Instagram Pixel-Perfect Feed (Flutter UI/UX Challenge)

A Flutter implementation of the **Instagram Home Feed** focused on **visual fidelity, smooth scrolling performance, and clean architecture**.

The goal of this project is to replicate the Instagram feed while demonstrating good Flutter practices such as **state management, pagination, caching, and gesture handling**.

---

## Architecture Overview

The project follows a **clean separation of concerns** to keep the codebase maintainable and scalable.

```
lib/
│
├── data/
│   ├── model/
│   │   ├── post.dart
│   │   └── story.dart
│   │
│   └── repositories/
│       ├── post_repository.dart
│       └── story_repository.dart
│
├── providers/
│   └── feed_provider.dart
│
├── presentation/
│   └── feed_screen.dart
│
├── widgets/
│   ├── post_widget.dart
│   ├── stories_tray.dart
│   ├── story_item.dart
│   ├── pinch_zoom_overlay.dart
│   ├── shimmer_post.dart
│   ├── shimmer_story.dart
│   └── instagram_bottom_bar.dart
│
└── theme/
    ├── light_theme.dart
    └── dark_theme.dart
```

---

## State Management Choice

This project uses **Provider** for state management.

Provider was chosen because:

* It is lightweight and easy to understand
* Officially recommended by the Flutter team
* Built on top of `InheritedWidget` for efficient rebuilds
* Works well for medium-sized applications
* Keeps UI and business logic separated

### FeedProvider Responsibilities

`FeedProvider` is responsible for:

* Fetching posts and stories
* Managing pagination
* Handling loading states
* Updating UI via `notifyListeners()`

This ensures that the UI reacts automatically when data changes.

---

## Data Layer

Instead of hardcoding UI data, the project uses a **repository layer**.

Repositories simulate real API behavior by:

* Returning `Future` responses
* Adding artificial network delay
* Generating mock post data

This approach makes it easier to replace the mock repository with a real backend later.

---

## Performance Considerations

To ensure smooth scrolling and good performance:

* `cached_network_image` is used for image caching
* Pagination loads posts lazily
* Shimmer placeholders improve perceived loading performance
* Pinch-to-zoom uses an overlay to avoid layout rebuilds

---

## How to Run the Project

### 1️⃣ Clone the repository

```bash
git clone https://github.com/yourusername/instagram-feed-flutter.git
```

### 2️⃣ Navigate to the project directory

```bash
cd instagram-feed-flutter
```

### 3️⃣ Install dependencies

```bash
flutter pub get
```

### 4️⃣ Run the application

```bash
flutter run
```

---

## Demo

The demo video includes:

* Shimmer loading state
* Smooth infinite scrolling
* Pinch-to-zoom interaction
* Like and Save toggle interactions

---

## Dependencies Used

```
provider
cached_network_image
shimmer
flutter_feather_icons
```

---

## Notes

* Images are loaded from public URLs to avoid bundling assets.
* Mock repositories simulate API latency.
* The focus of this challenge is **quality over quantity**, emphasizing smooth interactions and UI precision.

---

## Author

**Divyanshu Kumar**
