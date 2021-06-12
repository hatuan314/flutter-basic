import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_event.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';

class NewReminderBloc extends Bloc<NewReminderEvent, NewReminderState> {
  @override
  // TODO: implement initialState
  NewReminderState get initialState => NewReminderState(
        isDateDetails: false,
        activeBtn: false,
      );

  @override
  Stream<NewReminderState> mapEventToState(NewReminderEvent event) async* {
    if (event is ActiveBtn) {
      yield* _mapActiveBtn(event);
    }
  }

  Stream<NewReminderState> _mapActiveBtn(ActiveBtn event) async* {
    yield state.update(activeBtn: event.activeBtn);
  }
}
