/*
 * Author: Zain Saradr
 * Website: https://zasolpk.com
 * LinkedIn: https://linkedin.com/in/zain-saradr
 * GitHub: https://github.com/zainsardar-tech
 * Project: Pakistan-Based Blind Welfare Charity Admin System
 *
 * Description:
 * Generates the Riverpod wrapper dependency for the SQLite offline database mapping.
 */
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database.dart';

/// Provides a globally accessible reference instance of the `AppDatabase`.
/// This prevents memory leaks by actively managing the SQLite I/O lifecycle 
/// and strictly enforcing a Singleton pattern locally within the Widget tree.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  
  // Important: Explicitly close the SQLite DB connection on app dispose.
  ref.onDispose(() {
    db.close();
  });
  
  return db;
});
