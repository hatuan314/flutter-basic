import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders_app/common/enums/view_state.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';
import 'package:reminders_app/reminders_app/domain/usecases/group_usecase.dart';
import 'home_state.dart';
import 'homepage_event.dart';
import '../../reminders_list.dart';
import '../../../../../common/extensions/date_extensions.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GroupUsecase groupUc;

  HomeBloc({this.groupUc});
  @override
  HomeState get initialState =>
      HomeState(todayListLength: 0, scheduledListLength: 0, allListLength: 0,myLists: []) ;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
     if(event is UpdateEvent)
       yield* _mapUpdateEventToState(event);
     if(event is SetDefaultGroupEvent)
       yield* _mapSetDefaultGroupEventToState(event);
     if(event is DeleteGroupEvent)
       yield* _mapDeleteGroupEventToState(event);
  }

  Stream<HomeState> _mapDeleteGroupEventToState(DeleteGroupEvent event)
  async*{
    yield state.update(viewState: ViewState.busy);
   log((await groupUc.getAllGroup() as List).length.toString());
    List l1 =await groupUc.getAllGroup() ;
    log("qqqqqqqqqqqqqq");
    log(l1[0].name);
    log(event.indexGroup.toString());
    await groupUc.deleteGroup(event.indexGroup);
  List l2=await groupUc.getAllGroup();
    if(l2.length<l1.length)

      {
        log("deleted");
        yield state.update(viewState: ViewState.success);
        return;
      }
    log('error');
    yield state.update(viewState: ViewState.error);
  }
  Stream<HomeState> _mapSetDefaultGroupEventToState(SetDefaultGroupEvent event)
 async*{
    if((await groupUc.getAllGroup() as List).length ==0)
      {
        log('add default>>>>>>>>>>>>>>>>>>>');
        int result=await groupUc.setGroup(Group(
          name: 'Reminders',
          color: 'blue',
          createAt: DateTime.now().dateDdMMyyyy,
          lastUpdate: DateTime.now().dateDdMMyyyy,
        ));

        log(result.toString());
      }
 }
  Stream<HomeState> _mapUpdateEventToState(
      UpdateEvent event) async* {
   int todayListLength = 0;
   int scheduledListLength = 0;
   int allListLength = 0;
    if (RemindersList.allReminders?.length == null) {
      todayListLength = 0;
      scheduledListLength = 0;
      allListLength = 0;
    } else {
      RemindersList.allReminders?.forEach((key, value) {
        String now =  DateTime.now().dateDdMMyyyy;

        if (key == now) {
          todayListLength = RemindersList.allReminders[now].length;
        }
        if (key != ('Others')) {
          scheduledListLength += RemindersList.allReminders[key].length;
        }
        allListLength += RemindersList.allReminders[key].length;
      });
    }
    RemindersList.addDefaultList();
   yield state.update(
     myLists:null,
   );
   List list =await groupUc.getAllGroup() ;
    yield state.update(
      todayListLength: todayListLength,
      scheduledListLength: scheduledListLength,
      allListLength: allListLength,
      myLists:  list,
    );
    log(list.length.toString()+"))))))))))))))))))");
   log('home update');
  }

  
}
