class ApiEndPoints {
  static const String baseUrl = 'https://10.0.2.2:7198';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = '/api/Authentication/register';
  final String loginEmail = '/api/Authentication/login';
  final String forgotPassword = 'authaccount/forgotPassword';
  final String fetchMe = '/api/User/me';
  final String logout = '/api/Authentication/logout';
  final String delete = '/api/User';
  final String update = '/api/User';
  final String updateUserImage = '/api/User/userImage';
  final String resetPassword = '/api/User/changePassword';
  final String categories = '/api/Book/categories';
  final String institutions = '/api/Institutions/institutions';
  final String addPost = '/api/Book';
  final String getImage = '/api/Image/getImage';
  final String booksByWritter = '/api/Book/getAllBooksByWritter?userId=';
  final String allContributions = '/api/Donation/sumByUserId';
  final String allDonations = '/api/Donation/sumByWritter';
  final String getAllBooks = '/api/Book/getAllBooks';
  final String getAllWritters = '/api/User/writters';
  final String updateBookImage = '/api/Book/bookImage/';
  final String donation = '/api/Donation/insertDonation';
  final String getWishlist = '/api/Wishlist/getWishlist';
  final String insertWishlist = '/api/Wishlist/insertWishlist';
  final String deleteWishlist = '/api/Wishlist';
}
