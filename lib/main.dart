import 'package:flutter/material.dart';
// ใช้ relative path แทน package เพื่อให้ถูกต้องตามโครงสร้างโปรเจกต์ของคุณ
import 'screen/addform.dart';
import 'screen/item.dart';

void main() {
  runApp(const MyApp());  // เปลี่ยนให้รัน MyApp() แทน AddForm()
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CET App ID:184",
      theme: ThemeData(primarySwatch: Colors.orange),
      initialRoute: '/',
      routes: {
        '/': (context) => const Item(),       // หน้าแสดงรายการอาหาร
        '/addform': (context) => const AddForm(),  // หน้าเพิ่มข้อมูล
      },
    );
  }
}