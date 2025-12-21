# 🏠 Interior Design App

## 📖 Introduction
The Interior Design App is a cross-platform mobile and web application designed to inspire and assist users in visualizing beautiful interior spaces. Whether you're a homeowner looking to redesign your living space, an interior design enthusiast seeking inspiration, or a professional designer, this app provides an intuitive platform to explore, discover, and plan stunning interior designs.

---

## 🎯 Overview
This application serves as a comprehensive interior design companion that combines the power of modern mobile technology with the creativity of interior design. The app leverages cloud-based services to provide real-time content delivery, ensuring users always have access to the latest design trends and ideas.

**Problem Statements:** Finding interior design inspiration is often fragmented across multiple platforms, and visualizing how different design elements work together can be challenging without proper tools.

**Solution:** This app consolidates design inspiration into a single, elegant interface where users can browse curated collections, explore different room styles, and visualize design concepts with an intuitive, user-friendly experience.

---

## ✨ Features
### Core Functionality
- **🎨 Design Gallery:** Browse through a carefully curated collection of interior design inspirations organized by room types, styles, and themes
- **🏡 Room Visualization:** Explore different room layouts and design concepts with high-quality imagery
- **🔍 Smart Search:** Quickly find designs that match your preferences and style
- **❤️ Favorites Collection:** Save and organize your favorite designs for easy reference
- **📱 Responsive Design:** Seamless experience across all screen sizes and devices
- **🌐 Cross-Platform Support:** Available on iOS, Android, Web, Windows, macOS, and Linux
### User Experience
- **🎯 Intuitive Navigation:** Clean, modern UI that makes browsing effortless
- **⚡ Fast Performance:** Optimized loading and smooth animations
- **💾 Offline Capability:** Access your saved designs even without internet
- **🔐 Secure Authentication:** Firebase-powered user authentication
- **☁️ Cloud Sync:** Your data syncs seamlessly across all your devices

---

## 🛠️ My Approach
### 💾 Development Philosophy
The development of this application follows modern Flutter best practices and clean architecture principles to ensure maintainability, scalability, and code quality.
### 🏗️ Architecture Pattern
The app implements a feature-first architecture combined with separation of concerns:
1. Clean Architecture Implementation
   ```bash
   lib/
    ├── core/                 # Core utilities, constants, and themes
    │   ├── constants/        # App-wide constants
    │   ├── themes/          # App theming and styles
    │   └── utils/           # Helper functions and utilities
    ├── data/                # Data layer
    │   ├── models/          # Data models and entities
    │   ├── repositories/    # Repository implementations
    │   └── services/        # API and Firebase services
    ├── features/            # Feature modules
    │   ├── home/           # Home screen feature
    │   ├── gallery/        # Design gallery feature
    │   ├── favorites/      # Favorites management
    │   └── profile/        # User profile feature
    ├── shared/             # Shared widgets and components
    │   ├── widgets/        # Reusable widgets
    │   └── components/     # Custom UI components
    └── main.dart           # Application entry point
This separation ensures maintainability and easier scalability as the app grows.
### 🎯 Key Design Decisions
1. **Modular Architecture:** Each feature is self-contained with its own widgets, logic, and data handling, making the codebase easier to maintain and scale.
2. **State Management:** Utilizes Flutter's built-in state management solutions for optimal performance and simplicity.
3. **Responsive Design:** Implements adaptive layouts that automatically adjust to different screen sizes and orientations.
4. **Firebase Integration:** Leverages Firebase for backend services including authentication, cloud storage, and real-time database capabilities.
5. **Asset Management:** Organized asset structure for efficient image loading and caching.

### 🔄 Development Workflow
- **Version Control:** Git with feature branching
- **Code Quality:** Follows Dart/Flutter style guidelines and linting rules
- **Testing Strategy:** Unit tests for business logic, widget tests for UI components
- **Continuous Integration:** Automated builds and tests

---

## 🔧 Tools and Libraries Used
### Core Technologies
- **Flutter SDK** (3.X+) - UI framework for building natively compiled applications
- **Dart** (3.X+) - Programming language optimized for building mobile, desktop, and web apps

### 🏛️ State Management & Architecture
- **Provider:** State management solution
- **GetX:** Navigation and dependency injection

1. 🔥 Firebase Services
   ```bash
   firebase_core: ^latest          # Firebase core functionality
   firebase_auth: ^latest          # User authentication
   cloud_firestore: ^latest        # NoSQL cloud database
   firebase_storage: ^latest       # Cloud storage for images and files

