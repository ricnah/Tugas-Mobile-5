import 'package:flutter/material.dart';
import '../models/product.dart';
import 'search_page.dart';
import 'profile_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Product> products = [
    Product(id: 'p1', name: 'Kelas Dasar Investasi Saham', price: 99000, symbol: 'KLS1', image: 'assets/kelas1.jpg'),
    Product(id: 'p2', name: 'Analisis Teknikal Saham', price: 149000, symbol: 'KLS2', image: 'assets/kelas2.jpg'),
    Product(id: 'p3', name: 'Analisis Fundamental Saham', price: 129000, symbol: 'KLS3', image: 'assets/kelas3.jpg'),
    Product(id: 'p4', name: 'Strategi Trading Harian', price: 179000, symbol: 'KLS4', image: 'assets/kelas4.jpg'),
    Product(id: 'p5', name: 'Manajemen Risiko Saham', price: 159000, symbol: 'KLS5', image: 'assets/kelas5.jpg'),
    Product(id: 'p6', name: 'Psikologi Trading Saham', price: 139000, symbol: 'KLS6', image: 'assets/kelas6.jpg'),
    Product(id: 'p7', name: 'Strategi Swing Trading', price: 189000, symbol: 'KLS7', image: 'assets/kelas7.jpg'),
    Product(id: 'p8', name: 'Analisis Volume dan Trend', price: 149000, symbol: 'KLS8', image: 'assets/kelas8.jpg'),
    Product(id: 'p9', name: 'Investasi Jangka Panjang', price: 99000, symbol: 'KLS9', image: 'assets/kelas9.jpg'),
    Product(id: 'p10', name: 'Diversifikasi Portofolio Saham', price: 119000, symbol: 'KLS10', image: 'assets/kelas10.jpg'),
  ];

  void _onItemTapped(int idx) {
    if (idx == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage(products: products)));
      return;
    }
    if (idx == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
      return;
    }
    setState(() => _selectedIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    const primaryYellow = Color(0xFFFFC107);
    const bgDark = Color(0xFF0C0C0C);

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        title: const Text(
          'Kelas Saham',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: 0.5,
            color: primaryYellow,
          ),
        ),
        centerTitle: true,
        backgroundColor: bgDark,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final p = products[index];
            bool isPressed = false;

            return StatefulBuilder(
              builder: (context, setPressed) {
                return GestureDetector(
                  onTapDown: (_) => setPressed(() => isPressed = true),
                  onTapUp: (_) => setPressed(() => isPressed = false),
                  onTapCancel: () => setPressed(() => isPressed = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: isPressed ? primaryYellow.withOpacity(0.8) : Colors.transparent,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellowAccent.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                          child: Image.asset(
                            p.image,
                            width: double.infinity,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
                          child: Text(
                            p.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Rp ${p.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: primaryYellow,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailPage(
                                    title: p.name,
                                    image: p.image,
                                    desc:
                                        'Pelajari lebih dalam tentang ${p.name}. Kelas ini cocok untuk kamu yang ingin memahami ${p.symbol}.',
                                    price: 'Rp ${p.price.toStringAsFixed(0)}',
                                  ),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(10),
                            splashColor: primaryYellow.withOpacity(0.2),
                            highlightColor: primaryYellow.withOpacity(0.15),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: isPressed ? primaryYellow.withOpacity(0.9) : primaryYellow,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryYellow.withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              alignment: Alignment.center,
                              child: const Text(
                                'Lihat Detail',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: primaryYellow,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
        ],
      ),
    );
  }
}
