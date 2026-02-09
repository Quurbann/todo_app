import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/widgets/task_category.dart';

class TaskInterface extends StatelessWidget {
  TaskInterface({
    super.key,
    required this.tasks,
  });

  final List<String> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final parts = tasks[index].split('|');
          final title = parts[0];
          final description = parts.length > 1 ? parts[1] : '';
          final categoryName = parts.length > 2 ? parts[2] : '';
          final priorityLevel = parts.length > 3 ? parts[3] : '';
    
          return Container(
            margin:
            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xff363636),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // checkbox
                Row(
                  crossAxisAlignment: .end,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withValues(alpha: 0.87),
                          ),
                        ),
                        SizedBox(height: 6,),
                        Text(
                          DateTime.now().toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffAFAFAF)
                          ),
                        ),
                        SizedBox(height: 8,)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: categoryBackgroundColor2,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svg/index/index-priority/${categoryName}.svg', width: 14,),
                              SizedBox(width: 4,),
                              Text(categoryName, style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                        SizedBox(width: 12,),
                        Container(
                          decoration: BoxDecoration(
                            border: BoxBorder.all(color: Color(0xff8687E7), width: 1),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svg/index/index-bottomsheet/flag.svg', width: 14,),
                              SizedBox(width: 4,),
                              Text(priorityLevel, style: TextStyle(color: Color(0xffE8E8E8), fontSize: 12),)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                
              ],
            ),
          );
        },
      );
  }
}