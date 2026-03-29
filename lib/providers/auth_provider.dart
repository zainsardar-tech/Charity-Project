/*
 * Author: Zain Saradr
 * Website: https://zasolpk.com
 * LinkedIn: https://linkedin.com/in/zain-saradr
 * GitHub: https://github.com/zainsardar-tech
 * Project: Pakistan-Based Blind Welfare Charity Admin System
 * 
 * Description: 
 * Handles local authentication state and role assignments (Admin vs Manager).
 * Uses Riverpod StateNotifier to inject authorization constraints cleanly across the UI.
 */
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Defines the absolute hierarchical roles permitted within the System.
enum Role { Admin, Manager }

/// Immutable authentication state representation for the UI.
class AuthState {
  /// Defines whether the user session has been successfully evaluated.
  final bool isAuthenticated;
  
  /// A unique system identifier logged in the Audit records.
  final String userId;
  
  /// The restricted capability subset granted to the current user.
  final Role role;

  AuthState({
    required this.isAuthenticated,
    required this.userId,
    required this.role,
  });

  factory AuthState.unauthenticated() {
    return AuthState(isAuthenticated: false, userId: '', role: Role.Manager);
  }
}

/// The Notifier managing the mutation cycle of the Authentication Scope.
/// This guarantees re-rendering of restricted Dashboard blocks globally.
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.unauthenticated());

  /// Attempts mock system login and emits the authenticated state.
  /// Used for V1 logic scaffolding.
  void login(String userId, Role role) {
    state = AuthState(isAuthenticated: true, userId: userId, role: role);
  }

  /// Clears the global session state and returns to the initial locked view.
  void logout() {
    state = AuthState.unauthenticated();
  }
}

/// Global Provider Dependency bridging the Auth logic into the ConsumerWidgets.
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
