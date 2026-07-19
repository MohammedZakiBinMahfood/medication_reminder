import 'package:flutter/material.dart';
import '../shared/components/c_app_bar.dart';
import '../shared/components/c_scaffold.dart';
import '../shared/components/c_empty_view.dart';

class HomePlaceholderScreen extends StatelessWidget {
  const HomePlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CScaffold(
      appBar: CAppBar(title: 'Medication Reminder'),
      body: CEmptyView(
        message: 'Foundation Setup Complete\nNo features implemented yet.',
        icon: Icons.check_circle_outline,
      ),
    );
  }
}
