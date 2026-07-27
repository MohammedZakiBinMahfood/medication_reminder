import 'package:flutter/material.dart';
import '../../../../../core/utils/time_formatter.dart';

class FormTimeTile extends StatelessWidget {
  final int minutesFromMidnight;
  final VoidCallback onTap;

  const FormTimeTile({
    super.key,
    required this.minutesFromMidnight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final displayText = AppTimeFormatter.formatMinutesFromMidnight(
      minutesFromMidnight,
      isArabic: isArabic,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          container: true,
          button: true,
          label: displayText,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: InputDecorator(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.access_time, size: 18),
              ),
              child: Text(displayText),
            ),
          ),
        ),
      ],
    );
  }
}
