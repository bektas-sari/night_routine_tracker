import 'package:flutter/material.dart';
import '../models/routine_item.dart';

class RoutineTile extends StatefulWidget {
  final RoutineItem item;
  final ValueChanged<bool> onChanged;

  const RoutineTile({
    super.key,
    required this.item,
    required this.onChanged,
  });

  @override
  State<RoutineTile> createState() => _RoutineTileState();
}

class _RoutineTileState extends State<RoutineTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacity = Tween<double>(begin: 0.2, end: 1.0).animate(_controller);
    if (widget.item.isDone) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant RoutineTile old) {
    super.didUpdateWidget(old);
    if (widget.item.isDone) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.item.title),
      value: widget.item.isDone,
      onChanged: (val) {
        widget.onChanged(val);
      },
      secondary: FadeTransition(
        opacity: _opacity,
        child: const Icon(Icons.check_circle, size: 28),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
