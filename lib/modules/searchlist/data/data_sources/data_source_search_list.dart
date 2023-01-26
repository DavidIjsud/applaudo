abstract class SearchListDataSource {
  Future<Map<String, dynamic>> getSearchList(String query);
  Future<Map<String, dynamic>> getDetailProduct(String idProduct);
}
