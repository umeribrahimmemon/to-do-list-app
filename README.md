# to-do-list-app📋 To-Do List App

A simple To-Do List Flutter application that allows users to add, toggle, and delete tasks. Built using Flutter and Material Design.

🚀 Features

✅ Add tasks

🟩 Mark tasks as done/undone

🗑️ Delete tasks by long-press

🧼 Clear input after adding a task

🌙 Dark-themed background (#1B3C53) with a teal accent

📱 Screenshots (Optional)

(You can add screenshots here after running the app)
Example:
![Screenshot](screenshots/home.png)

🛠️ Installation & Run

Clone the repository:

git clone https://github.com/your-username/flutter-todo-app.git
cd flutter-todo-app


Install dependencies:

flutter pub get


Run the app:

flutter run

📁 Project Structure
lib/
├── main.dart        # Main application code

📦 Dependencies

Flutter SDK

Material Design components (built-in)

🧠 How It Works

The app uses a StatefulWidget to manage a list of Task objects.

Each task can be:

Toggled: Tap the task to mark it done/undone.

Deleted: Long-press the task to remove it.

UI uses Flutter widgets like TextField, ElevatedButton, ListView, and ListTile.

🐞 Common Errors

If you’re getting an error like:

Error: 'Task' isn't defined.


✅ Make sure your Task class is defined at the bottom of your main.dart file, like this:

class Task {
  String title;
  bool done;

  Task({required this.title, this.done = false});
}


If you're still seeing issues, try:

flutter clean
flutter pub get
flutter run

📌 TODO (Enhancements you can add)

Persist tasks using local storage (e.g., shared_preferences)

Add categories or due dates

Add animations for list items

Add swipe-to-delete

📄 License

This project is open-source and free to use. Add a license of your choice (MIT, Apache, etc.)
