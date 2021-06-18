import 'package:get_it/get_it.dart';
import 'package:ghichu/common/configs/local_db_setup.dart';
import 'package:ghichu/data/data_sources/local/group_hive.dart';
import 'package:ghichu/data/repositories/group_repository_impl.dart';
import 'package:ghichu/domain/repositories/group_repository.dart';
import 'package:ghichu/domain/usecase/group_usecase.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc/add_list_bloc.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_bloc.dart';

GetIt locator = GetIt.instance;
void setup() {
  /// Bloc
  locator.registerFactory<HomePageBloc>(
      () => HomePageBloc(groupUs: locator<GroupUseCase>()));
  locator.registerFactory<AddListBloc>(() => AddListBloc(
    groupUseCase: locator<GroupUseCase>()
  ));
  /// UseCases
  locator.registerFactory<GroupUseCase>(
      () => GroupUseCase(groupRepository: locator<GroupRepository>()));

  /// Repositories
  locator.registerFactory<GroupRepository>(
      () => GroupRepositoryImpl(groupLds: locator<GroupLocalDataSource>()));

  /// DataSource
  locator.registerLazySingleton<GroupLocalDataSource>(
      () => GroupLocalDataSource(localDbSetup: locator<LocalDbSetup>()));

  /// Untils
  locator.registerLazySingleton<LocalDbSetup>(() => LocalDbSetup());
}
