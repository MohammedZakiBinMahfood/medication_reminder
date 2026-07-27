import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/c_app_bar.dart';
import '../../../../shared/components/c_card.dart';
import '../../../../shared/components/c_scaffold.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final theme = Theme.of(context);

    return CScaffold(
      appBar: CAppBar(title: l10n.settingsPrivacyPolicy),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Banner
            CCard(
              padding: const EdgeInsets.all(16),
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
              child: Row(
                children: [
                  Icon(
                    Icons.shield_outlined,
                    size: 36,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isArabic
                              ? 'خصوصيتك هي أولويتنا المطلقة'
                              : 'Your Privacy is Our Top Priority',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isArabic
                              ? 'جميع بياناتك الدوائية والشخصية مخزنة على جهازك المحمول فقط وبأمان كامل.'
                              : 'All your personal and medication data is stored locally on your device only.',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Section 1: Local Storage
            _PolicySection(
              icon: Icons.storage_outlined,
              title: isArabic
                  ? '1. تخزين البيانات محلياً (100% Local Data Storage)'
                  : '1. 100% Local Data Storage',
              body: isArabic
                  ? 'تطبيق "مداوي" يعمل بشكل محلي بالكامل. جميع أسماء الأدوية، التواريخ، التنبيهات، والملفات الشخصية تُحفظ على ذاكرة هاتفك فقط باستخدام تقنيات تشفير محلية آمنة. نحن لا نقوم بنقل أو رفع أي من بياناتك الصحية أو الشخصية إلى أي خوادم سحابية خارجية.'
                  : 'Mudawy operates completely locally. All medication names, dates, reminders, and profiles are saved exclusively on your device storage. We do not transmit or upload any of your health or personal data to any external cloud servers.',
            ),

            const SizedBox(height: 12),

            // Section 2: Permissions Usage
            _PolicySection(
              icon: Icons.security_outlined,
              title: isArabic
                  ? '2. استخدام الأذونات والصلاحيات'
                  : '2. Usage of Device Permissions',
              body: isArabic
                  ? 'يطلب التطبيق أذونات محددة لغرض تقديم الخدمة الأساسية فقط:\n'
                        '• الإشعارات (Notifications): لإرسال تذكيرات دقيقة بمواعيد الجرعات الدوائية.\n'
                        '• الكاميرا والمعرض (Camera & Gallery): لالتقاط أو اختيار صور الأدوية لتمييزها بصرياً، وتُحفظ هذه الصور محلياً على جهازك فقط.'
                  : 'The app requests specific permissions solely for core functionality:\n'
                        '• Notifications: To deliver precise dose reminders.\n'
                        '• Camera & Photo Gallery: To capture or select medication photos for visual identification, saved strictly on your local device.',
            ),

            const SizedBox(height: 12),

            // Section 3: Third Party & Analytics
            _PolicySection(
              icon: Icons.no_accounts_outlined,
              title: isArabic
                  ? '3. عدم مشاركة البيانات مع أطراف ثالثة'
                  : '3. Zero Third-Party Sharing',
              body: isArabic
                  ? 'نحن لا نبيع، لا نؤجر، ولا نشارك بياناتك مع أي شركات إعلانية أو أطراف ثالثة نهائياً. التطبيق خالي من أي برمجيات تتبع سري أو إعلانات تستهدف بياناتك الشخصية.'
                  : 'We do not sell, rent, or share your personal data with any advertising companies or third parties. The app is free of hidden tracking software or targeted ads.',
            ),

            const SizedBox(height: 12),

            // Section 4: Data Erasure & Ownership
            _PolicySection(
              icon: Icons.delete_forever_outlined,
              title: isArabic
                  ? '4. ملكية البيانات والحذف الكامل'
                  : '4. Full Data Control & Erasure',
              body: isArabic
                  ? 'لك الحق الكامل في التحكم ببياناتك. يمكنك تعديل أو حذف أي دواء، ملف شخصي، أو سجل في أي وقت. عند إزالة التطبيق من جهازك، يتم مسح جميع البيانات المخزنة نهائياً وبشكل تلقائي.'
                  : 'You maintain absolute ownership of your data. You can edit or delete any medication, profile, or history log at any time. Uninstalling the app permanently deletes all stored data.',
            ),

            const SizedBox(height: 12),

            // Section 5: Contact Support
            _PolicySection(
              icon: Icons.mail_outline,
              title: isArabic
                  ? '5. التواصل والاستفسارات'
                  : '5. Contact & Support',
              body: isArabic
                  ? 'إذا كانت لديك أي استفسارات أو أسئلة حول سياسة الخصوصية وحماية البيانات، يمكنك التواصل معنا مباشرة من قسم (تواصل مع المطور) في إعدادات التطبيق.'
                  : 'If you have any questions regarding our privacy policy or data security, feel free to contact us via the (Contact Developer) section in Settings.',
            ),

            const SizedBox(height: 24),
            Center(
              child: Text(
                isArabic ? 'آخر تحديث: يوليو 2026' : 'Last Updated: July 2026',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _PolicySection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _PolicySection({
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
