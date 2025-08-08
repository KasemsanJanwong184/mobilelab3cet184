import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/foodmenu.dart';
import 'addform.dart'; // ✅ นำเข้า AddForm

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  // ฟังก์ชันกำหนดสีพื้นหลังตามประเภทอาหาร
  Color getBackgroundColor(String type) {
    switch (type) {
      case 'ต้ม':
        return const Color.fromARGB(255, 131, 243, 2);
      case 'สเต็ก':
        return Colors.orangeAccent;
      case 'ฟาสต์ฟู้ด':
        return Colors.redAccent;
      case 'ยำ/เผ็ด':
        return Colors.pinkAccent;
      default:
        return const Color.fromARGB(255, 216, 185, 9);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // แสดงรายการอาหาร
          Expanded(
            child: ListView.builder(
              itemCount: foodMenuList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: getBackgroundColor(foodMenuList[index].type),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ข้อมูลเมนูอาหาร
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodMenuList[index].name,
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            foodMenuList[index].type,
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                            foodMenuList[index].component,
                            style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // ราคา
                      Text(
                        "${foodMenuList[index].price} บาท",
                        style: GoogleFonts.oswald(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 34, 214, 40),
                          ),
                        ),
                      ),

                      // รูปภาพอาหาร
                      Image.asset(
                        foodMenuList[index].foodpic.image,
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ปุ่มเพิ่มข้อมูล
          SizedBox(
            width: 100,
            height: 80,
            child: IconButton(
              icon: const Icon(
                Icons.add,
                size: 40, // ✅ ต้องกำหนดใน Icon
                color: Colors.amber,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddForm(),
                  ),
                ).then((value) {
                  // refresh หน้าหลังเพิ่มข้อมูล
                  setState(() {});
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}