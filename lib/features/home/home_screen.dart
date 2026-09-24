import 'package:flutter/material.dart';
import '../../core/l10n/app_localization.dart';
import '../../core/models/task_model.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../add_task/add_task_screen.dart';
import 'widgets/status_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskItem> _tasks(AppLocalizations t) {
    return [
      TaskItem(
        titleKey: t.flutterUi,
        subtitleKey: t.buildRegisterScreen,
        status: TaskStatus.pending,
        color: AppColors.blue,
        icon: Icons.phone_iphone_rounded,
      ),
      TaskItem(
        titleKey: t.workout,
        subtitleKey: t.gymAt6pm,
        status: TaskStatus.done,
        color: AppColors.green,
        icon: Icons.fitness_center_rounded,
      ),
      TaskItem(
        titleKey: t.meeting,
        subtitleKey: t.teamSync,
        status: TaskStatus.inProgress,
        color: AppColors.orange,
        icon: Icons.groups_rounded,
      ),
      TaskItem(
        titleKey: t.readBook,
        subtitleKey: t.atomicHabits,
        status: TaskStatus.pending,
        color: AppColors.purple,
        icon: Icons.menu_book_rounded,
      ),
    ];
  }

  int _doneCount(List<TaskItem> tasks) {
    return tasks
        .where((task) => task.status == TaskStatus.done)
        .length;
  }

  int _pendingCount(List<TaskItem> tasks) {
    return tasks
        .where((task) => task.status != TaskStatus.done)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final tasks = _tasks(t);

    final int crossAxisColumns = context.isTablet ? 2 : 1;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddTaskScreen(),
            ),
          );
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          t.task,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SafeArea(
        child: ResponsiveCenter(
          maxWidth: 720,
          child: CustomScrollView(
            slivers: [

              // Header + Statistic
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  context.hPadding,
                  16,
                  context.hPadding,
                  0,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                    children: [
                      // Header
                      Row(
                        children: [
                          CircleAvatar(
                            radius: context.sp(22),
                            backgroundColor:
                                const Color(0xFFE7E9F7),
                            child: Icon(
                              Icons.person,
                              color: AppColors.primary,
                              size: context.sp(24),
                            ),
                          ),

                          SizedBox(
                            width: context.sp(12),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  t.goodMorning,
                                  style: TextStyle(
                                    fontSize: context.sp(13),
                                    color:
                                        AppColors.textSecondary,
                                  ),
                                ),

                                Text(
                                  widget.userName.isEmpty
                                      ? '—'
                                      : widget.userName,
                                  maxLines: 1,
                                  overflow:
                                      TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: context.sp(18),
                                    fontWeight: FontWeight.w700,
                                    color:
                                        AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding:
                                const EdgeInsets.all(10),
                            decoration:
                                const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons
                                  .notifications_none_rounded,
                              color:
                                  AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: context.sp(20),
                      ),

                      // Statistics Card
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: context.sp(20),
                          horizontal: context.sp(12),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            _StatColumn(
                              value: '${tasks.length}',
                              label: t.tasks,
                            ),

                            _statDivider(),

                            _StatColumn(
                              value:
                                  '${_doneCount(tasks)}',
                              label: t.done,
                            ),

                            _statDivider(),

                            _StatColumn(
                              value:
                                  '${_pendingCount(tasks)}',
                              label: t.pending,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: context.sp(24),
                      ),

                      Text(
                        t.todaysTasks,
                        style: TextStyle(
                          fontSize: context.sp(17),
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      SizedBox(
                        height: context.sp(12),
                      ),
                    ],
                  ),
                ),
              ),

              // Tasks
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  context.hPadding,
                  0,
                  context.hPadding,
                  100,
                ),
                sliver: SliverGrid(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisColumns,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio:
                        crossAxisColumns == 1
                            ? 3.6
                            : 2.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _TaskCard(
                        task: tasks[index],
                      );
                    },
                    childCount: tasks.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statDivider() {
    return Container(
      width: 1,
      height: 32,
      color: Colors.white24,
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
    );
  }
}

// =====================================================
// Statistics Column
// =====================================================

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.sp(22),
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(
            height: context.sp(2),
          ),

          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: context.sp(12),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// Task Card
// =====================================================

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.task,
  });

  final TaskItem task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        context.sp(14),
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Colored line
          Container(
            width: 4,
            height: 42,
            decoration: BoxDecoration(
              color: task.color,
              borderRadius:
                  BorderRadius.circular(4),
            ),
          ),

          SizedBox(
            width: context.sp(12),
          ),

          // Task information
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  task.titleKey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: context.sp(15),
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                Text(
                  task.subtitleKey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: context.sp(12.5),
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(
                  height: context.sp(6),
                ),

                StatusBadge(
                  status: task.status,
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}