import 'package:ghichu/presentation/models/group.dart';

abstract class DataGroupRespositories{
  Future<List<Groups>> fetchGroup();
  Future updateGroup();
  Future deleteGroup(String createAt);
  Future orderGroup(List<Groups> groups);
}