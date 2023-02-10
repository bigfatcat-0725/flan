import 'package:flan/features/auth/screen/login_screen.dart';
import 'package:flan/features/auth/screen/signup_screen.dart';
import 'package:flan/features/bell/screen/bell_screen.dart';
import 'package:flan/features/bookmark/screen/bookmark_screen.dart';
import 'package:flan/features/category/screen/category_screen.dart';
import 'package:flan/features/community/screen/community_ask_screen.dart';
import 'package:flan/features/community/screen/community_detail_screen.dart';
import 'package:flan/features/default/screen/default_screen.dart';
import 'package:flan/features/drawer/screen/drawer_community_screen.dart';
import 'package:flan/features/drawer/screen/drawer_info_screen.dart';
import 'package:flan/features/drawer/screen/drawer_profile_screen.dart';
import 'package:flan/features/drawer/screen/drawer_setting_screen.dart';
import 'package:flan/features/drawer/widget/drawer_profile_edit.dart';
import 'package:flan/features/drawer/widget/info_notice.dart';
import 'package:flan/features/drawer/widget/setting_bell.dart';
import 'package:flan/features/drawer/widget/setting_language.dart';
import 'package:flan/features/drawer/widget/setting_theme.dart';
import 'package:flan/features/main/screen/main_detail_screen.dart';
import 'package:flan/features/qa/screen/ask_screen.dart';
import 'package:flan/features/qa/screen/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginScreen()),
    ),
    GoRoute(
      path: '/sign',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SignUpScreen()),
    ),
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: DefaultScreen()),
      routes: [
        GoRoute(
          path: 'main_detail',
          pageBuilder: (context, state) {
            final object = state.extra as Map<String, dynamic>;

            return NoTransitionPage(
                child: MainDetailScreen(
              data: object['data'],
            ));
          },
        ),
        GoRoute(
          path: 'question',
          pageBuilder: (context, state) {
            final object = state.extra as Map<String, dynamic>;
            return NoTransitionPage(
                child: QuestionScreen(
              type: object['type'].toString(),
              toSeq: object['toSeq'],
            ));
          },
        ),
        GoRoute(
          path: 'ask',
          pageBuilder: (context, state) {
            final object = state.extra as Map<String, dynamic>;
            return NoTransitionPage(
              child: AskScreen(
                type: object['type'],
                question: object['question'],
              ),
            );
          },
        ),
        GoRoute(
          path: 'community_ask',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CommunityAskScreen()),
        ),
        GoRoute(
          path: 'community_detail',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CommunityDetailScreen()),
        ),
        GoRoute(
          path: 'category',
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: CategoryScreen(),
          ),
        ),
        GoRoute(
          path: 'bookmark',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: BookmarkScreen()),
        ),
        GoRoute(
          path: 'bell',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: BellScreen()),
        ),
        GoRoute(
          path: 'drawer_profile',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DrawerProfileScreen()),
          routes: [
            GoRoute(
              path: 'edit',
              pageBuilder: (context, state) {
                final object = state.extra as Map<String, String>;
                return NoTransitionPage(
                    child: DrawerProfileEdit(type: object['type'].toString()));
              },
            ),
          ],
        ),
        GoRoute(
          path: 'drawer_info',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DrawerInfoScreen()),
          routes: [
            GoRoute(
              path: 'notice',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: InfoNotice()),
            ),
          ],
        ),
        GoRoute(
          path: 'drawer_community',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DrawerCommunityScreen()),
        ),
        GoRoute(
          path: 'drawer_setting',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: DrawerSettingScreen()),
          routes: [
            GoRoute(
              path: 'theme',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingTheme()),
            ),
            GoRoute(
              path: 'bell',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingBell()),
            ),
            GoRoute(
              path: 'language',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingLanguage()),
            ),
          ],
        ),
      ],
    ),
  ],
);
