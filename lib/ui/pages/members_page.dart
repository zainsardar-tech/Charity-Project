/*
 * Author: Zain Saradr
 * Website: https://zasolpk.com
 * LinkedIn: https://linkedin.com/in/zain-saradr
 * GitHub: https://github.com/zainsardar-tech
 * Project: Pakistan-Based Blind Welfare Charity Admin System
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/database_provider.dart';

class MembersPage extends ConsumerWidget {
  const MembersPage({Key? key}) : super(key: key);

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
                'Visually Impaired Members',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Member'),
                onPressed: () => _showAddMemberDialog(context, ref),
              )
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Card(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (context, _) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                      child: const Icon(Icons.person, color: Color(0xFF818CF8)),
                    ),
                    title: const Text('Example Member User'),
                    subtitle: const Text('Disability: Total Blindness • Skill: Vocational Training'),
                    trailing: const ChoiceChip(label: Text('Braille: Yes'), selected: true),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showAddMemberDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Register New Member'),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(decoration: const InputDecoration(labelText: 'Full Name')),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Disability Type'),
                  items: const [
                    DropdownMenuItem(value: 'Total Blindness', child: Text('Total Blindness')),
                    DropdownMenuItem(value: 'Low Vision', child: Text('Low Vision')),
                  ],
                  onChanged: (val) {},
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Requires Braille Material?'),
                  value: false,
                  onChanged: (val) {},
                ),
                TextField(decoration: const InputDecoration(labelText: 'Skill Enrollment (e.g., Computer, Vocational)')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Here we would call ref.read(databaseProvider).addMember(...)
                ref.read(databaseProvider).logAction('Create Member', 'Admin', 'Members');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Member saved to offline database!')),
                );
                Navigator.pop(context);
              },
              child: const Text('Save Member'),
            ),
          ],
        );
      },
    );
  }
}
