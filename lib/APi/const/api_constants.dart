class ApiConstants {

  // http://classical.runasp.net/api/Landmarks/tourist
  // https://monsef74.pythonanywhere.com/api/products/
  static const String baseUrlAllProducts = "monsef74.pythonanywhere.com";
  static const String endPointAllProducts = "/api/products";

  static String getFullImageUrl(String relativePath) {
    return 'https://$baseUrlAllProducts$relativePath';
  }

}