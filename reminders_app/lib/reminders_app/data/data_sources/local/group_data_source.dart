import 'dart:developer';

import 'package:reminders_app/common/config/local_config.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';

class GroupDataSource{
  final LocalConfig config;

  GroupDataSource({this.config});
  
  Future<int> setGroup (Group group) async
  {
    log('add to box');
    return config.groupBox.add(group);
  }
  Future<List<Group>> getAllGroup() async{
    log('get all group');
   // log(config.groupBox.values.toList().length.toString());
    return config.groupBox.values.toList() as List<Group>;
  }

  Future<void> deleteGroup(int index) async
  {
    config.groupBox.deleteAt(index);
    log('delete group');
  }
}