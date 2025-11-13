import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String desc;
  final String price;

  const DetailPage({
    Key? key,
    required this.title,
    required this.image,
    required this.desc,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryYellow = Color(0xFFFFC107);
    const bgDark = Color(0xFF0C0C0C);

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: primaryYellow)),
        backgroundColor: bgDark,
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryYellow),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(image, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryYellow,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: const TextStyle(fontSize: 15, color: Colors.white70, height: 1.4),
            ),
            const SizedBox(height: 16),
            Text(
              price,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryYellow,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Checkout berhasil (dummy).'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryYellow,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Checkout Sekarang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
