import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) {
    const primaryYellow = Color(0xFFFFC107);
    return ListTile(
      leading: Icon(icon, color: primaryYellow),
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white54),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryYellow = Color(0xFFFFC107);
    const bgDark = Color(0xFF0C0C0C);

    return Scaffold(
      backgroundColor: bgDark,
      appBar: AppBar(
        title: const Text('Profil Saya', style: TextStyle(color: primaryYellow)),
        backgroundColor: bgDark,
        iconTheme: const IconThemeData(color: primaryYellow),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: const Color(0xFFFFC107),
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? const Icon(Icons.person, size: 50, color: Colors.black)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'RICKI MAULANA ABBDILLAH',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Text('UID: 221080200127',
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 6),
                  const Text('(Tap foto untuk ubah)',
                      style: TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primaryYellow.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  const Text('Saldo Dompet',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  const SizedBox(height: 6),
                  const Text('Rp 12.500.000',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryYellow)),
                  const Divider(height: 32, color: Colors.white24),
                  _buildMenuItem(Icons.wallet_rounded, 'Dompet Saya'),
                  _buildMenuItem(Icons.bar_chart_rounded, 'Portofolio Investasi'),
                  _buildMenuItem(Icons.card_membership, 'Status Keanggotaan'),
                  _buildMenuItem(Icons.security, 'Keamanan Akun'),
                  _buildMenuItem(Icons.settings, 'Pengaturan'),
                  _buildMenuItem(Icons.help_outline, 'Pusat Bantuan'),
                  _buildMenuItem(Icons.info_outline, 'Tentang Aplikasi'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Versi Aplikasi 1.0.0',
                style: TextStyle(color: Colors.white38)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
