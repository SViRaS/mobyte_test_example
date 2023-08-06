import 'package:hive/hive.dart';
import 'package:mobyte_first_example/const/images_name.dart';

class TodoDataBase {
 
  List guestList = [];

  // ignore: unused_field
  final _myBox = Hive.box('mybox');
  
  void createInitialData() {
    guestList = [
      [AppImages.noneAvatar, 'Иван', 'Иванов', '19 лет', 'Студент', ''],
      [AppImages.mariaAvatar, 'Марья', 'Морская', '23 года', 'Дизайнер', ''],
    ];
  }

  void loadData() {
    guestList = _myBox.get('KEY');
  }

  void updateDataBase() {
   _myBox.put('KEY', guestList);
  }
}