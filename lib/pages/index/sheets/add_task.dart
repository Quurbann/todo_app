import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/widgets/task_category.dart';
import 'package:todo_app/widgets/task_priority.dart';
import 'package:todo_app/widgets/text_fields.dart';


void addGivePriority(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        child: TaskPriority(),
      );
    },
  );
}

void addGiveCategory(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        child: GiveCategory(),
      );
    },
  );
}

Future<DateTime?> chooseDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.dark(
            primary: Colors.deepPurple,
            surface: Color(0xFF2A2A2A),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      );
    },
  );
}

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  Future<void> saveTodo() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];

    tasks.add(
      '${taskController.text}|${descController.text}|$category|$selectedPriority|$categoryBackgroundColor2',
    );

    await prefs.setStringList('tasks', tasks);
  }

  @override
  void dispose() {
    taskController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 26,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: const BoxDecoration(
        color: Color(0xff363636),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          SecondaryTextField(
            hintText: 'Task',
            autofocus: true,
            controller: taskController,
          ),

          const SizedBox(height: 12),

          SecondaryTextField(
            hintText: 'Description',
            autofocus: true,
            controller: descController,
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => chooseDate(context),
                    icon: SvgPicture.asset(
                      'assets/svg/index/index-bottomsheet/timer.svg',
                    ),
                  ),
                  IconButton(
                    onPressed: () => addGiveCategory(context),
                    icon: SvgPicture.asset(
                      'assets/svg/index/index-bottomsheet/tag.svg',
                    ),
                  ),
                  IconButton(
                    onPressed: () => addGivePriority(context),
                    icon: SvgPicture.asset(
                      'assets/svg/index/index-bottomsheet/flag.svg',
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  if (taskController.text.trim().isEmpty) return;
                  await saveTodo();
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  'assets/svg/index/index-bottomsheet/send.svg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
