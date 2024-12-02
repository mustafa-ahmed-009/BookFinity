import 'package:bookly/constants.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
      int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kHiveFeaturebBox);
        int length = box.values.length;
   if (startIndex >= length || endIndex > length) { // condition to handle the situation if you tried to get data which don't exist 
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
       int startIndex = pageNumber * 10;
      int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kHiveNewsetBox);
        int length = box.values.length;
   if (startIndex >= length || endIndex > length) { // condition to handle the situation if you tried to get data which don't exist 
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
