/*
 * Author: Zain Saradr
 * Website: https://zasolpk.com
 * LinkedIn: https://linkedin.com/in/zain-saradr
 * GitHub: https://github.com/zainsardar-tech
 * Project: Pakistan-Based Blind Welfare Charity Admin System
 */
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'database.g.dart'; // Drift will generate this file

@DriftDatabase(tables: [
  Members, Notifications, NotificationLogs, AuditLogs, 
  Volunteers, Meals, MealLogs, Donations, Invoices, Projects,
  NotificationSchedule, Attendance, SkillSessions
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Example CRUD operations for Members
  Future<List<Member>> getAllMembers() => select(members).get();
  Future<int> addMember(MembersCompanion entry) => into(members).insert(entry);
  Future<bool> updateMember(Member member) => update(members).replace(member);
  Future<int> deleteMember(int id) => (delete(members)..where((t) => t.id.equals(id))).go();

  // Audit Logs Helper
  Future<void> logAction(String action, String userId, String module, {String? details}) {
    return into(auditLogs).insert(AuditLogsCompanion(
      action: Value(action),
      userId: Value(userId),
      module: Value(module),
      details: Value(details),
    ));
  }

  // Example operations for Notifications
  Stream<List<Notification>> watchUnreadNotifications(String role) {
    return (select(notifications)
          ..where((t) => t.status.equals('Unread'))
          ..where((t) => t.recipientRole.equals(role) | t.recipientRole.equals('All'))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> markNotificationRead(int notificationId) async {
    await (update(notifications)..where((t) => t.id.equals(notificationId))).write(
      NotificationsCompanion(
        status: const Value('Read'),
        readAt: Value(DateTime.now()),
      ),
    );
    // Log the read action
    await into(notificationLogs).insert(NotificationLogsCompanion(
      notificationId: Value(notificationId),
      actionTaken: const Value('Read'),
      timestamp: Value(DateTime.now()),
    ));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'charity_admin', 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
