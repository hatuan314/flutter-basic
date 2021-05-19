import 'dart:async';
import 'dart:developer';

class ReminderStream{
  String title;
  String notes;
  String list = 'Reminders';
  var details;
  StreamController titleController = StreamController<String>.broadcast();
  StreamController notesController = StreamController<String>.broadcast();
  StreamController listController = StreamController<String>.broadcast();
  StreamController detailsController = StreamController.broadcast();
  Stream get titleStream =>titleController.stream;
  Stream get notesStream =>notesController.stream;
  Stream get listStream =>listController.stream;
  Stream get detailsStream =>detailsController.stream;

  void setDetails(var value) {
    details = value;
   detailsController.sink.add(details);
  }

  void setList(String value) {
    list = value;
   listController.sink.add(list);
  }

  void test() {
    //log(allReminder.length.toString()+'@@@@@@@@@@@@');
  }

  void setTitle(String value) {
    title = value;
   titleController.sink.add(title);
  }

  void setNote(String value) {
    notes = value;
    notesController.sink.add(notes);
  }

  void dispose()
  {
    titleController.close();
    notesController.close();
    listController.close();
    detailsController.close();
  }
}