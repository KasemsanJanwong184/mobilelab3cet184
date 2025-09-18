// detail.dart
import 'package:flutter/material.dart';
import '../models/shirt_item.dart';

class DetailPage extends StatelessWidget {
  final ShirtItem shirt;

  const DetailPage({super.key, required this.shirt});

  @override
  Widget build(BuildContext context) {
    String backImageName = shirt.imageName.replaceFirst('.png', '_back.png');

    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดเสื้อ'),
        backgroundColor: Colors.orange[200],
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ภาพด้านหน้า
          Image.asset(
            'assets/shirts/${shirt.imageName}',
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),

          // ภาพด้านหลัง
          Image.asset(
            'assets/shirts/$backImageName',
            height: 250,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Text('ไม่มีภาพด้านหลัง'),
              );
            },
          ),
          const SizedBox(height: 20),

          // รายละเอียด
          Text('แบรนด์: ${shirt.brand}', style: _detailTextStyle()),
          Text('ประเภท: ${shirt.type.name}', style: _detailTextStyle()),
          Text('ไซต์: ${shirt.size.name.toUpperCase()}', style: _detailTextStyle()),
          Text('รอบอก: ${shirt.chestSize}"', style: _detailTextStyle()),
          Text('ราคา: ฿${shirt.price.toStringAsFixed(2)}', style: _detailTextStyle()),
          Text('ร้าน: ${shirt.storeName}', style: _detailTextStyle()),

          const SizedBox(height: 16),

          // โลโก้ร้าน
          Row(
            children: [
              const Text('โลโก้ร้าน:', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 10),
              Image.asset(
                'assets/logos/${shirt.logo}',
              ),
            ],
          )
        ],
      ),
    );
  }

  TextStyle _detailTextStyle() {
    return const TextStyle(
      fontSize: 18,
      height: 1.5,
    );
  }
}
