import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> pickImage() async {
  try {
    var status = await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      print("Permission denied!");
      return null;
    }

    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      print("here2");
      return File(xFile.path);
    }
    return null;
  } catch (e) {
    print("Error picking image: $e");
    return null;
  }
}
