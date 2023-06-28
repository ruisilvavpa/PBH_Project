import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/api_endpoints.dart';
import 'package:path_provider/path_provider.dart';

class ImageController extends GetxController {
  Future<File?> displayImage(String imagePath) async {
    String apiUrl = ApiEndPoints.baseUrl +
        ApiEndPoints.authEndPoints.getImage +
        "?imagePath=" +
        imagePath;

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == HttpStatus.ok) {
      final jsonData = jsonDecode(response.body);
      String imageBase64 = jsonData['imageBase64'];

      // Decode the base64 string to bytes
      List<int> imageBytes = base64Decode(imageBase64);

      // Get the document directory
      final directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/image.jpg';

      // Save the image bytes to a file in the document directory
      File imageFile = File(filePath);
      await imageFile.writeAsBytes(imageBytes);
      return imageFile;
    } else {
      return null;
    }
  }
}
