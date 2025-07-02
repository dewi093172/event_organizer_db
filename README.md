# event_organizer_db
#Event Organizer Database
Repository ini berisi file SQL untuk struktur dan data awal sistem Event Organizer.

#Deskripsi Database
Database Event Organizer ini dirancang untuk memenuhi kebutuhan pengelolaan informasi dalam suatu bisnis jasa penyelenggaraan acara atau event. 
Sistem ini dibuat dengan pendekatan sederhana namun terstruktur, sehingga dapat digunakan oleh 
pemula dalam memahami konsep dasar perancangan basis data relasional. Tujuan utama dari database ini adalah untuk 
menyimpan dan mengelola data yang berkaitan dengan proses penyelenggaraan event, mulai dari data klien yang melakukan pemesanan, 
daftar layanan yang disediakan oleh EO, informasi pegawai yang terlibat dalam pelaksanaan acara, 
hingga data event dan pemesanan layanan untuk masing-masing acara. Dengan sistem ini, pengguna dapat dengan mudah melihat 
relasi antara satu entitas dengan entitas lainnya, misalnya: event apa saja yang pernah dipesan oleh klien tertentu, 
layanan apa saja yang digunakan dalam suatu event, hingga pegawai mana yang menangani layanan tertentu.
Database ini dapat digunakan sebagai fondasi untuk membangun aplikasi manajemen EO secara lebih lanjut, 
misalnya dalam bentuk aplikasi web berbasis PHP dan MySQL. Selain itu, struktur tabel dan relasi dalam database 
ini juga cocok untuk dijadikan bahan studi dalam memahami konsep primary key, foreign key, dan hubungan antar tabel (relational database).
Dengan pengelolaan database yang baik, sebuah Event Organizer akan lebih mudah dalam:
- Menyusun jadwal event dan alokasi pegawai
- Melacak layanan yang sering digunakan klien
- Menyediakan laporan pemesanan yang akurat
- Meningkatkan efisiensi komunikasi antara klien dan pihak internal EO
Secara keseluruhan, database ini menjadi pondasi penting bagi sistem EO yang profesional dan terotomatisasi, 
sehingga bisnis penyelenggaraan event dapat berjalan dengan lebih tertata, efisien, dan mudah dikembangkan.

Database ini menggunakan 5 tabel utama dengan relasi antar-tabel berbasis ID unik berbentuk kombinasi huruf dan angka.

#Struktur Tabel
- users: menyimpan data admin/penyelenggara event.
- events: menyimpan informasi event (judul, lokasi, waktu, dll).
- tickets: menyimpan jenis dan harga tiket untuk setiap event.
- attendees: menyimpan data peserta event.
- orders: menyimpan data pemesanan tiket oleh peserta.


#Relasi Antar Tabel & Kardinalitas

|Tabel Sumber    | Tabel Tujuan   | Relasi      | Kardinalitas      			       |
| `users`        | `events`       | One to Many | 1 user → banyak event          |
| `events`       | `tickets`      | One to Many | 1 event → banyak tiket         |
| `attendees`    | `orders`       | One to Many | 1 attendee → banyak order      |
| `tickets`      | `orders`       | One to Many | 1 tiket → banyak order         |


#Cara Import Database
1. Buka phpMyAdmin
2. Buat database baru dengan nama: `eo_management`
3. Klik tab Import
4. Pilih file `database.sql` yang sudah diunduh
5. Klik Go
Database akan otomatis terbuat dengan struktur dan data awalnya.

#Identitas
Nama: [Dewi Zulfa Nafisah]  
NIM: [23.02.02.0021]

