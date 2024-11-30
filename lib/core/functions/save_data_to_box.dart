 import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:hive/hive.dart';

void SaveDataToBox(List<BookEntity> books, String boxName) {
       var box = Hive.box(boxName);
    box.add(books); 
  }