import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/add_task_provider.dart';
import 'package:todo_app/widgets/primary_button.dart';

class TaskPriority extends StatelessWidget {
  TaskPriority({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddTaskProvider>();
    final currentPriority =
        provider.selectedPriority.isNotEmpty ? int.tryParse(provider.selectedPriority) : null;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff363636),
        borderRadius: BorderRadius.circular(1),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Task Priority',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white.withValues(alpha: 0.87),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xff979797), height: 1),
          const SizedBox(height: 22),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(10, (index) {
              final priority = index + 1;
              return PriorityField(
                priorityLevel: priority.toString(),
                isSelected: currentPriority == priority,
                onTap: () {
                  provider.setPriority(priority.toString());
                },
              );
            }),
          ),

          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: "Cancel",
                  backgroundColor: Colors.transparent,
                  textColor: Colors.white.withValues(alpha: 0.5),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  text: "Save",
                  backgroundColor: const Color(0xff8687E7),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context, provider.selectedPriority);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PriorityField extends StatelessWidget {
  final String priorityLevel;
  final bool isSelected;
  final VoidCallback onTap;

  const PriorityField({
    super.key,
    required this.priorityLevel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff8687E7) : const Color(0xff272727),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svg/index/index-bottomsheet/flag.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 6),
            Text(
              priorityLevel,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
