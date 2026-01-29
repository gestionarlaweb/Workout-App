import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/workout_provider.dart';
import '../widgets/workout_day_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MI RUTINA',
            style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2),
          ),
          centerTitle: true,
          actions: [
            Consumer<WorkoutProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: provider.isSaving
                        ? const Icon(
                            Icons.save_as,
                            key: ValueKey('saving'),
                            color: Colors.greenAccent,
                            size: 28,
                          )
                        : const SizedBox.shrink(key: ValueKey('not_saving')),
                  ),
                );
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.orangeAccent,
            indicatorWeight: 4,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'DÍA 1'),
              Tab(text: 'DÍA 2'),
              Tab(text: 'DÍA 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WorkoutDayList(day: 1),
            WorkoutDayList(day: 2),
            WorkoutDayList(day: 3),
          ],
        ),
      ),
    );
  }
}
