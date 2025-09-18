import 'package:flutter/material.dart';
import 'home.dart'; // ต้องสร้างไฟล์ home.dart แยกไว้ด้วย

void main() {
  runApp(const Cet567Store()); // เปลี่ยน 567 เป็นเลข 3 ตัวท้ายรหัสนักศึกษา
}

class Cet567Store extends StatelessWidget {
  const Cet567Store({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cet184Store',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // พื้นหลังแอพสีขาว
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[200], // สีส้มโทนอ่อน
          titleTextStyle: const TextStyle(
            color: Colors.black, // ตัวอักษรสีดำ
            fontWeight: FontWeight.bold, // ตัวหนา
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, // ไอคอนสีดำ
          ),
        ),
      ),
      home: const HomePage(), // หน้าแรก home.dart
      debugShowCheckedModeBanner: false,
    );
  }
}
