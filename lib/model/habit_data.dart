import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:habo/habits/habit.dart';

import '../statistics/statistics.dart';
// final StatisticsData data;
class HabitData {
  HabitData({
    this.id,
    required this.position,
    required this.title,
    required this.cue,
    required this.routine,
    required this.reward,
    required this.showReward,
    required this.advanced,
    required this.notification,
    required this.notTime,
    required this.events,
    required this.sanction,
    required this.showSanction,
    required this.accountant,
  });

  SplayTreeMap<DateTime, List> events;
  int streak = 0;
  int? id;
  int position;
  String title;
  String cue;
  String routine;
  String reward;
  bool showReward;
  bool advanced;
  bool notification;
  TimeOfDay notTime;
  String sanction;
  bool showSanction;
  String accountant;

}
