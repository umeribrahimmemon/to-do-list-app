import 'package:flutter/material.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ToDoHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDoHomePage extends StatefulWidget {
  @override
  _ToDoHomePageState createState() => _ToDoHomePageState();
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  final TextEditingController _taskController = TextEditingController();
  List<Task> _tasks = [];

  void _addTask() {
    String taskText = _taskController.text.trim();
    if (taskText.isNotEmpty) {
      setState(() {
        _tasks.add(Task(title: taskText));
        _taskController.clear();
      });
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].done = !_tasks[index].done;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List App'),
        backgroundColor: Color(0xFF1B3C53), // your requested color
      ),
      backgroundColor: Color(0xFF1B3C53),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field + Add button row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter a new task',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 65, 182, 19),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // button color
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Task list
            Expanded(
              child: _tasks.isEmpty
                  ? Center(
                      child: Text(
                        'No tasks yet!',
                        style: TextStyle(color: const Color.fromARGB(255, 17, 200, 66)fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              task.title,
                              style: TextStyle(
                                decoration: task.done
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: task.done ? Colors.grey : const Color.fromARGB(255, 22, 207, 81),
                              ),
                            ),
                            onTap: () => _toggleTask(index),
                            onLongPress: () => _deleteTask(index),
                            trailing: Icon(
                              task.done
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: task.done ? Colors.green : null,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  String title;
  bool done;

  Task({required this.title, this.done = false});
}
