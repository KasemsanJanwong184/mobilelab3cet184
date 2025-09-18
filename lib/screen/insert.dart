// insert.dart
import 'package:flutter/material.dart';
import '../models/shirt_item.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // Dropdown values
  ShirtType? selectedType;
  ShirtSize? selectedSize;
  String? selectedImage;
  String? selectedStore;
  String? selectedLogo;

  // Mock Data
  final List<String> shirtImages = [
    'assets/images/shirt1.png',
    'shirt2.png',
    'shirt3.png',
    'shirt4.png',
    'shirt5.png',
    'shirt6.png',
    'shirt7.png',
    'shirt8.png',
  ];

  final List<String> stores = ['CET Fashion', 'SmartWear', 'CoolShop'];
  final Map<String, String> storeLogos = {
    'CET Fashion': 'cetfashion.png',
    'SmartWear': 'smartwear.png',
    'CoolShop': 'coolshop.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มข้อมูลเสื้อ"),
        backgroundColor: Colors.orange[200],
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildDropdown<String>(
                label: "เลือกรูปเสื้อ",
                value: selectedImage,
                items: shirtImages,
                onChanged: (val) => setState(() => selectedImage = val),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                label: "ยี่ห้อเสื้อ",
                controller: brandController,
              ),
              const SizedBox(height: 12),
              _buildDropdown<ShirtType>(
                label: "ประเภทเสื้อ",
                value: selectedType,
                items: ShirtType.values,
                onChanged: (val) => setState(() => selectedType = val),
                display: (val) => val.name,
              ),
              const SizedBox(height: 12),
              _buildDropdown<ShirtSize>(
                label: "ไซต์",
                value: selectedSize,
                items: ShirtSize.values,
                onChanged: (val) => setState(() => selectedSize = val),
                display: (val) => val.name.toUpperCase(),
              ),
              const SizedBox(height: 12),
              _buildTextField(
                label: "ราคา (บาท)",
                controller: priceController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              _buildDropdown<String>(
                label: "เลือกร้าน",
                value: selectedStore,
                items: stores,
                onChanged: (val) {
                  setState(() {
                    selectedStore = val;
                    selectedLogo = storeLogos[val!];
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text("เพิ่มข้อมูล"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) => value == null || value.isEmpty ? 'กรุณากรอก $label' : null,
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required T? value,
    required List<T> items,
    required Function(T?) onChanged,
    String Function(T)? display,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items
          .map(
            (e) => DropdownMenuItem<T>(
              value: e,
              child: Text(display != null ? display(e) : e.toString()),
            ),
          )
          .toList(),
      onChanged: onChanged,
      validator: (val) => val == null ? 'กรุณาเลือก $label' : null,
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final newShirt = ShirtItem(
        imageName: selectedImage!,
        brand: brandController.text,
        type: selectedType!,
        size: selectedSize!,
        price: double.tryParse(priceController.text) ?? 0.0,
        storeName: selectedStore!,
        logo: selectedLogo!,
      );
      Navigator.pop(context, newShirt);
    }
  }
}
