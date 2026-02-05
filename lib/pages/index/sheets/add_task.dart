import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/widgets/task_category.dart';
import 'package:todo_app/widgets/task_priority.dart';
import 'package:todo_app/widgets/text_fields.dart';

void addGivePriority(BuildContext context, WidgetBuilder builder) {
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

void addGiveCategory(BuildContext context, WidgetBuilder builder) {
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
          colorScheme: ColorScheme.dark(
            primary: Colors.deepPurple,
            surface: Color(0xFF2A2A2A),
            onSurface: Colors.white,
          ),
          datePickerTheme: DatePickerThemeData(
            dayShape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.transparent),
              ),
            ),
            dividerColor: Color(0xff979797),
            cancelButtonStyle: TextButton.styleFrom(
              foregroundColor: Color(0xff8687E7),
            ),
            confirmButtonStyle: TextButton.styleFrom(
              foregroundColor: Color(0xff8687E7),
            ),
            dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.deepPurple;
              }
              return Color(0xff272727);
            }),
          ),
        ),
        child: child!,
      );
    },
  );
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
      decoration: BoxDecoration(
        color: Color(0xff363636),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          SecondaryTextField(hintText: 'Task', autofocus: true),
          SizedBox(height: 12),
          SecondaryTextField(hintText: 'Description', autofocus: true),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: .center,
                children: [
                  IconButton(
                    onPressed: () => chooseDate(context),
                    icon: SvgPicture.asset(
                      'assets/svg/index/index-bottomsheet/timer.svg',
                    ),
                  ),
                  IconButton(
                    onPressed: () => addGiveCategory(context, (context) => GiveCategory()),
                    icon: SvgPicture.asset(
                      'assets/svg/index/index-bottomsheet/tag.svg',
                    ),
                  ),
                  IconButton(
                    onPressed: () => addGivePriority(context, (context) => TaskPriority()),
                    icon: SvgPicture.asset(
                      'assets/svg/index/index-bottomsheet/flag.svg',
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
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
