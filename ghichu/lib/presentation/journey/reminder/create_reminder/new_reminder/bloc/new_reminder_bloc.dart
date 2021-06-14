import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc/add_list_state.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_event.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';

class NewReminderBloc extends Bloc<NewReminderEvent, NewReminderState> {
  @override
  NewReminderState get initialState => InitialNewReminderState(
        isDateDetails: false,
        activeBtn: false,
      );

  @override
  Stream<NewReminderState> mapEventToState(NewReminderEvent event) async* {
    if (event is UpDate) {
      yield InitialNewReminderState(
        isDateDetails: false,
        activeBtn: false,
      );
    }
    if (event is ActiveBtn) {
      yield* _mapActiveBtn(event);
    }
    if (event is PushDetailEvent) {
      yield PushToDetailState();
      yield InitialNewReminderState(isDateDetails: false, activeBtn: false);
    }
  }

  Stream<NewReminderState> _mapActiveBtn(ActiveBtn event) async* {
    final currentState = state;
    if (currentState is InitialNewReminderState)
      yield currentState.update(activeBtn: event.activeBtn);
  }
}
