import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/database_provider.dart';
import '../../providers/auth_provider.dart';

class SystemNotificationListener extends ConsumerWidget {
  final Widget child;

  const SystemNotificationListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    if (authState.isAuthenticated) {
      // Watch the unread notifications stream for the current user's role
      final notificationStream = ref.watch(
        StreamProvider((ref) {
          final db = ref.watch(databaseProvider);
          return db.watchUnreadNotifications(authState.role.name);
        }),
      );

      notificationStream.whenData((notifications) {
        if (notifications.isNotEmpty) {
          // Trigger the instant global popup for the highest priority unread item
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showInternalPopup(context, ref, notifications.first);
          });
        }
      });
    }

    return child;
  }

  void _showInternalPopup(BuildContext context, WidgetRef ref, dynamic notification) {
    // In a real implementation this would check if popup is already open
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E293B),
          title: Row(
            children: [
              Icon(
                notification.category == 'High' ? Icons.warning : Icons.notifications_active,
                color: notification.category == 'High' ? Colors.redAccent : const Color(0xFF38BDF8),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(notification.title)),
            ],
          ),
          content: Text(notification.message),
          actions: [
            TextButton(
              onPressed: () {
                // Log action and mark read securely via drift
                ref.read(databaseProvider).markNotificationRead(notification.id);
                Navigator.pop(context);
              },
              child: const Text('Dismiss & Log'),
            )
          ],
        );
      },
    );
  }
}
