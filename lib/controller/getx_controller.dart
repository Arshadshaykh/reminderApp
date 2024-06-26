import 'package:get/get.dart';

class MyController extends GetxController {
  String _appBarTitle = '';
  String get appBarTitle => _appBarTitle;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool _switchValue = false;
  bool get switchValue => _switchValue;
  bool _emptyNotes = false;
  bool get emptyNotes => _emptyNotes;

  void changeEmptyNotes(bool value) {
    _emptyNotes = value;
    update();
  }




  void changeSwitchValue(bool value) {
    _switchValue = value;
    update();
  }

  void upDateAppBarTitle(index) {
    switch (index) {
      case 0:
        _appBarTitle = 'Alarms';
        break;
      case 1:
        _appBarTitle = 'Reminders';
        break;
      case 2:
        _appBarTitle = 'TODOs';
        break;
      default:
        _appBarTitle = 'Alarms';
    }
    update();
  }

  void updateCurrentIndex(index) {
    switch (index) {
      case 0:
        _currentIndex = 0;
        break;
      case 1:
        _currentIndex = 1;
        break;
      case 2:
        _currentIndex = 2;
        break;
      default:
        _currentIndex = 0;
    }
    update();
  }
}
