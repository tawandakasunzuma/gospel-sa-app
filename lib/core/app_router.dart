import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'main_shell.dart';
import '../features/home/home_screen.dart';
import '../features/bible/bible.dart';
import '../features/songs/songs.dart';
import '../features/auth/login_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',

    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final loggedIn = session != null;

      final goingToLogin = state.uri.toString() == '/login';

      // ❌ not logged in → force login
      if (!loggedIn && !goingToLogin) {
        return '/login';
      }

      // ❌ logged in → prevent going back to login
      if (loggedIn && goingToLogin) {
        return '/';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/bible',
            builder: (context, state) => const BibleScreen(),
          ),
          GoRoute(
            path: '/songs',
            builder: (context, state) => const SongsScreen(),
          ),
        ],
      ),
    ],
  );
}