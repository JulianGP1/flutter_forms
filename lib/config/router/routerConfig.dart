import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'router.dart'; 

class AuthNotifier extends ChangeNotifier {
  AuthNotifier() {
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      notifyListeners();
    });
  }
}

final authNotifier = AuthNotifier();

final GoRouter router = GoRouter(
  initialLocation: '/home',
  refreshListenable: authNotifier,

  redirect: (context, state) {
    final session = Supabase.instance.client.auth.currentSession;

    final isGoingToLogin = state.matchedLocation == '/login';
    final isGoingToRegister = state.matchedLocation == '/register';
    final isGoingToHome = state.matchedLocation == '/home';

    if (session == null && !isGoingToLogin && !isGoingToRegister) {
      return '/home';
    }

   
    if (session != null && (isGoingToLogin || isGoingToRegister)) {
      return '/user';
    }
     if (session != null && isGoingToHome) {
    return '/user';
  }

    return null;
  },

  routes: routes, 
);