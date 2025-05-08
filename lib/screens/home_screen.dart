import 'package:flutter/material.dart';
import '../models/routine_item.dart';
import '../widgets/routine_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<RoutineItem> _items = [
    RoutineItem(title: 'Brush Teeth'),
    RoutineItem(title: 'Read a Book'),
    RoutineItem(title: 'Meditate'),
    RoutineItem(title: 'Plan Tomorrow'),
    RoutineItem(title: 'Skincare'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Night Routine Tracker'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.grey),
        itemBuilder: (context, index) {
          final item = _items[index];
          return RoutineTile(
            item: item,
            onChanged: (done) {
              setState(() {
                item.isDone = done;
              });
            },
          );
        },
      ),
    );
  }
}
