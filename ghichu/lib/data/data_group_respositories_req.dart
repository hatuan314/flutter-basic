import 'package:ghichu/data/repositories/data_respositories.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class DataGroupRespositoriesReq extends DataGroupRespositories {
  @override
  Future deleteGroup(String createAt) {}

  @override
  Future<List<Groups>> fetchGroup() async {
    List<Groups> list;
    list = await ReminderApp.fromJson(ModelListReminder.reminderApp).groups;
    return list;
  }

  @override
  Future updateGroup() {}

  @override
  Future orderGroup(List<Groups> groups) async {
    List<Map> listJson = [];
    await groups.forEach((element) {
      listJson.add(element.toJson());
    });
    ModelListReminder.reminderApp['groups'] = listJson;
  }
}
