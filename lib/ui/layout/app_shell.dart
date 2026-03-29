/*
 * Author: Zain Saradr
 * Website: https://zasolpk.com
 * LinkedIn: https://linkedin.com/in/zain-saradr
 * GitHub: https://github.com/zainsardar-tech
 * Project: Pakistan-Based Blind Welfare Charity Admin System
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart';

/// The root layout framework of the Admin Dashboard.
///
/// Implements a responsive Scaffold integrating a persistent Sidebar Navigation 
/// array on the left and a dynamic Topbar on the right. 
/// Actively Listens to [AuthNotifier] state to lock views rendering if Unauthenticated.
class AppShell extends ConsumerWidget {
  final Widget child;

  const AppShell({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    if (!authState.isAuthenticated) {
      return _buildLoginScreen(ref);
    }

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 250,
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                const SizedBox(height: 32),
                Text(
                  'Charity Admin',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                _SidebarItem(icon: Icons.dashboard, label: 'Dashboard', onTap: () {}),
                _SidebarItem(icon: Icons.people, label: 'Members', onTap: () {}),
                _SidebarItem(icon: Icons.volunteer_activism, label: 'Volunteers', onTap: () {}),
                _SidebarItem(icon: Icons.school, label: 'Education & Skills', onTap: () {}),
                _SidebarItem(icon: Icons.restaurant, label: 'Food & Meals', onTap: () {}),
                _SidebarItem(icon: Icons.fact_check, label: 'Attendance', onTap: () {}),
                _SidebarItem(icon: Icons.favorite, label: 'Donations', onTap: () {}),
                _SidebarItem(icon: Icons.receipt, label: 'Invoices & Expense', onTap: () {}),
                _SidebarItem(icon: Icons.account_tree, label: 'Projects', onTap: () {}),
                _SidebarItem(icon: Icons.assignment, label: 'Audit & Reports', onTap: () {}),
                _SidebarItem(icon: Icons.notifications, label: 'System Notifications', onTap: () {}),
                const Spacer(),
                _SidebarItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () => ref.read(authProvider.notifier).logout(),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          
          // Main Content
          Expanded(
            child: Column(
              children: [
                // Topbar
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.surface,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.notifications_active),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 16),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(authState.role.name.substring(0, 1)),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                ),
                
                // Page Content
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginScreen(WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.favorite, size: 64, color: Color(0xFF38BDF8)),
              const SizedBox(height: 24),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => ref.read(authProvider.notifier).login('admin123', Role.Admin),
                child: const Text('Login as Super Admin'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(authProvider.notifier).login('manager123', Role.Manager),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0),
                child: const Text('Login as Manager', style: TextStyle(color: Color(0xFF38BDF8))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A granular UI element representing a routing node within the Sidebar.
/// Handles dynamic hover-state animations and routes the UI navigation.
class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SidebarItem({Key? key, required this.icon, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(label, style: const TextStyle(color: Colors.white70)),
      hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      onTap: onTap,
    );
  }
}
