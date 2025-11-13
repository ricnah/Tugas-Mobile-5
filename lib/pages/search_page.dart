import 'package:flutter/material.dart';
import '../models/product.dart';
import 'detail_page.dart';

class SearchPage extends StatefulWidget {
  final List<Product> products;

  const SearchPage({Key? key, required this.products}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> _filtered = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filtered = widget.products;
    _controller.addListener(_searchProducts);
  }

  void _searchProducts() {
    final query = _controller.text.toLowerCase();
    setState(() {
      _filtered = widget.products
          .where((p) => p.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_searchProducts);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryYellow = Color(0xFFFFC107);
    const bgDark = Color(0xFF0C0C0C);

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        title: const Text('Cari Kelas', style: TextStyle(color: primaryYellow)),
        centerTitle: true,
        backgroundColor: bgDark,
        iconTheme: const IconThemeData(color: primaryYellow),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Cari kelas saham...',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search_rounded, color: primaryYellow),
                filled: true,
                fillColor: Colors.black,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: primaryYellow.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: primaryYellow),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? const Center(
                    child: Text('Tidak ada kelas ditemukan',
                        style: TextStyle(fontSize: 14, color: Colors.white54)),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filtered.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.78,
                    ),
                    itemBuilder: (context, index) {
                      final p = _filtered[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailPage(
                              title: p.name,
                              image: p.image,
                              desc: 'Pelajari lebih dalam tentang ${p.name}. Kelas ini cocok untuk kamu yang ingin memahami ${p.symbol}.',
                              price: 'Rp ${p.price.toStringAsFixed(0)}',
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: primaryYellow.withOpacity(0.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: primaryYellow,
                                    borderRadius: BorderRadius.circular(10),
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
