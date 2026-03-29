/*
 * Author: Zain Saradr
 * Website: https://zasolpk.com
 * LinkedIn: https://linkedin.com/in/zain-saradr
 * GitHub: https://github.com/zainsardar-tech
 * Project: Pakistan-Based Blind Welfare Charity Admin System
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/theme.dart';
import 'ui/layout/app_shell.dart';
import 'ui/notifications/notification_listener.dart';
import 'ui/pages/dashboard_page.dart';
import 'ui/pages/members_page.dart';
import 'ui/pages/notifications_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: CharityAdminApp()));
}

class CharityAdminApp extends ConsumerStatefulWidget {
  const CharityAdminApp({Key? key}) : super(key: key);

  @override
  ConsumerState<CharityAdminApp> createState() => _CharityAdminAppState();
}

class _CharityAdminAppState extends ConsumerState<CharityAdminApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    MembersPage(),
    NotificationsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charity Admin System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: SystemNotificationListener(
        child: AppShell(
          // In a real app we'd use GoRouter or an IndexedStack, but for the MVP:
          child: Scaffold(
            body: _pages[_currentIndex],
          ),
        ),
      ),
    );
  }
}