2. 🎨 UI & Design
   ```bash
   google_fonts: ^latest           # Custom fonts
   cached_network_image: ^latest   # Efficient image loading and caching
   flutter_svg: ^latest            # SVG rendering support
   carousel_slider: ^latest        # Image carousels and sliders
   shimmer: ^latest               # Loading placeholders

3. 🔧 Utilities
   ```bash
   connectivity_plus: ^latest      # Network connectivity detection
   shared_preferences: ^latest     # Local data persistence
   path_provider: ^latest         # File system paths
   image_picker: ^latest          # Image selection from gallery/camera

---

## ⚙️ How It Works
### 📊 Application Flow
1. **Initialization**
   ```bash
   main.dart → Initialize Firebase → Load App Configuration → Render App
- Firebase services are initialized on app startup
- Theme preferences and user settings are loaded
- Authentication state is checked

2. **User Authentication**
   ```bash
   Launch → Check Auth State → Display Home/Login
- If authenticated: Navigate to home screen
- If not authenticated: Show login/signup screen
- Firebase Authentication handles user sessions securely

3. **Data Flow**
   ```bash
   UI Layer → Request Data → Repository → Firebase Service → Cloud Firestore
- User interactions trigger data requests
- Repositories manage data fetching and caching
- Firebase services communicate with the cloud
- Data is processed and returned to the UI

4. **Content Display**
   ```bash
   Fetch Designs → Cache Images → Render UI → User Interaction
- Design data is fetched from Firestore
- Images are cached for optimal performance
- UI updates reactively based on state changes
- User interactions (favorites, shares) update the database

---

## 📱 App Preview
### SignUp Screen
![SignUp_Screen](https://github.com/zoh01/interior_design/blob/f295cc3007eb984f1cc3b72d120d0881027eb9d4/interior_image9.jpg)

### Home Screen
![Home_Screen](https://github.com/zoh01/interior_design/blob/f295cc3007eb984f1cc3b72d120d0881027eb9d4/interior_image1.jpg)

### Profile Screen
![Profile_Screen](https://github.com/zoh01/interior_design/blob/f295cc3007eb984f1cc3b72d120d0881027eb9d4/interior_image2.jpg)

### Store Screen
![Store_Screen](https://github.com/zoh01/interior_design/blob/f295cc3007eb984f1cc3b72d120d0881027eb9d4/interior_image4.jpg)

### Cart Screen
![Cart_Screen](https://github.com/zoh01/interior_design/blob/f295cc3007eb984f1cc3b72d120d0881027eb9d4/interior_image5.jpg)

### Login Screen
![Login_Screen](https://github.com/zoh01/interior_design/blob/f295cc3007eb984f1cc3b72d120d0881027eb9d4/interior_image8.jpg)

### CheckOut Screen
![Cart_Screen](https://github.com/zoh01/interior_design/blob/f295cc3007eb984f1cc3b72d120d0881027eb9d4/interior_image6.jpg)

### Product Screen
![Cart_Screen](https://github.com/zoh01/interior_design/blob/f295cc3007eb984f1cc3b72d120d0881027eb9d4/interior_image3.jpg)

---

## 🚀 Installation
### 📝 Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode / VS Code
- Firebase account with a project set up

### 📊 Setup Instructions
1. Clone the Repository
   ```bash
   git clone https://github.com/zoh01/interior_design.git
   cd interior_design
2. Install Dependencies
   ```bash
   flutter pub get

---

## 🚀 Future Enhancement & Ideas
- 🥽 AR visualization feature for room previews
- 🤖 AI-powered design recommendations
- 📱 Social sharing capabilities
- 🛍️ Designer marketplace
- 🏠 3D room modeling
- 🎨 Color palette generator
- 📦 Material selection tools

---

## 🤝 Contributing
Contributions make the open-source community an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

---

## 👤 Author
**Adebayo Wariz**  

## 📧 Contact
Whatsapp: +234 702 513 6608

Email: adebayozoh@gmail.com

LinkedIn: https://www.linkedin.com/in/adebayo-wariz-a8ab9a310/

GitHub: [https://github.com/zoh01](https://github.com/zoh01)

Project Link: [https://github.com/zoh01/interior_design](https://github.com/zoh01/interior_design)

---

## 📄 License
Distributed under the MIT License. See LICENSE file for more information.
```bash
MIT License

Copyright (c) 2025 [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
