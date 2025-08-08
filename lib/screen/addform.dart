import 'package:flutter/material.dart';
import '../models/foodmenu.dart'; // นำเข้า model
import '../main.dart'; // สำหรับ Navigator กลับไป MyApp

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  // ตัวแปรเก็บค่าจากฟอร์ม
  String name = '';
  String type = '';
  String component = '';
  int price = 0;
  Foodpic? _foodpic; // ตัวแปรเก็บค่ารูปภาพที่เลือก

  @override
  void initState() {
    super.initState();
    _foodpic = Foodpic.menu1; // ตั้งค่าเริ่มต้นของ dropdown
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มเมนูอาหาร'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(   // <-- เพิ่มตรงนี้
          physics: const BouncingScrollPhysics(),  // <-- กำหนด physics
          child: Form(
            key: _formKey,
            child: Column(   // เปลี่ยนจาก ListView เป็น Column เพราะ SingleChildScrollView มี scroll อยู่แล้ว
              children: [
                // ชื่อเมนู
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ชื่อเมนู'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาป้อนชื่อเมนู';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value!;
                  },
                ),
                // ประเภทอาหาร
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ประเภทอาหาร'),
                  onSaved: (value) {
                    type = value!;
                  },
                ),
                // ส่วนประกอบ
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ส่วนประกอบ'),
                  onSaved: (value) {
                    component = value!;
                  },
                ),
                // ราคา
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ราคา'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    price = int.tryParse(value!) ?? 0;
                  },
                ),

                const SizedBox(height: 20),

                // Dropdown เลือกรูปภาพ
                DropdownButtonFormField<Foodpic>(
                  value: _foodpic,
                  decoration: const InputDecoration(
                    labelText: 'เลือกรูปภาพอาหาร',
                  ),
                  items: Foodpic.values.map((pic) {
                    return DropdownMenuItem<Foodpic>(
                      value: pic,
                      child: Row(
                        children: [
                          Text(pic.namefood),
                          const SizedBox(width: 30),
                          Image.asset(
                            pic.image,
                            width: 60,
                            height: 60,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _foodpic = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'กรุณาเลือกรูปภาพ';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // ปุ่มบันทึก
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // เพิ่มข้อมูลใหม่เข้า foodMenuList
                      foodMenuList.add(
                        FoodMenu(
                          name: name,
                          type: type,
                          component: component,
                          price: price,
                          foodpic: _foodpic!, // ใช้ค่าที่เลือกใน dropdown
                        ),
                      );

                      // ล้างฟอร์ม
                      _formKey.currentState!.reset();

                      // กลับไปหน้า MyApp (หน้าแสดงรายการ)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('บันทึก'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}