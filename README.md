# Employee Management App

This is an enhanced version of the Employee Management application, incorporating several new features and improvements:

## New Features and Improvements:

### 1. Enhanced Settings Menu:
- **Notifications Toggle:** Added a switch to enable/disable notifications (placeholder for future implementation).
- **Data Management Section:** Included a placeholder for data management options.
- **Salary Tracking:** Integrated a dedicated screen for tracking employee salaries.
- **Time Off Tracking:** Added a dedicated screen for managing employee time off.
- **About Section:** Provides application information like version and legal details.

### 2. Advanced Employee Filtering and Sorting:
- **Search Functionality:** Implemented a search bar on the employee list screen to filter employees by name, ID, email, and position.
- **Sorting Options:** Added options to sort the employee list by name, ID, salary, and position in ascending or descending order.

### 3. Salary and Paycheck Tracking:
- **Salary Recording:** Users can now add and view salary records for each employee, including amount and date.

### 4. Time Off Tracking:
- **Time Off Recording:** Users can add and view time off records for each employee, including start date, end date, and reason.

### 5. Full English and Arabic Localization:
- All new features and existing text are fully localized for both English and Arabic languages.

### 6. UI/UX Modernization:
- The application's user interface has been updated to provide a more modern and intuitive experience.

## Installation and Setup:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/baitalmalmain/employee-management.git
    cd employee-management
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Generate Hive Adapters and Localization Files:**
    ```bash
    flutter packages pub run build_runner build --delete-conflicting-outputs
    flutter gen-l10n
    ```
4.  **Run the application:**
    ```bash
    flutter run
    ```

## Future Enhancements:

- Implement actual notification functionality.
- Develop comprehensive data management features (backup, restore, export).
- Add more detailed reporting for salary and time off.
- Implement user authentication and role-based access control.
- Cloud synchronization for data.


