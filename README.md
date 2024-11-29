# Zarity Blog App

Zarity Blog App is a Flutter application that allows users to browse and read blog posts. The app supports deep linking, enabling users to navigate directly to specific blog posts via URLs.

## Features

- **Blog List**: Displays a list of blog posts fetched from a provider.
- **Search**: Allows users to search for blog posts by title.
- **Blog Details**: Displays detailed information about a selected blog post.
- **Deep Linking**: Supports deep linking to navigate directly to specific blog posts.

## Screenshots

<p align="center">
    <img src="https://github.com/user-attachments/assets/04b9ca72-d62c-46dc-8102-6c54b9b41ee9" width="300" />
    <img src="https://github.com/user-attachments/assets/91b71d05-0920-46d9-8296-4e74fd3e1395" width="300" />
   
</p>


## Workflow!


1. **Main Screen**: The app starts with the `BlogListScreen`, which displays a list of blog posts.
2. **Search**: Users can search for blog posts using the search icon in the app bar. The search functionality is handled by the `BlogSearchDelegate`.
3. **Blog Details**: When a user selects a blog post, they are navigated to the `BlogDetailScreen`, which shows detailed information about the blog post.
4. **Deep Linking**: The app listens for deep links using the `DeepLinkListener` widget. When a deep link is received, the app navigates to the corresponding `BlogDetailScreen`.

## Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/TejasDhole/zarity.git
   cd zarity
   

Video Link:[Click here to visit Google](https://drive.google.com/file/d/1D8SseLJogmIwtWrF1E9hhVZl4jr6UdqK/view?usp=sharing)

## Deep Linking Implementation

In this project, Android App Links are used to navigate to the BlogDetailScreen. Firebase Dynamic Links are no longer operational, so Android App Links are employed for deep linking. The steps to implement deep linking are demonstrated in the video linked above.

The app listens for incoming links and, depending on the link structure, navigates the user to the correct blog post.
