import 'package:flutter/material.dart';
import 'package:kuis_124220079/pembayaran/pembayaran.dart';


class PemesananPage extends StatefulWidget {
  final String username;
  const PemesananPage({super.key,
  required this.username});

  @override
  State<PemesananPage> createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  String _fullname = "";
  String _email = "";
  String _totalRoom = "";
  String _totalNight = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pemesanan"),
        backgroundColor: Colors.blue,
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24
        ),
        child: Center(
          child: Column(
            children: [
              produk(),
              const SizedBox(height: 24,),
              productDetails(),
              const SizedBox(height: 24,),
              tengah(),
              const SizedBox(height: 24,),
              _BuildForm(),
              const SizedBox(height: 24,),
              _buildButtonSubmit(),

            ],
          ),
        ),
      ),
    );
  }

Widget produk() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20), // Padding vertikal untuk Container.
    child: Image.asset(
      'asset/gambar.jpg', 
      fit: BoxFit.cover, // Memastikan gambar menutupi area yang ditentukan.
    ),
  );
}

// Widget untuk menampilkan detail produk seperti nama dan rating.
Widget productDetails() {
  return Container(

    padding: const EdgeInsets.symmetric(horizontal: 20), // Padding horizontal.
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyebarkan ruang antara elemen dalam baris.
      children: [
        Text(
          "Blue Lagoon", // Nama produk.
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

Widget tengah(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20), 
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [
        Text(
          "Booking Information", 
          style: TextStyle(
            fontSize: 20, 
          ),
        ),
      ],
    ),
  );
}

  Widget _formInput({
    required String hint,
    required String label,
    required Function(String value ) setStateInput,
    int maxLines = 1
  }){
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _BuildForm(){
    return Column(
      children: [
        const SizedBox(height: 12,), //jarak antar field, atas sama samping
        _formInput(hint: "Input FullName", 
        label: "FullName *", 
        setStateInput: (value){
          setState(() {
            _fullname = value;
          });
        }),
        const SizedBox(height: 12,), //jarak antar field, atas sama samping
        _formInput(hint: "Input Email", 
        label: "Email *", 
        setStateInput: (value){
          setState(() {
            _email = value;
          });
        }),
        const SizedBox(height: 12,), //jarak antar field, atas sama samping
        _formInput(hint: "Input TotalRoom", 
        label: "TotalRoom *", 
        setStateInput: (value){
          setState(() {
            _totalRoom = value;
          });
        }),
        const SizedBox(height: 12,), //jarak antar field, atas sama samping
        _formInput(hint: "Input TotalNight", 
        label: "TotalNight *", 
        maxLines: 3,
        setStateInput: (value){
          setState(() {
            _totalNight = value;
          });
        }),
      ],
    );
  }

  Widget _buildButtonSubmit(){
    return Container(
      child: ElevatedButton(onPressed: (){
        if(_fullname == "" || _email == "" || _totalRoom == ""){
          SnackBar snackBar =
          const SnackBar(content: Text("* data tidak boleh kosong"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return PembayaranPage(
              name : _fullname,
              username : widget.username,
              TotalRoom : _totalRoom,
              TotalNight: _totalNight, 
              email: _email, 
            );
          }));
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 32, vertical: 16),
          textStyle: const TextStyle(fontSize: 16),
          ), 
      child: const Text("Payment"),
      )
    );
  }
}