# User List Flutter App

A simple Flutter application that fetches and displays a list of users from an API. Users can search the list, view details in a bottom sheet, and refresh the data.

---

## Features

* Fetch users from API
* Display users in a minimalist card list
* Search users by **name, email, or company**
* View user details in a **custom bottom sheet**
* Skeleton loading while data loads
* Pull-to-refresh support
* Responsive UI using **ScreenUtil**
* Clean architecture using **GetX**

---

# Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Harsh2548/project_starter.git
cd project_starter
```

---

### 2. Install Dependencies

```bash
flutter pub get
```

---

### 3. Run the Application

```bash
flutter run
```

Make sure a device or emulator is connected.

---

# Packages Used

| Package                          | Purpose                                         |
| -------------------------------- | ----------------------------------------------- |
| **get**                          | State management, dependency injection, routing |
| **dio**                          | API networking                                  |
| **pretty_dio_logger**            | Network request logging                         |
| **flutter_screenutil**           | Responsive UI scaling                           |
| **skeletonizer**                 | Skeleton loading UI                             |
| **get_storage / custom storage** | Local storage for token handling                |
| **sqflite / database_helper**    | Error logging in local database                 |

---

# Project Structure

```
lib/
│
├── app/
│   ├── modules/
│   │   └── home/
│   │       ├── controllers/
│   │       ├── models/
│   │       └── views/
│   │
│   ├── data/
│   │   ├── repository/
│   │   ├── network/
│   │   └── values/
│
├── widgets/
│   ├── cards/
│   ├── bottomsheets/
│   ├── textfield/
│   └── app_bar/
│
├── utils/
│   ├── dataState/
│   └── helpers/
```

---

# API Used

```
https://jsonplaceholder.typicode.com/users
```

This API returns a list of users containing:

* Name
* Email
* Phone
* Website
* Company
* Address

---

# Assumptions Made

1. The API returns a **list of users directly**, not wrapped in a `data` field.
2. Internet connectivity is available when loading users.
3. Search is performed **locally on the fetched list**, not via API.
4. Skeleton loading is displayed while fetching the user list.
5. User details are shown inside a **custom bottom sheet** instead of navigating to another page.
6. Pull-to-refresh reloads the API data.

---

# UX Features

* Minimal card design
* Avatar generated from user initials
* Smooth skeleton loading
* Bottom sheet user details
* Real-time search filtering

---

# Author
Harsh Prakash Tiwari
Flutter Developer
