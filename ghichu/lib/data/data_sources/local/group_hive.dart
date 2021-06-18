import 'dart:developer';
import 'package:ghichu/common/configs/local_db_setup.dart';
import 'package:ghichu/domain/entities/group_entity.dart';

class GroupLocalDataSource {
  final LocalDbSetup localDbSetup;

  GroupLocalDataSource({this.localDbSetup});
  Future<List<GroupEntity>> getGroupLocalList() async {
    log('>>>GroupsHive');

    List<GroupEntity> listGroup = [];
    int length = localDbSetup.groupBox.length;
    for (int i = 0; i < length; i++) {
      GroupEntity groups = localDbSetup.groupBox.getAt(i);
      listGroup.add(groups);
    }

    return listGroup;
  }

  Future<int> setGroupLocal(GroupEntity groups) async {
    return await localDbSetup.groupBox.add(groups);
  }
  Future<void> deleteGroup(int index){

  }
 Future<GroupEntity> getGroup(){

 }
}
