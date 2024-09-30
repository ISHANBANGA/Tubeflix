# TubeFlix

**TubeFlix** is an online streaming platform designed as an example of popular streaming services like Netflix. The platform allows users to stream movies and TV shows, manage their accounts, and create personalized wishlists for future viewing.

## Project Overview

TubeFlix is built using **ASP.NET MVC** with **C#** and **.aspx pages**. It utilizes **Microsoft SQL Server** to manage user data, including account details and wishlist items. The website features a user-friendly interface for browsing content, logging in, and managing personal preferences. 

### Key Features

- **User Registration and Login**: Users can create accounts, log in, and securely manage their profiles.
- **Wishlist Functionality**: Users can add movies and TV shows to their wishlist, which is saved in the database. Each time they log in, their wishlist data is retrieved, allowing for a personalized experience.
- **Session Management**: The platform uses session management to maintain user sessions while browsing, keeping track of logged-in users and their wishlist.
- **Database Integration**: The website uses **Microsoft SQL Server** to store user credentials, wishlist data, and other relevant information.

## Technologies Used

- **ASP.NET MVC** (Model-View-Controller architecture)
- **C#** for backend logic
- **Microsoft SQL Server** for database management
- **.aspx pages** for the front-end interface
- **Session Management** for maintaining user sessions
- **HTML/CSS/JavaScript** for frontend design and functionality

## Features Breakdown

### User Authentication
- **Sign-up and Login**: Users can create new accounts and securely log in to access their personalized experience.
- **Password Security**: Secure handling of user credentials through proper encryption and validation.
- **User Authentication**: Secure login and registration functionality that ensures user data privacy and integrity.
- **Dynamic Content Catalog**: A vast library of movies and TV shows that users can browse through. The catalog includes detailed descriptions, genres, ratings, and thumbnails for each title.
- **Personalized Watchlists**: Users can create and manage personalized watchlists, adding or removing content as per their preferences.
- **Responsive Design**: Optimized for various devices, providing a seamless viewing experience on phones, tablets, and desktops.
- **Session Management**: Maintains user session for continuous play and personalized user experience across different devices.

### Wishlist
- **Add to Wishlist**: Users can add specific content (movies, TV shows) to their wishlist for future reference.
- **Persistent Storage**: Wishlist data is stored in the SQL Server database and retrieved whenever the user logs in.

### Session Management
- **Session Handling**: The website keeps track of user sessions to maintain a seamless browsing experience. User data, including their login status and wishlist, is stored using session variables.

### Technical Specifications
- **Backend**: Developed with ASP.NET MVC, which handles routing, URL mapping, and server-side logic.
- **Database**: Utilizes Microsoft SQL Server for robust data management and storage solutions. The database schema supports complex queries for searching, inserting, and managing content efficiently.
- **Frontend**: Employs .aspx pages integrated with backend logic to render dynamic content. JavaScript is used to enhance interactivity and CSS for styling, ensuring a modern and intuitive user interface.
- **Security**: Implements standard security measures including data encryption, XSS prevention, and CSRF protection to safeguard user data and interactions.
