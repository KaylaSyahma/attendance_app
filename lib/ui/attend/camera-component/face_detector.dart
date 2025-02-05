import 'dart:math';
import 'dart:ui';

import 'package:attendance_app/utility/google_mlkit.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

// untuk mendeteksi koordinat wajah
class FaceDetectorComponent{
  final FaceDetector faceDetector = GoogleMlkit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
    enableTracking: true,
    enableLandmarks: true
  ));

  Future<void> detectFaces(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final faces = await faceDetector.processImage(inputImage);

  // kalau sudah terdeteksi, dia akan mengambil bbrp komponen dari wajah. 
  //bounding box adalah sebuah method yang dipakai untuk mengambil komponen dri gambar
    for (Face face in faces){
      // pake rect biar ga ketipu sm gambar 1D
      final Rect boundingBox = face.boundingBox;
      // mendeteksi rotasi wajah secara vertikal
      final double? verticalPosition = face.headEulerAngleY;
      // Z biar fleksibel. klo X kan harus TEK pas gitu susah
      final double? horizontalposition = face.headEulerAngleZ;
      // perkondisian apabila face landmark sudah aktif, ditandai oleh (mulut, mata, pipi, hidung, dan telinga)
      // nullable kalau misalkan telinganya ga kedeteksi
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      // jika kupingnya kedeteksi, dia return posisi telinga tsb
      if (leftEar != null) {
        final Point<int> lefftEarPosition = leftEar.position;
        print("Left Ear Position : $lefftEarPosition");
      } 

      // perkondisian apabila wajahnya terdeteksi(ditandai dengan bibir tersenyum)
      if (face.smilingProbability != null) {
        final double? smileProbability = face.smilingProbability;
        print("Smile Probability : $smileProbability");
      }

      // perkondisian apabila fitur tracking wajah sudah aktif
      if (face.trackingId != null) {
        final int? trackingId = face.trackingId;
        print("Tracking ID : $trackingId");
      }
    }

  }
  
}
