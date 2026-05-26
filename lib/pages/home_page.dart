import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Tema Bengkel
  final Color bgColor = const Color(0xFFF5F5F5);
  final Color primaryRed = const Color(0xFFD32F2F);
  final Color darkColor = const Color(0xFF212121);

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget menuCard(
    IconData icon,
    String title,
    Color primaryRed,
    Color darkColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 45,
            color: primaryRed,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkColor,
        title: const Row(
          children: [
            Icon(
              Icons.motorcycle_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Bedul Garage',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header Dashboard
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    darkColor,
                    primaryRed,
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang 👋',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sistem Informasi Bengkel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Kelola servis, pelanggan, sparepart dan transaksi dengan mudah.',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Menu Utama',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkColor,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  menuCard(
                    Icons.build_circle_outlined,
                    'Servis',
                    primaryRed,
                    darkColor,
                  ),
                  menuCard(
                    Icons.people_alt_outlined,
                    'Pelanggan',
                    primaryRed,
                    darkColor,
                  ),
                  menuCard(
                    Icons.inventory_2_outlined,
                    'Sparepart',
                    primaryRed,
                    darkColor,
                  ),
                  menuCard(
                    Icons.receipt_long_outlined,
                    'Transaksi',
                    primaryRed,
                    darkColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}