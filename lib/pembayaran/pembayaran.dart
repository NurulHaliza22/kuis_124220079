import 'package:flutter/material.dart';


class PembayaranPage extends StatelessWidget {
  final String name;
  final String username;
  final String email;
  final String TotalRoom;
  final String TotalNight;
  const PembayaranPage(
      {super.key,
      required this.name,
      required this.username,
      required this.email,
      required this.TotalRoom,
      this.TotalNight = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Payment Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const Text(
                "Full Name: ",
                style: const TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                "$name",
                style: const TextStyle(fontSize: 16),
              ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const Text(
                "Email:  ",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                " $email",
                style: const TextStyle(fontSize: 16),
              ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const Text(
                "Total Room: ",
                style: const TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                " $TotalRoom",
                style: const TextStyle(fontSize: 16),
              ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const Text(
                "Total Night:  ",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
               Text(
                "  $TotalNight",
                style: const TextStyle(fontSize: 16),
              ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
               Text(
                "Total Harga:  ",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
               Text(
                "  ",
                style: TextStyle(fontSize: 16),
              ),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton( // Menggunakan TextButton untuk tombol beli.
          onPressed: () {
            // Menampilkan Snackbar ketika tombol ditekan.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Payment Berhasil!'), // Pesan Snackbar.
              ),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 241, 123, 123), // Warna latar belakang tombol.
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding untuk tombol.
          ),
          child: const Text(
            'Pay Now', // Teks tombol beli.
            style: TextStyle(color: Colors.white), // Warna teks tombol.
          ),
        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget judul(){
  return Container(
padding: const EdgeInsets.symmetric(horizontal: 20), // Padding horizontal.
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyebarkan ruang antara elemen dalam baris.
      children: [
        Text(
          "Payment Information", // Nama produk.
          style: TextStyle(
            fontSize: 20, // Ukuran font untuk nama produk.
          ),
        ),
        Row(
          children: [
            
            Text(
              "Rp 500.000/night", // Nilai rating.
              style: TextStyle(
                fontSize: 16, // Ukuran font untuk rating.
                color: Colors.red, // Warna teks untuk rating.
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
