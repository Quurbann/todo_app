import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/providers/add_task_provider.dart';
import 'package:todo_app/widgets/task_category.dart';
import 'package:todo_app/widgets/task_priority.dart';
import 'package:todo_app/widgets/text_fields.dart';

void addGivePriority(BuildContext context) {
  final provider = context.read<AddTaskProvider>();

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return ChangeNotifierProvider.value(
        value: provider,
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            child: TaskPriority(),
        ),
      );
    },
  );
}

void addGiveCategory(BuildContext context) {
  final provider = context.read<AddTaskProvider>();

  showDialog(
    context: context,
    builder: (_) {
      return ChangeNotifierProvider.value(
        value: provider,
        child: Dialog(
          child: GiveCategory(),
        ),
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

Future<void> saveTodo(
  String title,
  String description,
  String category,
  String priority,
  int categoryColor,
) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> tasks = prefs.getStringList('tasks') ?? [];

  tasks.add('$title|$description|$category|$priority|$categoryColor');

  await prefs.setStringList('tasks', tasks);
}

class AddTask extends StatelessWidget {
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
            onChanged: (value) =>
                context.read<AddTaskProvider>().setTitle(value),
          ),

          const SizedBox(height: 12),

          SecondaryTextField(
            hintText: 'Description',
            autofocus: false,
            onChanged: (value) =>
                context.read<AddTaskProvider>().setDescription(value),
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
                  final provider = context.read<AddTaskProvider>();

                  if (provider.title.trim().isEmpty) return;

                  await saveTodo(
                    provider.title,
                    provider.description,
                    provider.categoryName,
                    provider.selectedPriority,
                    provider.categoryBGColor.value,
                  );

                  provider.clear();
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
