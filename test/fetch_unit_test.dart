
import "package:bookly/core/utils/api_services.dart";
import "package:dio/dio.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("test", () async {
    var data = await ApiServices(Dio()).get(
        endPoint:
            "volumes?q=programming&maxResults=10&orderBy=relevance&filter=free-ebooks&startIndex=${1 * 10}");
    expect(data[0].authorName, "test");
  });
}
