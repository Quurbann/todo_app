import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/index/sheets/add_task.dart';
import 'package:todo_app/widgets/task_interface.dart';

void showAddTaskSheet(BuildContext context, VoidCallback onClose) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return AddTask();
    },
  );

  onClose();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = prefs.getStringList('tasks') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              'assets/svg/index/index-appbar/index-label.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Index",
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.87),
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset(
              'assets/png/index-screen/index-appbar/index-action.png',
              width: 42,
              height: 42,
            ),
          ),
        ],
      ),

      body: tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/png/index-screen/index-main/index-main.png",
                    width: screenWidth * 0.6,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "What do you want to do today?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withValues(alpha: 0.87),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Tap + to add your tasks",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withValues(alpha: 0.87),
                    ),
                  ),
                ],
              ),
            )

          : TaskInterface(tasks: tasks),

      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTaskSheet(context, loadTodos),
        backgroundColor: const Color(0xff8687E7),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/bottom-navbar/home-2.svg',
              ),
              label: 'Index',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/bottom-navbar/calendar.svg',
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/bottom-navbar/user.svg',
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}


