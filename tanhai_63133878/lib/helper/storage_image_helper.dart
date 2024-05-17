import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<String> uploadImage({required String imagePath, required List<String> folder, required String fileName}) async {
  String downloadUrl;
  FirebaseStorage _storage = FirebaseStorage.instance;

  // 1. Thiet lap duong dan tren firebase storage
  Reference reference = _storage.ref();
  for (String f in folder) {
    reference = reference.child(f);
  }
  reference = reference.child(fileName); // Corrected the chaining of reference

  // 2. Thiet lap metadata
  final metadata = SettableMetadata(
    contentType: 'image/jpeg',
    customMetadata: {'picked-file-path': imagePath},
  );

  // 3. Upload anh
  try {
    if (kIsWeb) {
      await reference.putData(await File(imagePath).readAsBytes(), metadata);
    } else {
      await reference.putFile(File(imagePath), metadata);
    }
    downloadUrl = await reference.getDownloadURL();
    return downloadUrl;
  } on FirebaseException catch (e) {
    return Future.error("Lỗi up ảnh: $e");
  }
}

Future<void> deleteImage({required List<String> folder, required String fileName}) async {
  FirebaseStorage _storage = FirebaseStorage.instance;

  // 1. Thiet lap duong dan tren firebase storage
  Reference reference = _storage.ref();
  for (String f in folder) {
    reference = reference.child(f);
  }
  reference = reference.child(fileName); // Corrected the chaining of reference

  return reference.delete();
}