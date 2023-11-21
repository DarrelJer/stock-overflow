## **TUGAS 9**
**1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**
Bisa, data JSON dapat langsung diproses dan diakses sebagai struktur data generik. Hal ini memudahkan penggunaan data JSON tanpa perlu mendefinisikan model atau kelas khusus terlebih dahulu.

- Mengambil Data JSON Tanpa Model:
    - Dapat bekerja dengan fleksibilitas data yang strukturnya mungkin tidak tetap
    - Lebih mudah dan cepat
    - Dinamis, berguna ketika berinteraksi dengan API yang mungkin mengembalikan berbagai jenis respons
- Menggunakan Model untuk Data JSON:
    - Validasi data yang lebih baik
    - Kode lebih mudah dipahami dan dipelihara, terutama untuk proyek yang lebih besar
    - Keamanan, membantu mencegah kesalahan tertentu, seperti injeksi data yang tidak aman

**2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**
`CookieRequest` biasanya merujuk pada sebuah kelas atau mekanisme yang digunakan untuk menangani cookies dalam permintaan HTTP. Cookie sering digunakan untuk menyimpan informasi seperti preferensi pengguna, data sesi, dan token autentikasi.

**Pentingnya CookieRequest: **
- Membagikan instance `CookieRequest` yang sama ke seluruh komponen aplikasi dapat memastikan bahwa semua permintaan HTTP menggunakan cookies yang sama untuk menjaga konsistensi sesi dan pengaturan pengguna.
- Jika setiap komponen membuat instance `CookieRequest` sendiri, hal ini bisa menyebabkan konflik atau redundansi dalam pengelolaan cookies, seperti masuk atau keluar sesi yang tidak konsisten di seluruh aplikasi.
- Membagikan instance yang sama mengurangi overhead karena tidak perlu membuat dan mengonfigurasi instance baru setiap kali membuat permintaan HTTP. Ini meningkatkan efisiensi dan performa aplikasi.
- Dengan menggunakan instance `CookieRequest` tunggal yang digunakan di seluruh aplikasi, hal ini dapat memudahkan untuk mengatur, memodifikasi, dan men-debug isu yang terkait dengan permintaan HTTP dan pengelolaan cookies.

**3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**
- Pertama, kita perlu mengirim permintaan HTTP ke server web atau API yang menyediakan data dalam format JSON. Flutter menyediakan paket seperti http untuk menangani permintaan HTTP.
- Kemudian Setelah permintaan terkirim, kita akan menerima respons dari server. Kita harus memeriksa status respons untuk memastikan permintaan berhasil.
- Jika respons berhasil, kemudian kita akan parsing teks JSON yang diterima menjadi struktur data Dart.
- Terakhir, kita menggunakan data ini untuk membangun widget di Flutter. Kita bisa menggunakan StatefulWidget untuk memanipulasi state untuk menampilkan list data.
- 
**4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**
- Pertama, kita akan meminta input dengan menggunakan form
- Setelah data diinput, aplikasi Flutter akan mengirimkannya ke server Django menggunakan permintaan HTTP POST. Data dikirim dalam format yang dapat diterima oleh Django.
- Di sisi server Django, kita akan memiliki endpoint yang ditujukan untuk menangani permintaan autentikasi ini. Django akan memproses data yang diterima.
- Aplikasi Flutter akan menerima respons dari Django. Respons ini biasanya berisi konfirmasi berhasil atau gagalnya autentikasi, dan mungkin juga token autentikasi.
- Berdasarkan respons dari Django, Flutter kemudian menampilkan UI yang sesuai. Jika autentikasi berhasil, Flutter dapat menavigasi pengguna ke halaman utama atau menu. Jika gagal, Flutter akan menampilkan pesan error.
  
**5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**
 **Provider:** Mengelola dan menyediakan data ke seluruh aplikasi.
