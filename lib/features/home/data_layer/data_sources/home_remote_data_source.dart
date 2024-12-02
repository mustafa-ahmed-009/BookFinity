import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/save_data_to_box.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data_layer/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber =0 }) async {
    var data = await apiServices.get(
        endPoint: "volumes?q=programming&Filtering=free-ebooks&startIndex=${pageNumber*10}");
    List<BookEntity> books = getBookList(data , kHiveFeaturebBox);
    return books;
  }

 

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0 }) async {
    var data = await apiServices.get(
        endPoint: "volumes?q=programming&Filtering=free-ebooks&Sorting=newest&startIndex=${pageNumber*10}");
    List<BookEntity> books = getBookList(data,kHiveNewsetBox);
    return books;
  }
}













abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0 });
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0 });
}

List<BookEntity> getBookList(Map<String, dynamic> data ,  String boxName) {
  List<BookEntity> books = [];
  for (var bookMap in data["items"]) {
    books.add(BookModel.fromJson(bookMap));
  }
   saveBooksData(books , boxName); 
  return books;
}
