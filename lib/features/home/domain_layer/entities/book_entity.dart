import 'package:bookly/features/home/data_layer/models/book_model/book_model.dart';
import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
    @HiveField(6)
  final num? ratingCount;
    @HiveField(7)
  final String? bookPreviewLink;
  BookEntity(
   { required this.bookPreviewLink,  
      required this.image,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating,
      required this.bookId,
     required this.ratingCount,
      });
}