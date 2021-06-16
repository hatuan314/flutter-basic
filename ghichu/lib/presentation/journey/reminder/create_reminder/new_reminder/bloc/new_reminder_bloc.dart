import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/common/extension/extension_datetime.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_event.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';
import 'package:ghichu/presentation/models/group.dart';

class NewReminderBloc extends Bloc<NewReminderEvent, NewReminderState> {
  @override
  NewReminderState get initialState => InitialNewReminderState(
      isDateDetails: false, activeBtn: false, groups: Groups(), isTime: false);

  @override
  Stream<NewReminderState> mapEventToState(NewReminderEvent event) async* {
    if (event is UpDateNewReminderDetailsEvent) {
      yield* _mapUpDateDetailsToState(event);
    }
    if (event is UpDateNewReminderListGroupEvent) {
      yield* _mapUpDateListGroupToState(event);
    }
    if (event is ActiveBtn) {
      yield* _mapActiveBtn(event);
    }

    if (event is PushDetailEvent) {
      InitialNewReminderState current;
      if (state is InitialNewReminderState) {
        current = state;
      }
      yield PushToDetailState(initDetailsState: current.initDetailsState);
      yield current;
    }
    if (event is PushListGroupEvent) {
      InitialNewReminderState current;
      if (state is InitialNewReminderState) {
        current = state;
      }
      yield PushToListGroupState(groups: current.groups);
      yield current;
    }
  }

  Stream<NewReminderState> _mapUpDateDetailsToState(
      UpDateNewReminderDetailsEvent event) async* {
    String timeDatails = '';
    final current = state;
    if (current is InitialNewReminderState) {
      timeDatails = event.initDetailsState.selectDate.getTimtDate(
          timeOfDay: event.initDetailsState.timeOfDay,
          isTimeSwitch: event.initDetailsState.isTimeSwitch,
          isDateSwitch: event.initDetailsState.isDateSwitch);
      yield current.update(
        timeDateDetails: timeDatails,
        initDetailsState: event.initDetailsState,
        isDateDetails: event.isDateDetails,
      );
    }
  }

  Stream<NewReminderState> _mapUpDateListGroupToState(
      UpDateNewReminderListGroupEvent event) async* {
    final currentState = state;
    if (currentState is InitialNewReminderState) {
      yield currentState.update(groups: event.groups);
    }
  }

  Stream<NewReminderState> _mapActiveBtn(ActiveBtn event) async* {
    final currentState = state;
    if (currentState is InitialNewReminderState)
      yield currentState.update(activeBtn: event.activeBtn);
  }
}
