import 'package:flutter/material.dart';
import 'package:kuis_124220079/home/home_page.dart'; 



class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); 

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  String username = ""; 
  String password = ""; 
  bool isLoginSuccess = true; 

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        body: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            logo(), 
            _usernameField(), 
            _passwordField(), 
            _loginButton(context), 
          ],
        ),
      ),
    );
  }

 
  Widget logo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20), 
      child: Image.asset( 
        'asset/logo.png', 
        width: 200.0, 
        height: 200.0, 
      ),
    );
  }

  
  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Menambahkan padding horizontal dan vertikal
      child: TextFormField( // Field input untuk username
        enabled: true, // Field dapat diisi
        onChanged: (value) { // Menangkap perubahan teks
          username = value; // Menyimpan nilai username
        },
        decoration: InputDecoration( // Mengatur dekorasi untuk field
          hintText: 'Username', // Teks hint untuk field
          contentPadding: const EdgeInsets.all(8.0), // Padding di dalam field
          enabledBorder: OutlineInputBorder( // Mengatur border saat field diaktifkan
            borderRadius: const BorderRadius.all(Radius.circular(8.0)), // Membuat sudut border melengkung
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red), // Warna border tergantung status login
          ),
          border: const OutlineInputBorder( // Border default untuk field
            borderRadius: BorderRadius.all(Radius.circular(8.0)), // Sudut border melengkung
            borderSide: BorderSide(color: Colors.blue), // Warna border
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan field password
  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Menambahkan padding
      child: TextFormField( // Field input untuk password
        enabled: true, // Field dapat diisi
        onChanged: (value) { // Menangkap perubahan teks
          password = value; // Menyimpan nilai password
        },
        obscureText: true, // Menyembunyikan teks saat mengetik
        decoration: const InputDecoration( // Mengatur dekorasi untuk field
          hintText: 'Password', // Teks hint untuk field
          contentPadding: EdgeInsets.all(8.0), // Padding di dalam field
          border: OutlineInputBorder( // Border untuk field
            borderRadius: BorderRadius.all(Radius.circular(8.0)), // Sudut border melengkung
            borderSide: BorderSide(color: Colors.blue), // Warna border
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan tombol login
  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Menambahkan padding
      child: ElevatedButton( // Tombol yang dapat ditekan
        style: ElevatedButton.styleFrom( // Mengatur gaya tombol
          backgroundColor: (isLoginSuccess) ? Colors.blue : const Color.fromARGB(255, 241, 123, 123), // Warna latar belakang tombol
          foregroundColor: Colors.black, // Warna teks tombol
        ),
        onPressed: () { // Aksi ketika tombol ditekan
          String text = ""; // Variabel untuk menyimpan pesan
          if (username == "liza" && password == "123") { // Memeriksa kredensial login
            setState(() { // Memperbarui state
              text = "Login Success"; // Pesan sukses
              isLoginSuccess = true; // Set status login sukses
            });
            // Navigasi ke halaman HomePage setelah login berhasil
            Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context) {
                return HomePage(username: username); // Mengirim username ke HomePage
              }));
          } else {
            setState(() { // Memperbarui state jika login gagal
              text = "Login Failed"; // Pesan gagal
              isLoginSuccess = false; // Set status login gagal
            });
          }
          SnackBar snackBar = SnackBar(content: Text(text)); // Membuat SnackBar dengan pesan
          ScaffoldMessenger.of(context).showSnackBar(snackBar); // Menampilkan SnackBar
        }, 
        child: const Text('Login'), // Teks pada tombol
      ),
    );
  }
}
