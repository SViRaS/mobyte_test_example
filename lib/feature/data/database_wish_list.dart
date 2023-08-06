import 'package:hive/hive.dart';

import '../resources/const.dart';

class TodoDataBaseWishList {
 
  List wishList = [];

  // ignore: unused_field
  final _myBox = Hive.box('mybox');
  
  void createInitialData() {
    wishList = [
      ['Macbook Air m1', Constants().appleUrl, false],
      ['RTX 4090', Constants().dnsUrl, true],
    ];
  }

  void loadData() {
    wishList = _myBox.get('WISHKEY');
  }

  void updateDataBase() {
   _myBox.put('WISHKEY', wishList);
  }
}