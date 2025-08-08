enum Foodpic {
  menu1(namefood: "สุกี้", image: "assets/images/1.png"),
  menu2(namefood: "สลัดรวม", image: "assets/images/2.png"),
  menu3(namefood: "สเต็กหมู", image: "assets/images/3.png"),
  menu4(namefood: "สเต็กเนื้อ", image: "assets/images/4.png"),
  menu5(namefood: "แฮมเบอร์เกอร์", image: "assets/images/5.png"),
  menu6(namefood: "พิซซ่า", image: "assets/images/6.png"),
  menu7(namefood: "ก๋วยเตี๋ยว", image: "assets/images/7.png");

  const Foodpic({required this.image, required this.namefood});
  final String image;
  final String namefood;
}

class FoodMenu {
  FoodMenu({
    required this.name,
    required this.type,
    required this.component,
    required this.price,
    required this.foodpic,  // ✅ เพิ่มตรงนี้
  });

  String name;
  String type;
  String component;
  int price;
  Foodpic foodpic; // ✅ เพิ่มตัวแปร enum
}

List<FoodMenu> foodMenuList = [
  FoodMenu(
    name: "สุกี้ผักรวม",
    type: "ต้ม",
    component: "ไข่ไก่, เกี๊ยวกุ้ง, ปูอัด, เบคอน, ผักสด",
    price: 299,
    foodpic: Foodpic.menu1,
  ),
  FoodMenu(
    name: "สลัดผัก",
    type: "สุขภาพ",
    component: "แครอท, มะเขือเทศ, ผักรวม",
    price: 159,
    foodpic: Foodpic.menu2,
  ),
  FoodMenu(
    name: "สเต็กหมู",
    type: "สเต็ก",
    component: "สะโพกหมู 120 กรัม, มะเขือเทศ, ผักสลัด",
    price: 299,
    foodpic: Foodpic.menu3,
  ),
  FoodMenu(
    name: "สเต็กเนื้อ",
    type: "สเต็ก",
    component: "เนื้อสัน 120 กรัม, ไข่ดาว, มะกอก, ผัก",
    price: 389,
    foodpic: Foodpic.menu4,
  ),
  FoodMenu(
    name: "แฮมเบอร์เกอร์",
    type: "ฟาสต์ฟู้ด",
    component: "ขนมปัง, หมูบดทอด, ผักกาด, ชีส",
    price: 189,
    foodpic: Foodpic.menu5,
  ),
  FoodMenu(
    name: "พิซซ่า",
    type: "ฟาสต์ฟู้ด",
    component: "แป้งพิซซ่า, เบคอน, มะเขือเทศ, ชีส",
    price: 139,
    foodpic: Foodpic.menu6,
  ),
  FoodMenu(
    name: "ก๋วยเตี๋ยวต้มยำ",
    type: "ยำ/เผ็ด",
    component: "เส้นเล็ก, ไข่ลวก, ถั่วลิสง, พริกป่น, มะนาว",
    price: 88,
    foodpic: Foodpic.menu7,
  ),
];