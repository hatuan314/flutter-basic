import 'package:get_it/get_it.dart';
import 'package:reminders_app/common/config/local_config.dart';
import 'package:reminders_app/reminders_app/data/data_sources/local/group_data_source.dart';
import 'package:reminders_app/reminders_app/data/repositories/group_repository_impl.dart';
import 'package:reminders_app/reminders_app/domain/repositories/group_repository.dart';
import 'package:reminders_app/reminders_app/domain/usecases/group_usecase.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/add_list_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/bloc/new_reminder_bloc.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => NewReminderBloc());
  locator.registerFactory<AddListBloc>(
      () => AddListBloc(groupUc: locator<GroupUsecase>()));

  locator.registerFactory<GroupUsecase>(
      () => GroupUsecase(groupRepo: locator<GroupRepository>()));

  locator.registerFactory<GroupRepository>(
      () => GroupRepositoryImpl(groupDs: locator<GroupDataSource>()));
  locator.registerLazySingleton<GroupDataSource>(
      () => GroupDataSource(config: locator<LocalConfig>()));
  locator.registerLazySingleton<LocalConfig>(() => LocalConfig());
}