- **MaterialApp:** Root widget yang mengatur tema dan navigasi untuk aplikasi berbasis material design.
- **Scaffold:** Menyediakan kerangka dasar untuk layout halaman, termasuk AppBar, Drawer, dan Body.
- **AppBar:** Menampilkan bar di bagian atas layar, biasanya berisi judul halaman.
- **Container:** Widget untuk mendekorasi dan menyusun child widget lainnya, sering digunakan untuk padding.
- **Column:** Mengatur child widget secara vertikal.
- **TextField:** Mengizinkan pengguna memasukkan teks.
- **SizedBox:** Memberikan jarak tetap antara widget.
- **ElevatedButton:** Tombol dengan efek elevasi, digunakan untuk memicu aksi.
- **FutureBuilder:** Membangun widget berdasarkan hasil terakhir dari Future, digunakan untuk operasi asinkron.
- **ListView.builder:** Membuat daftar item yang dapat di-scroll.
- **Text:** Menampilkan teks.
- **Padding:** Menambahkan padding di sekitar widget anaknya.
- **AlertDialog:** Menampilkan dialog kepada pengguna, biasanya untuk konfirmasi atau informasi.
- **TextButton:** Tombol dengan gaya teks, biasanya digunakan dalam dialog.
- **Form:** Mengelola state dari form dan validasi input.
- **GlobalKey<FormState>:** Key yang digunakan untuk mengidentifikasi state dari `Form`.
- **TextEditingController:** Mengontrol teks yang ditampilkan dan diubah dalam `TextField`.
- **SnackBar:** Menampilkan pesan singkat di bagian bawah layar.
- **Navigator:** Mengelola stack rute dan navigasi antar halaman.
- **MaterialPageRoute:** Membuat transisi halaman dengan gaya material design.
- **LeftDrawer:** Widget kustom yang bertindak sebagai menu navigasi samping.
  
**6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!**
- Pertama, saya membuat halaman login pada proyek tugas dengan nama file `login.dart` dengan isi sebagai berikut
```
  import 'package:stockoverflow/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Check credentials
                // TODO: Change the URL and don't forget to add a trailing slash (/) at the end of the URL!
                // To connect the Android emulator to Django on localhost,
                // use the URL http://10.0.2.2/
                final response =
                    await request.login("http://127.0.0.1:8000/auth/login/", {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text("$message Welcome, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Failed'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
```
- Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter dengan melakukan setup integrasi pada proyek django seperti yang ada pada tutorial dan menginstall package yang telah disediakan
- Kemudian saya membuat model kustom melalui website Quicktype dan saya paste hasil dari Quicktype ke dalam sebuah file baru pada `lib/models/product.dart`
- Selanjutnya saya membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah di deploy dengan membuat file baru `lib/screens/list_product.dart`
- Selanjutnya saya membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. Sehingga `list_product.dart` saya menjadi seperti ini:
```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:stockoverflow/models/product.dart';
import 'package:stockoverflow/widgets/show_drawer.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ItemPage> {
Future<List<Item>> fetchItem() async {
    var url = Uri.parse(
        'http:////127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_item = [];
    for (var d in data) {
        if (d != null) {
            list_item.add(Item.fromJson(d));
        }
    }
    return list_item;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}
```



# **TUGAS 8**

**1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**


`Navigator.push()`: Metode ini digunakan untuk menambahkan halaman baru ke tumpukan navigasi. 
Dengan kata lain, Navigator.push() akan menambahkan halaman baru ke tumpukan dan pengguna dapat kembali ke halaman sebelumnya dengan tombol tertentu atau metode Navigator.pop().
Contoh penggunaan Navigator.push():
```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondScreen(),
  ),
);
```

