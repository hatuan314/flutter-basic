import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';
import 'package:reminders_app/reminders_app/domain/repositories/group_repository.dart';

class GroupUsecase{
  final GroupRepository groupRepo;

  GroupUsecase({@required this.groupRepo});
  Future<int> setGroup(Group group) async
  {
    log('add to box2');
    return  await groupRepo.setGroup(group);

  }
}