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
    return config.groupBox.values.toList() as List<Group>;
  }
}