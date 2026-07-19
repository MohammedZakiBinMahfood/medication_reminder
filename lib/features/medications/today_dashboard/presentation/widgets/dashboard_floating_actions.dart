import 'package:flutter/material.dart';

class DashboardFloatingActions extends StatelessWidget {
  final VoidCallback onAddMedication;

  const DashboardFloatingActions({super.key, required this.onAddMedication});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onAddMedication,
      child: const Icon(Icons.add),
    );
  }
}
