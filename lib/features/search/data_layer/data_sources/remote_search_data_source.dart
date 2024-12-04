import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/save_data_to_box.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data_layer/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';

class SearchRemoteDataSourceImpl extends RemoteSearchDataSource {
  final ApiServices apiServices;

  SearchRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<BookEntity>> fetchSearchResults({required searchParams}) async {
    var data = await apiServices.get(
        endPoint: "volumes?q=$searchParams&Filtering=free-ebooks");
    List<BookEntity> books = getBookList(data);
    return books;
  }

 


}













abstract class RemoteSearchDataSource {
  Future<List<BookEntity>> fetchSearchResults({required searchParams});
}

List<BookEntity> getBookList(Map<String, dynamic> data ) {
  List<BookEntity> books = [];
  for (var bookMap in data["items"]) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}
