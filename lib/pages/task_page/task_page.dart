import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/widgets/task_interface.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    super.key,
    this.title,
    this.description,
    this.categoryName,
    this.priorityLevel,
    this.categoryBGColor,
    this.index,
  });

  final title;
  final description;
  final categoryName;
  final priorityLevel;
  final categoryBGColor;
  final index;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xff1D1D1D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(4),
                      ),
                    ),
                    icon: Icon(
                      Icons.close,
                      color: Colors.white.withValues(alpha: 0.87),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xff1D1D1D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(4),
                      ),
                    ),
                    icon: Icon(
                      Icons.repeat,
                      color: Colors.white.withValues(alpha: 0.87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Checkbox(
                        value: checkedMap[widget.index] ?? false,
                        onChanged: (value) {
                          setState(() {
                            checkedMap[widget.index] = value ?? false;
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
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          SizedBox(height: 8),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.35,
                            ),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withValues(alpha: 0.87),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            widget.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffAFAFAF),
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white.withValues(alpha: 0.87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 38),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    TaskPageContainer(
                      icon: 'assets/svg/index/index-bottomsheet/timer.svg',
                      name: 'Task Time',
                      title: 'Todat at 16:15',
                      logo: '',
                    ),
                    SizedBox(height: 30),
                    TaskPageContainer(
                      icon: 'assets/svg/index/index-bottomsheet/tag.svg',
                      name: 'Task Category',
                      title: widget.categoryName,
                      logo: widget.categoryName,
                    ),
                    SizedBox(height: 30),
                    TaskPageContainer(
                      icon: 'assets/svg/index/index-bottomsheet/flag.svg',
                      name: 'Task Priority',
                      title: widget.priorityLevel,
                      logo: 'flag',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskPageContainer extends StatelessWidget {
  final String name;
  final String icon;
  final String? logo;
  final String title;

  const TaskPageContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.logo,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.87),
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.21),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              if (logo != null && logo != '')
                SvgPicture.asset(
                  'assets/svg/index/index-priority/$logo.svg',
                  width: 24,
                ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(color: Colors.white.withValues(alpha: 0.87)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
