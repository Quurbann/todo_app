class Task {
  final String title;
  final String description;
  final String category;
  final String priority;
  final int colorValue;

  Task({
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.colorValue,
  });

  String toStorageString() {
    return '$title|$description|$category|$priority|$colorValue';
  }

  factory Task.fromStorageString(String data) {
    final parts = data.split('|');
    return Task(
      title: parts[0],
      description: parts[1],
      category: parts[2],
      priority: parts[3],
      colorValue: int.parse(parts[4]),
    );
  }
}
