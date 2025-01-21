import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Vision {
  // dibuat privat karena akan mendeteksi wajah
  Vision._();
  // ini adalah syntax untuk kelas kita menjadi safe
  static final Vision instance = Vision._();

  FaceDetector faceDetector([FaceDetectorOptions? options]) {
    return FaceDetector(options: options?? FaceDetectorOptions());
  }
}