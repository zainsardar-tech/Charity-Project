/*
 * Author: Zain Saradr
 * Website: https://zasolpk.com
 * LinkedIn: https://linkedin.com/in/zain-saradr
 * GitHub: https://github.com/zainsardar-tech
 * Project: Pakistan-Based Blind Welfare Charity Admin System
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Internal Communication System (CNS)',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('New System Alert'),
                style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
                onPressed: () => _showNewAlertForm(context, ref),
              )
            ],
          ),
          const SizedBox(height: 24),
          const Expanded(child: _NotificationList()),
        ],
      ),
    );
  }

  void _showNewAlertForm(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Broadcast System Alert'),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(decoration: const InputDecoration(labelText: 'Alert Title (e.g., Urgent Update)')),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(labelText: 'Message Body'),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Priority Category'),
                  value: 'High',
                  items: const [
                    DropdownMenuItem(value: 'High', child: Text('High/Urgent')),
                    DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                    DropdownMenuItem(value: 'Low', child: Text('Low')),
                  ],
                  onChanged: (val) {},
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Recipient Role'),
                  value: 'All',
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('All Staff')),
                    DropdownMenuItem(value: 'Manager', child: Text('Managers Only')),
                    DropdownMenuItem(value: 'Admin', child: Text('Admins Only')),
                  ],
                  onChanged: (val) {},
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                // Here we would call ref.read(databaseProvider).into(notifications).insert(...)
                // The Riverpod Stream listener will hear the SQLite insert and legally auto-popup!
                ref.read(databaseProvider).logAction('Trigger Alert', 'Admin', 'CNS');
                Navigator.pop(context);
              },
              child: const Text('Broadcast Instantly!'),
            ),
          ],
        );
      },
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final isHighPriority = index % 2 == 0;
          return ListTile(
            leading: Icon(
              isHighPriority ? Icons.warning_amber_rounded : Icons.info,
              color: isHighPriority ? Colors.redAccent : Colors.blueAccent,
            ),
            title: Text(isHighPriority ? 'Urgent Meal Schedule Update' : 'Skill Session Reminder'),
            subtitle: const Text('Category: High • To: All Managers • Unread'),
            trailing: IconButton(
              icon: const Icon(Icons.done_all, color: Colors.green),
              tooltip: 'Mark as read',
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
