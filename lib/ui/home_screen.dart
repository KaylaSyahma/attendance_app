import 'package:attendance_app/ui/attend/attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // popscope = untuk make sure mau exit app atau engga
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        _onWillPop;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuItem(
                  context, 
                  imagePath: '/asset/images/attend.png', 
                  label: 'Attendance Report', 
                  destination: AttendanceScreen(), 
                ),
                SizedBox(
                  height: 40,
                ),
                _buildMenuItem(
                  context, 
                  imagePath: '/asset/images/permission.png', 
                  label: 'Permission Report', 
                  destination: AttendanceScreen(), 
                ),
                SizedBox(
                  height: 40,
                ),
                _buildMenuItem(
                  context, 
                  imagePath: '/asset/images/attend_history.png', 
                  label: 'Attendance Report', 
                  destination: AttendanceScreen(), 
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
      required String imagePath,
      required String label,
      required Widget destination,
    }
    ) {
    return Container(
                margin: const EdgeInsets.all(20),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => destination));
                    },
                    child:  Column(
                      children: [
                        Image(
                          image: AssetImage(
                            imagePath,
                          ),
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          label,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
            //biar klo popupnya muncul, klo dipencet selain popup, popupnya ga ilang jdi harus dipencet exitnya
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    'INFORMATION',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                    "Do you want to exit this app?",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text(
                          "No",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                    TextButton(
                        // untuk keluar dri aplikasi
                        onPressed: () => SystemNavigator.pop(),
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        )),
                  ],
                ))
        // ini adalah default value ketikia semua kode yang ada di blok alert
        // dialog tidak tereksekusi karena beberapa hal
        );
  }
}