`Navigator.pushReplacement()`: Metode ini digunakan untuk menggantikan halaman saat ini dengan halaman baru. 
Ini berarti bahwa ketika kira menggunakan Navigator.pushReplacement(), halaman saat ini akan dihapus dari tumpukan navigasi dan digantikan oleh halaman baru. Pengguna tidak dapat kembali ke halaman sebelumnya dengan tombol Back.
Contoh penggunaan Navigator.pushReplacement():
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => NewScreen(),
  ),
);
```
**2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**
- Column & Row: Column mengatur elemen secara vertikal, sedangkan Row mengatur elemen secara horizontal.
- Container: Wadah untuk mengatur tata letak dan memberi styling pada elemen, misalnya padding, margin, alignment, etc.
- Stack: Digunakan untuk menumpuk widget/elemen satu di atas yang lain.
- GridView: Menampilkan elemen dalam grid yang teratur dengan bentuk tabel.
- ListView: Menampilkan elemen yang dapat di-scroll secara vertikal.
- Expanded & Flexible: Mengontrol bagian dari ruang yang tersedia yang digunakan. Expanded mengisi ruang tersedia, sedangkan Flexible memberikan lebih banyak kontrol atas faktor fleksibilitas.
- Padding: Memberikan padding di sekeliling elemen child.
- Transform: digunakan untuk mengubah ukuran dan posisi elemen child
- Align: Mengatur posisi elemen child sesuai dengan alignment yang ditentukan.
- Wrap: Membuat row atau column dan secara otomatis beralih ke row atau column berikutnya setelah ruang di row atau column saat ini habis.
- Scaffold: Memberikan struktur dasar material design seperti AppBar, Drawer, dan FloatingActionButton.
- ConstrainedBox, SizedBox, & AspectRatio: Mengontrol ukuran atau aspek rasio dari elemen childnya.

  
**3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**
   
`TextFormField` digunakan untuk mengambil input teks seperti nama, harga, dan deskripsi.
- Memiliki fitur pendukung untuk validasi input melalui properti validator, memastikan bahwa data yang dimasukkan sesuai dengan aturan yang diinginkan.
- Memungkinkan untuk menyesuaikan tampilan input, seperti menambahkan placeholder, label, dan border melalui properti decoration.

`ElevatedButton` 
- Memberikan tombol yang dapat diklik untuk memicu aksi terkait formulir, dalam hal ini, menyimpan data produk ke daftar.

**4.Bagaimana penerapan clean architecture pada aplikasi Flutter?**

Penerapan clean architecture pada aplikasi Flutter melibatkan organisasi kode menjadi beberapa lapisan yang terpisah, masing-masing dengan tanggung jawab spesifik:

- `Presentation Layer`: Mengelola UI dan interaksi pengguna, biasanya melalui widget dan logic UI Flutter.
- `Business Logic Layer (Domain Layer)`: Berisi logic bisnis aplikasi termasuk entities dan use cases. Independen dari framework dan UI.
- `Data Layer`: Bertanggung jawab atas pengelolaan data, termasuk repositori, model data, dan sumber data (API, database lokal).
- `Dependency Injection`: Menggunakan teknik seperti provider atau get_it untuk mengurangi ketergantungan langsung antar komponen. Tujuan utama clean architecture adalah untuk memisahkan concerns, meningkatkan modularitas, dan memudahkan pengujian. Implementasi ini membantu dalam mengelola dependensi, membuat kode lebih mudah dikelola dan diuji.
  
**5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)**



# **Tugas 7**

**1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**
- Stateless Widget: Stateless widget adalah widget yang tidak memiliki data yang dapat berubah setelah dibuat.
  Ini berarti tampilan widget tidak berubah selama masa hidupnya. Stateless widget digunakan untuk komponen statis seperti teks, gambar, ikon, atau tombol yang tidak perlu menyimpan atau mengelola perubahan data.
- Stateful Widget: Stateful widget adalah widget yang dapat memiliki data yang berubah selama masa hidupnya. Ini berarti tampilan widget dapat diperbarui atau diubah saat data berubah.
  Stateful widget digunakan untuk komponen yang memerlukan interaksi pengguna, perubahan data, atau perubahan tampilan dinamis.


**2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**
- **MyApp**: StatelessWidget yang merupakan root dari aplikasi Flutter dan menentukan tema aplikasi.
- **MyHomePage**: StatelessWidget yang menampilkan halaman utama dengan AppBar dan tombol-tombol.
- **ElevatedButton**: StatefulWidget yang digunakan untuk membuat tombol dengan teks dan ikon.
- **Scaffold**: StatelessWidget yang digunakan untuk membuat kerangka halaman dengan AppBar.
  
**3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**

- Pertama saya membuat proyek flutter baru dan masuk ke dalam direktori tersebut
- Kemudian saya melakukan modifikasi pada main.dart dan menu.dart agar kode lebih rapih dan meningkatkan readablity
- Maka menu.dart saya menjadi seprti berikut
```
  import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```
Kemudian pada `main.dart` saya membuat button dan juga snackbar pada file ini. Sehingga `main.dart` saya menjadi seperti ini
```
import 'package:flutter/material.dart';
import 'package:stockoverflow/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Overflow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'WELCOME TO STOCKOVERFLOW BROWWW BERKELAS '),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Kamu telah menekan tombol Lihat Item')),
                );
              },
              icon: Icon(Icons.list),
              label: Text('Lihat Item'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Kamu telah menekan tombol Tambah Item')),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Tambah Item'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Kamu telah menekan tombol Logout')),
                );
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
```

Di sini 
- **MyApp** adalah root aplikasi dan menentukan tema aplikasi.
- **MyHomePage** adalah halaman utama yang menampilkan AppBar dan tombol-tombol.
- Masing-masing tombol (ElevatedButton) memiliki onPressed handler yang menampilkan SnackBar saat ditekan.
-  Ketika tombol **Lihat Item** ditekan, muncul SnackBar dengan pesan **Kamu telah menekan tombol Lihat Item**.
-  Ketika tombol **Tambah Item** ditekan, muncul SnackBar dengan pesan **Kamu telah menekan tombol Tambah Item**.
- Ketika tombol **Logout** ditekan, muncul SnackBar dengan pesan **Kamu telah menekan tombol Logout**.


