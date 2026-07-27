import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';

class FormDateTile extends StatelessWidget {
  final DateTime? date;
  final String sectionLabel;
  final String? errorText;
  final VoidCallback onTap;
  final bool isClearable;
  final VoidCallback? onClear;

  const FormDateTile({
    super.key,
    required this.date,
    required this.sectionLabel,
    this.errorText,
    required this.onTap,
    this.isClearable = false,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final displayText = date != null
        ? '${date!.day}/${date!.month}/${date!.year}'
        : l10n.selectDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          container: true,
          button: true,
          explicitChildNodes: true,
          label: '$sectionLabel: $displayText',
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: InputDecorator(
              decoration: InputDecoration(
                errorText: errorText,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isClearable && date != null)
                      IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        tooltip: l10n.a11yClearDate,
                        onPressed: onClear,
                      ),
                    const Icon(Icons.calendar_today, size: 18),
                  ],
                ),
              ),
              child: Text(
                displayText,
                style: date != null
                    ? null
                    : TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
