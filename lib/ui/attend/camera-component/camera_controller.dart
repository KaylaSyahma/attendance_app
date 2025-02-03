import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraControllerComponent {
  // cameradesc dari bawaan flutter. dikasih non-null karena kita bergantung dengan kesiapan kamera dri device user
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isBusy = false;

  Future<void> loadCamera() async{
    cameras = await availableCameras();
    // kalau misalkan camera tidak kosong
    if(cameras != null && cameras!.isNotEmpty){
      // camera 0 = rear camera. bukan selfie. harus pake bang karena dia kayak pasangan dri non-null
      controller = CameraController(cameras![0], ResolutionPreset.high);
      await controller!.initialize();
    }
  }

// kalau kamera belum ready, kita bakal manggil progress indicator
  Widget buildCameraReview(){
    if (controller == null || !controller!.value.isInitialized) {
      // apabila kondisi bernilai negatif
      return Center(
        child: CircularProgressIndicator(),
      );
    } //kondisi ketike kamera ready (kondisi bernilai positif)
    return CameraPreview(controller!);
  }
}