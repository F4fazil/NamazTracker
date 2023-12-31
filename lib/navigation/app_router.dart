import 'package:flutter/material.dart';
import 'package:habo/navigation/routes.dart';
import '../habits/edit_habit_screen.dart';
import '../habits/habits_manager.dart';
import '../habits/habits_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../settings/settings_manager.dart';
import '../settings/settings_screen.dart';
import '../splash_screen/splash_screen.dart';
import '../statistics/statistics_screen.dart';
import 'app_state_manager.dart';


class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final SettingsManager settingsManager;
  final HabitsManager habitsManager;

  AppRouter(
      {required this.appStateManager,
      required this.settingsManager,
      required this.habitsManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    settingsManager.addListener(notifyListeners);
    habitsManager.addListener(notifyListeners);
    settingsManager.getSeenOnboarding;
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    settingsManager.removeListener(notifyListeners);
    habitsManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (allInitialized()) HabitsScreen.page(),
        if (appStateManager.getStatistics) StatisticsScreen.page(),
        if (appStateManager.getSettings) SettingsScreen.page(),
        if (appStateManager.getOnboarding || !settingsManager.getSeenOnboarding)
          OnboardingScreen.page(),
        if (appStateManager.getCreateHabit) EditHabitScreen.page(null),
        if (appStateManager.getEditHabit != null)
          EditHabitScreen.page(appStateManager.getEditHabit!),
        if (!allInitialized()) SplashScreen.page(),
      ],
    );
  }

  bool allInitialized() {
    return settingsManager.isInitialized && habitsManager.isInitialized;
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == Routes.statisticsPath) {
      appStateManager.goStatistics(false);
    }

    if (route.settings.name == Routes.settingsPath) {
      appStateManager.goSettings(false);
    }

    if (route.settings.name == Routes.onboardingPath) {
      appStateManager.goOnboarding(false);
    }

    if (route.settings.name == Routes.createHabitPath) {
      appStateManager.goCreateHabit(false);
    }

    if (route.settings.name == Routes.editHabitPath) {
      appStateManager.goEditHabit(null);
    }

    return false;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
