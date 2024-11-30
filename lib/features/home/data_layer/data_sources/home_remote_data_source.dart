import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/save_data_to_box.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data_layer/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
        endPoint: "volumes?q=programming&Filtering=free-ebooks");
    List<BookEntity> books = getBookList(data);
    SaveDataToBox(books , kHiveFeaturebBox); 
    return books;
  }

 

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
        endPoint: "volumes?q=programming&Filtering=free-ebooks&Sorting=newest");
    List<BookEntity> books = getBookList(data);
    return books;
  }
}

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

List<BookEntity> getBookList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookMap in data["items"]) {
    books.add(BookModel.fromJson(bookMap));
  }
   SaveDataToBox(books , kHiveNewsetBox); 
  return books;
}
