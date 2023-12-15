import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:new_productive/constants/colors.dart';

import '../../features/tasks/data/models/priority.dart';
import '../../features/tasks/data/models/task.dart';
import '../../features/tasks/presentation/bloc/tasks/tasks_bloc.dart';
import '../../constants/icons.dart';


class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: socialMediaButtonColor,
          border: Border(
            right: BorderSide(
              width: 10,
              style: BorderStyle.solid,
              color: getProperColor(task.priority),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: task.iconColor,
                  ),
                  child: SvgPicture.asset(
                    task.icon,
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: task.isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const Gap(2),
                      Text(
                        '${getProperTime(task.startDate)} - ${getProperTime(task.dueDate)}',
                        style: TextStyle(
                          color: const Color(0xFFABABAB),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          decoration: task.isChecked
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                      context.read<TaskBloc>().add(ToggleTaskCheckedValue(
                        id: task.id,
                      ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 11),
                    child: SvgPicture.asset(task.isChecked == false
                        ? TasksIcons.unChecked
                        : TasksIcons.checked),
                  ),
                ),
              ],
            ),
            if (task.note != null) ...{
              const Gap(8),
              Text(
                task.note!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  decoration: task.isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              )
            }
          ],
        ),
      ),
    );
  }

  String getProperTime(DateTime date) {
    final hour = date.hour;
    final minute = date.minute < 10 ? '0${date.minute}' : '${date.minute}';
    final period = hour < 12 ? 'AM' : 'PM';

    // Convert 24-hour format to 12-hour format
    final formattedHour = hour > 12 ? hour - 12 : hour;

    return '$formattedHour:$minute $period';
  }

  Color getProperColor(Priority priority) {
    switch (priority) {
      case Priority.high:
        return const Color(0xFFFF2752);
      case Priority.medium:
        return const Color(0xFFF6A845);
      case Priority.low:
        return const Color(0xFF44DB4A);
      default:
        return Colors.white;
    }
  }
}

