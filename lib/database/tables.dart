/*
 * Author: Zain Saradr
 * Website: https://zasolpk.com
 * LinkedIn: https://linkedin.com/in/zain-saradr
 * GitHub: https://github.com/zainsardar-tech
 * Project: Pakistan-Based Blind Welfare Charity Admin System
 */
import 'package:drift/drift.dart';

class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get disabilityType => text()();
  BoolColumn get isBrailleRequired => boolean().withDefault(const Constant(false))();
  TextColumn get skillEnrolled => text().nullable()();
  TextColumn get schoolEnrolment => text().nullable()(); // Track education
  BoolColumn get brailleMaterialAllocated => boolean().withDefault(const Constant(false))();
  TextColumn get progressTracking => text().nullable()(); // Progress reports
  TextColumn get phone => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Notifications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get message => text()();
  // e.g., 'High', 'Medium', 'Low'
  TextColumn get category => text()();
  // e.g., 'Reminder', 'Alert', 'Info'
  TextColumn get type => text()();
  // 'Admin', 'Manager', 'All'
  TextColumn get recipientRole => text()();
  // 'Unread', 'Read', 'Dismissed'
  TextColumn get status => text().withDefault(const Constant('Unread'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get readAt => dateTime().nullable()();
}

class NotificationLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get notificationId => integer().references(Notifications, #id)();
  TextColumn get actionTaken => text()(); // 'Read', 'Dismissed', 'Snoozed'
  TextColumn get metadata => text().nullable()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get action => text()();
  TextColumn get userId => text()();
  TextColumn get module => text()();
  TextColumn get details => text().nullable()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

class Volunteers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get assignedTask => text().nullable()();
  TextColumn get skillSessionsMentored => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Meals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mealType => text()(); // Breakfast, Lunch, Dinner
  TextColumn get dietaryRestrictions => text().nullable()();
  BoolColumn get specialAlert => boolean().withDefault(const Constant(false))();
  DateTimeColumn get servedAt => dateTime().withDefault(currentDateAndTime)();
}

class MealLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get memberId => integer().references(Members, #id)();
  IntColumn get mealId => integer().references(Meals, #id)();
  DateTimeColumn get consumedAt => dateTime().withDefault(currentDateAndTime)();
}

class Donations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get donorName => text()();
  RealColumn get amount => real()();
  TextColumn get type => text()(); // Cash, Online
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  TextColumn get allocationProject => text().nullable()(); // Linked to Projects
  DateTimeColumn get dateReceived => dateTime().withDefault(currentDateAndTime)();
}

class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get vendorName => text()();
  RealColumn get amount => real()();
  TextColumn get details => text()();
  DateTimeColumn get datePaid => dateTime().withDefault(currentDateAndTime)();
}

class Projects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get responsibleStaff => text()();
  TextColumn get milestones => text().nullable()(); // JSON or text summary
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class NotificationSchedule extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get notificationId => integer().references(Notifications, #id)();
  DateTimeColumn get scheduledAt => dateTime()();
  TextColumn get recurrence => text().withDefault(const Constant('None'))(); // None, Daily, Weekly, Monthly
  TextColumn get status => text().withDefault(const Constant('Pending'))();
}

class Attendance extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get memberId => integer().nullable().references(Members, #id)();
  IntColumn get volunteerId => integer().nullable().references(Volunteers, #id)();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isPresent => boolean()();
  TextColumn get type => text()(); // Daily, Event, Skill Session
}

class SkillSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get type => text()(); // Vocational, Digital
  IntColumn get volunteerInstructorId => integer().nullable().references(Volunteers, #id)();
  DateTimeColumn get scheduledDate => dateTime()();
}

