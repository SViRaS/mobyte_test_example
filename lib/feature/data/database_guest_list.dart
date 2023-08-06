import 'package:hive/hive.dart';

class TodoDataBaseGuestList {
 
  List guestList = [];

  // ignore: unused_field
  final _myBox = Hive.box('mybox');
  
  void createInitialData() {
    guestList = [
      ['Иван', 'Иванов', '19 лет', 'Студент', ''],
      ['Марья', 'Морская', '23 года', 'Дизайнер', ''],
    ];
  }

  void loadData() {
    guestList = _myBox.get('GUESTKEY');
  }

  void updateDataBase() {
   _myBox.put('GUESTKEY', guestList);
  }
}

