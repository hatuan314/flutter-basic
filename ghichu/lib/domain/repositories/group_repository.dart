import 'package:ghichu/domain/entities/group_entity.dart';


abstract class GroupRepository {
  Future<List<GroupEntity>> getGroupListLocal();
  Future<int> setGroupLocal(GroupEntity groups);
 Future<void> setDefaultGroup();
 Future<void> deleteGroup(int index);
 Future<GroupEntity> getGroup(int index);
}
