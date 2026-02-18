import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/pages/task_page/task_page.dart';

class TaskInterface extends StatefulWidget {
  TaskInterface({super.key, required this.tasks});

  final List<String> tasks;

  @override
  State<TaskInterface> createState() => _TaskInterfaceState();
}

Map<int, bool> checkedMap = {};

class _TaskInterfaceState extends State<TaskInterface> {
  String date = DateFormat('dd.MM.yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        final parts = widget.tasks[index].split('|');
        final title = parts[0];
        final description = parts.length > 1 ? parts[1] : '';
        final categoryName = parts.length > 2 ? parts[2] : '';
        final priorityLevel =
            parts.length > 3 && parts[3].trim().isNotEmpty && parts[3] != 'null'
            ? parts[3]
            : '';
        final categoryBGColor = parts.length > 4
            ? int.tryParse(parts[4])
            : null;

        return TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TaskPage(
                title: title,
                description: description,
                categoryName: categoryName,
                priorityLevel: priorityLevel,
                categoryBGColor: categoryBGColor,
                index: index,
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xff363636),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: checkedMap[index] ?? false,
                  onChanged: (value) {
                    setState(() {
                      checkedMap[index] = value ?? false;
                    });
                  },
                  shape: CircleBorder(),
                  activeColor: Color(0xff8687E7),
                  checkColor: Colors.white,
                  side: BorderSide(
                    color: Colors.white.withValues(alpha: 0.87),
                    width: 2,
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: .end,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withValues(alpha: 0.87),
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffAFAFAF),
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(categoryBGColor ?? 0xff363636),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/index/index-priority/${categoryName}.svg',
                                  width: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  categoryName,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          priorityLevel.trim().isEmpty
                              ? SizedBox()
                              : Container(
                                  decoration: BoxDecoration(
                                    border: BoxBorder.all(
                                      color: Color(0xff8687E7),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/index/index-bottomsheet/flag.svg',
                                        width: 14,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        priorityLevel,
                                        style: TextStyle(
                                          color: Color(0xffE8E8E8),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
