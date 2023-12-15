import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:new_productive/constants/icons.dart';
import 'package:new_productive/core/data/loading_status.dart';
import 'package:new_productive/features/tasks/presentation/pages/drawer.dart';
import 'package:new_productive/features/tasks/presentation/pages/notes.dart';

import '../../../constants/colors.dart';
import '../../../core/widgets/task_widget.dart';
import '../data/repository/tasks.dart';
import 'bloc/tasks/tasks_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(repository: TaskRepository()),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              drawer: const DrawerMenu(),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                toolbarHeight: 116,
                title: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: SvgPicture.asset(TasksIcons.hamburger),
                            );
                          }),
                          const Spacer(),
                          Builder(
                              builder: (context) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => const NotesPage()));
                                    },
                                    child: SvgPicture.asset(TasksIcons.note));
                              }
                          ),

                          const SizedBox(width: 24),
                          SvgPicture.asset(TasksIcons.notification),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        cursorColor: cursorColor,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(color: white),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: textFieldBackgroundColor),
                            ),

                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 44, vertical: 13.5),
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              TasksIcons.search,
                            ),
                          ),
                          suffixIcon: Container(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(TasksIcons.filter),
                          ),
                          filled: true,
                          fillColor: textFieldBackgroundColor,
                          hintText: 'Search by events, tasks.. ',
                          hintStyle: Theme.of(context).textTheme.labelSmall,

                        ),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  controller: tabController,
                  indicatorColor: activeColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: white,
                  unselectedLabelColor: Colors.grey,
                  tabs:  const [
                    Tab(child: Text("Upcoming",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)
                    )),
                    Tab(child: Text("All",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)
                    )),
                  ],
                ),
              ),
              body: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state){
                  switch (state.status) {
                    case LoadingStatus.pure:
                      context.read<TaskBloc>().add(LoadTasks());
                      return const SizedBox();
                    case LoadingStatus.loading:
                      return const Center(child: CupertinoActivityIndicator());
                    case LoadingStatus.loadedWithSuccess:
                      return TabBarView(
                        controller: tabController,
                        children: [
                          ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                            itemBuilder: (_, index) =>
                                TaskItem(task: state.upcomingTasks[index]),
                            separatorBuilder: (_, __) => const Gap(16),
                            itemCount: state.upcomingTasks.length,
                          ),
                          ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                            itemBuilder: (_, index) =>
                                TaskItem(task: state.allTasks[index]),
                            separatorBuilder: (_, __) => const Gap(16),
                            itemCount: state.allTasks.length,
                          )
                        ],
                      );
                    case LoadingStatus.loadedWithFailure:
                      return const SizedBox();
                    default:
                      return const SizedBox();
                  }
                },
              )

            ),
          );
        }
      ),
    );
  }
}
