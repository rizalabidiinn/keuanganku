# 📱 Panduan Lengkap Aplikasi KeuanganKu (iOS Edition)

Aplikasi pencatatan keuangan harian, analisis grafik interaktif, dan goals tabungan dengan animasi smooth bergaya native iOS (Human Interface Guidelines).

---

## ⚡ Cara Cepat 1: Jalankan Langsung di iPhone Anda (Sangat Direkomendasikan)
Metode ini adalah **Progressive Web App (PWA)** mandiri berstandar resmi Apple. Aplikasi akan terpasang di Home Screen iPhone Anda dengan ikon aplikasi asli, layar penuh tanpa bar Safari, responsif, dan bekerja 100% offline.

### Langkah-langkah:
1. Di PC Windows Anda, buka folder `financial-ios-app` lalu **dobel klik `start_app.bat`** (atau jalankan `serve.ps1`).
2. Jendela terminal akan terbuka dan menampilkan alamat IP lokal Anda, misalnya:  
   `http://192.168.1.15:8080`
3. Pastikan iPhone dan PC Anda terhubung ke **jaringan Wi-Fi yang sama**.
4. Buka browser **Safari** di iPhone Anda, lalu ketik alamat tersebut (misal `http://192.168.1.15:8080`).
5. Setelah aplikasi terbuka di Safari:
   - Tap tombol **Bagikan / Share** (ikon kotak dengan panah ke atas di bagian bawah Safari).
   - Gulir ke bawah dan pilih **"Tambah ke Layar Utama" (Add to Home Screen)**.
   - Beri nama (misal: *KeuanganKu*) lalu tap **Tambah (Add)** di pojok kanan atas.
6. 🎉 **Selesai!** Ikon KeuanganKu akan langsung muncul di Layar Utama iPhone Anda. Ketika dibuka, tampilannya 100% fullscreen layaknya aplikasi App Store native dengan safe area insets, animasi pegas (spring animations), suara haptik, dan grafik interaktif.

> 💡 **Ingin diakses kapan saja tanpa perlu PC menyala?**  
> Anda cukup meng-upload folder ini ke hosting gratis seperti **Vercel**, **Netlify**, atau **GitHub Pages**. Anda akan mendapatkan link HTTPS (misal: `https://keuanganku.vercel.app`) yang bisa disimpan di Home Screen iPhone selamanya!

---

## 📦 Cara 2: Membungkus Menjadi File `.IPA` (Native iOS App Package)

Jika Anda ingin menghasilkan file biner **`.ipa`** untuk di-install via sideloading (AltStore, Sideloadly, TrollStore, atau Apple Developer):

Karena sistem operasi Anda adalah **Windows** (sedangkan Xcode untuk compile `.ipa` hanya tersedia di macOS), kami telah menyiapkan sistem **Cloud Build Otomatis via GitHub Actions** yang menggunakan komputer macOS gratis dari GitHub:

### Langkah Build `.ipa` di GitHub Actions:
1. Buka [GitHub](https://github.com) dan buat sebuah repositori baru (misal: `keuanganku-ios`).
2. Upload semua file dalam folder `financial-ios-app` ini ke repositori tersebut (pastikan folder `.github/workflows/build-ipa.yml` ikut ter-upload).
3. Buka tab **Actions** di repositori GitHub Anda.
4. Anda akan melihat workflow **"Build iOS IPA Package"** otomatis berjalan di virtual machine macOS Apple.
5. Tunggu proses kompilasi selesai (~2 hingga 3 menit).
6. Masuk ke workflow yang sukses tersebut, di bagian bawah (bagian **Artifacts**), Anda dapat langsung mengunduh file biner:  
   👉 **`KeuanganKu-iOS-IPA.zip`** (berisi file `KeuanganKu.ipa`).

### Cara Menginstall File `.ipa` ke iPhone Anda:
Pilih salah satu metode sideloading berikut:
* **Sideloadly (Paling Mudah dari Windows)**:
  1. Unduh [Sideloadly](https://sideloadly.io/) di PC Windows Anda.
  2. Sambungkan iPhone ke PC dengan kabel USB.
  3. Drag & drop file `KeuanganKu.ipa` ke Sideloadly.
  4. Masukkan Apple ID Anda, lalu klik **Start**. Aplikasi akan langsung terinstall di iPhone Anda!
* **AltStore**:
  1. Pasang AltStore di iPhone Anda.
  2. Kirim file `.ipa` ke iPhone (via AirDrop, Google Drive, atau iCloud).
  3. Buka AltStore -> tab "My Apps" -> tap tanda `+` -> pilih file `KeuanganKu.ipa`.
* **TrollStore** (Bagi iPhone dengan iOS 14.0 - 17.0):
  1. Langsung buka file `.ipa` dan pilih "Install with TrollStore" (aplikasi aktif permanen tanpa revoke).

---

## ✨ Fitur-Fitur Utama KeuanganKu

1. **Ringkasan Saldo Pintar (Smart Dashboard)**:
   - Kartu saldo bergradien terinspirasi dari *Apple Wallet*.
   - Fitur sensor privasi: tap ikon mata untuk mengaburkan (blur) nominal saldo saat berada di tempat umum.
   - Indikator total pemasukan dan total pengeluaran per bulan.
2. **Pencatatan Pemasukan & Pengeluaran Cepat**:
   - Pilihan kategori lengkap dengan ikon & warna cerah (Makanan, Belanja, Transport, Tagihan, Gaji, Freelance, dll).
   - Format otomatis mata uang Rupiah (IDR).
   - Pilihan metode pembayaran (Tunai, Transfer Bank, E-Wallet, Kartu Kredit).
3. **🎯 Goals Tabungan (Celengan Impian)**:
   - Buat target tabungan (Beli iPhone 16 Pro, Liburan, Dana Darurat, dsb).
   - Pilihan emoji unik dan target tanggal deadline.
   - Tombol **+ Setor** uang cepat (+Rp 50rb, +Rp 100rb, +Rp 500rb) dari saldo.
   - **Animasi Partikel Confetti** yang meletup meriah ketika target tabungan berhasil tercapai (100% lunas)!
4. **📊 Grafik & Statistik Finansial**:
   - Grafik batang interaktif arus kas harian (Pemasukan vs Pengeluaran).
   - Donut Chart SVG dinamis yang menampilkan persentase distribusi kategori pengeluaran terbesar.
   - Peringkat pengeluaran tertinggi dengan progress bar berwarna.
5. **Animasi & Nuansa iOS Native**:
   - Dynamic Island interaktif di bagian atas.
   - Bottom Sheet model iOS 17 dengan handle geser dan blur kaca (*glassmorphism*).
   - Efek suara haptik audio sintesis saat mengetuk tombol atau mencatat transaksi.
   - Transisi pergerakan pegas (*spring cubic-bezier physics*).
6. **Keamanan & Manajemen Data**:
   - Data tersimpan aman di penyimpanan lokal perangkat (*localStorage*).
   - Fitur **Ekspor & Impor JSON** untuk mencadangkan (backup) seluruh data sewaktu-waktu.
   - Fitur **Ekspor CSV** untuk membuka riwayat transaksi di Microsoft Excel atau Numbers.
