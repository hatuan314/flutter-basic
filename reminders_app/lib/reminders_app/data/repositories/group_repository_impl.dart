import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminders_app/reminders_app/data/data_sources/local/group_data_source.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';
import 'package:reminders_app/reminders_app/domain/repositories/group_repository.dart';
import 'package:reminders_app/common/extensions/date_extensions.dart';
class GroupRepositoryImpl implements GroupRepository{
  final GroupDataSource groupDs;

  GroupRepositoryImpl({@required this.groupDs});

  @override
  Future<List<Group>> getAllGroup() {
    return groupDs.getAllGroup();
  }

  @override
  Future<int> setGroup(Group group) {
    log('add to box1');
    return groupDs.setGroup(group);
  }

  Future<void> setDefaultGroup() async{
    Group g = Group(
      name: 'Reminders',
      color: Colors.blue as String,
      createAt: DateTime.now().dateDdMMyyyy,
      lastUpdate: DateTime.now().dateDdMMyyyy,
    );
    await setGroup(g);
  }

}