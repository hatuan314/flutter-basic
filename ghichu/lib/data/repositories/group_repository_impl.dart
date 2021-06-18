import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ghichu/data/data_sources/local/group_hive.dart';
import 'package:ghichu/domain/entities/group_entity.dart';
import 'package:ghichu/domain/repositories/group_repository.dart';
class GroupRepositoryImpl extends GroupRepository {
  final GroupLocalDataSource groupLds;

  GroupRepositoryImpl({this.groupLds});
  @override
  Future<List<GroupEntity>> getGroupListLocal() {
    log('>>>GroupsRepository');
    return groupLds.getGroupLocalList();
  }

  @override
  Future<int> setGroupLocal(GroupEntity groups) async {
     return await groupLds.setGroupLocal(groups);
  }

  @override
  Future<void> setDefaultGroup() async {
    GroupEntity groups = GroupEntity(
        name: "Reminder",
        color: Colors.blue.value.toString(),
        createAt: DateTime.now().toString(),
        lastUpdate: DateTime.now().toString());
    await setGroupLocal(groups);
  }

  @override
  Future<void> deleteGroup(int index) {
    // TODO: implement deleteGroup
    throw UnimplementedError();
  }

  @override
  Future<GroupEntity> getGroup(int index) {
    // TODO: implement getGroup
    throw UnimplementedError();
  }

}
