import 'package:ghichu/common/constants/hive_constains.dart';
import 'package:ghichu/domain/entities/group_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalDbSetup {
  Box<GroupEntity> groupBox;
  Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(GroupEntityAdapter());
    groupBox = await Hive.openBox(HiveConstains.boxGroup);

  }

  void dispose() {
    groupBox.compact();
    Hive.close();
  }
}
