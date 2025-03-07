# RepoRadar

A simple iOS app built with SwiftUI and MVVM, allowing users to search GitHub repositories in real-time using the GitHub Search API.

## Features
- Search for GitHub repositories by name or keyword.
- Displays repository information, including name, description, and owner.
- Built with SwiftUI for the user interface and MVVM architecture for code organization.
- Follows SOLID principles and clean code practices for maintainability.

## Architecture
- **MVVM**: The app uses the Model-View-ViewModel (MVVM) design pattern, where the ViewModel acts as the intermediary between the view and the model.
- **Service Layer**: The app uses a service to manage API requests and data fetching.
- **Dependency Injection (DI)**: DI is used to inject dependencies, improving testability and decoupling components.
- **Clean Code & SOLID**: The app is structured to follow clean code practices and SOLID principles to ensure readability and maintainability.

## Technologies Used
- SwiftUI
- MVVM Architecture
- GitHub Search API
- Dependency Injection (DI)
- Clean Code
- SOLID Principles
- Unit Testing
- Swift

## Dependencies
- SwiftUI
- Combine
- URLSession

## Future Enhancements
- Add pagination for search results.
- Implement detailed view for each repository.
- Allow users to filter search results by language, stars, etc.
