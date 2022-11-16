# Tugas 7
## Stateless dan Stateful Widgets
- Stateless widgets adalah widget yang tidak memiliki state. Dengan kata lain, widgets tersebut tidak menyimpan keadaan dari dirinya sendiri. Karena itu, jika ingin diubah, stateless widgets diubah oleh events external dari parent widget mereka dan tidak akan berubah sendiri.
- Stateful widgets adalah widget yang state dirinya sendiri yang dapat berubah-ubah sepanjang waktu. State yang disimpan tersebut akan mendeskripsikan bagaimana widget tersebut dirender. Karena memiliki state, widgets ini dapat menerima events yang mengubah state mereka secara langsung.
- Berbeda dari stateless widgets, stateful widgets memiliki state sehingga dapat menerima events untuk mengubah state dan tampilan di layar, sedangkan stateless widgets tidak merubah dirinya sendiri dan dikontrol oleh parent widgets jika ingin diubah.

## Widgets yang dipakai
- Text, untuk menampilkan text GENAP GANJIL dan counter
- FloatingActionButton, digunakan sebagai button menambahkan dan mengurangi counter
- Row, untuk menata button
- Padding, agar button tidak menempel dengan pojok layar

## setState()
- `setState()` berguna untuk mengubah state dari suatu widget dan memastikan widget tersebut akan dibuild ulang sesuai dengan statenya yang baru. Jika kita mengubah variabel state suatu widget di luar `setState`, maka user interface belum tentu akan diupdate mengikuti state yang baru. Variabel yang berdampak tergantung dari variabel yang diubah didalam `setState()`. 

## const dan final
- const berarti suatu value yang sudah tidak dapat diubah. Ketika kita menggunakan const, variable tersebut akan dibuat ketika compile time dan tidak diubah lagi. Sehingga, jika kita menggunakan const pada suatu object, maka object tersebut harus dapat ditentukan keseluruhan datanya seperti attribute ketika dicompile dan seluruh data tersebut akan menjadi immutable dan tidak dapat diubah lagi. Karena ini, const tidak dapat digunakan ke object yang valuenya tidak dapat ditentukan ketika code dicompile.
- final berarti assignment yang terakhir terhadap suatu variabel. Artinya, jika kita menggunakan final pada variabel yang menyimpan suatu object, variabel tersebut tidak dapat mengganti isi reference object tersebut dengan object lain. Meskipun begitu, karena hanya melarang variabel tersebut menyimpan reference object lain, kita masih bisa mengubah data atau attribute dari object yang disimpan variabel tersebut. Karena itu, final digunakan jika kita butuh menyimpan object yang valuenya tidak dapat ditentukan ketika compile seperti menyimpan HTTP Response yang tidak akan diubah-ubah.

## Checklist
- Pertama menjalankan `flutter create counter_7`.
- Membuat variabel baru `_parity` dan `_parityColor` untuk mengubah text GANJIL GENAP. Variabel digunakan pada widget Text yang sudah ada.
- Mengganti parameter `floatingActionButton` pada widget `Scaffold` dengan `bottomSheet`. Parameter `bottomSheet` digunakan agar widget button bisa ditaro ke bawah layar. `bottomSheet` kita isi dengan widget `Row` yang berisi 2 `FloatingActionButton`, button yang menambahkan dan mengurangi counter.
- Membuat function `_decrementCounter` untuk digunakan button decrement. Juga mengubah tooltips dan icon dari button.
- Agar kedua button tidak menempel dengan ujung layar, gunakan widget `Padding`.
- Untuk membuat button decrement menghilang ketika counter 0, membuat variabel `_minusVisible` untuk mengatur visibility dari button decrement dan memasukkan button decrement ke dalam widget `Visibility` untuk menghilangkan dan memunculkan button.

# Tugas 8
## Navigator.push dan Navigator.pushReplacement
Pada `Navigator.push`, screen baru akan diletakkan pada top of navigation stack sehingga screen baru yang akan ditampilkan dan screen lama masih berada di dalam navigation stack. Hal ini berbeda dengan `Navigator.pushReplacement` di mana screen baru akan menggantikan screen lama yang berada di top of navigation stack sehingga screen lama tidak akan berada di dalam navigation stack lagi.

## Widgets yang digunakan
- Container, berguna untuk mengatur lokasi widgets
- Text, berguna untuk menampilkan text
- Column, Row, berguna untuk menata widgets dalam bentuk kolom atau baris
- Form, berguna untuk membuat form
- TextFormField, berguna untuk menyimpan input text sebuah form
- DropdownButton, berguna untuk membuat dropdown
- Padding, berguna untuk memberikan padding pada suatu widget agar lebih rapi
- TextButton, button yang berisi text, dapat digunakan untuk mensubmit form
- ListTile, widget yang sangat berguna untuk menampilkan sebuah informasi dalam format tertentu
- SingleChildScrollView, berguna agar suatu widget dapat ditampilkan jika melebih layar dengan scroll
- Card, digunakan untuk membantu menampilkan data budget

## Jenis event Flutter
- onPressed, terjadi ketika dipencet
- onTap, terjadi ketika ditap
- onSaved, terjadi ketika form disave
- onChanged, terjadi ketika text form field berubah isinya

## Cara kerja Navigator mengganti halaman
Flutter memiliki sebuah navigation stack yang berisi halaman-halaman yang pernah diakses. Dalam suatu saat, Flutter akan menampilkan layar yang berada pada top of the navigation stack. Navigator dapat mengubah navigation stack ini agar menampilkan halaman-halaman yang berbeda. Salah satu cara mengubah halaman adalah dengan `push` yang akan memasukkan halaman baru ke dalam navigation stack sehingga tampilan halaman akan berubah. Navigator juga dapat melakukan `pop` untuk membuang halaman yang berada pada top of the navigation stack sehingga halaman yang berada di posisi kedua dari top akan menjadi top dan ditampilkan. Navigator juga dapat menggunakan `pushReplacement` untuk mengganti halaman yang berada pada top of the navigation stack sehingga halaman tersebut tidak akan berada di dalam stack lagi dan langsung digantikan halaman baru.

## Implementasi Checklist
- Membuat `drawer.dart` yang berisi `AppDrawer` untuk digunakan halaman lain. Import `drawer.dart` pada halaman lain untuk menggunakan `AppDrawer` sebagai drawer setiap halaman.
- Pada `AppDrawer` menambahkan 3 children berupa tombol yang akan melakukan `pushReplacement` ke halaman yang sesuai dengan tombol masing-masing.
- Membuat `form.dart` yang berisi form untuk menambahkan budget. Menggunakan 2 `TextFormField` untuk judul dan nominal dan sebuah `DropdownButton` untuk jenis budget. `TextFormField` nominal diatur agar hanya menerima input angka. Kemudian membuat button yang melakukan save form. Membuat `budget.dart` untuk memudahkan penyimpanan data budget yang sudah ditambahkan. Menggunakan function `saveBudget` pada `budget.dart` ketika kita ingin menyimpan form.
- Membuat `data.dart` untuk menampilkan data budget yang sudah disimpan. Data budget diambil dari `budgetList` dari `budget.dart`. Menggunakan function `map` untuk membuat `Card` untuk setiap data budget yang telah disimpan.
