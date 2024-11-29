class Task {
  String title;
  String? description;
  bool isCompleted;
  DateTime? dueDate; // Add dueDate field

  Task({
    required this.title,
    this.description,
    this.isCompleted = false,
    this.dueDate, // Initialize it as nullable
  });

  // Convert a Task to JSON
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'isCompleted': isCompleted,
        'dueDate': dueDate?.toIso8601String(), // Save as ISO string
      };

  // Convert JSON to a Task
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'],
        description: json['description'],
        isCompleted: json['isCompleted'],
        dueDate:
            json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      );
}
