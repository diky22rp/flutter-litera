
# **LITERA** - Aplikasi Sewa Buku (Flutter)

**Litera** adalah aplikasi *mobile* untuk penyewaan buku yang dibangun menggunakan **Flutter**. Aplikasi ini menerapkan standar industri seperti **Clean Architecture**, **BLoC Pattern**, dan integrasi **Firebase** yang aman.

---

## **Panduan Setup Project (Wajib Dibaca)**

Demi keamanan, file konfigurasi sensitif (seperti API Key Firebase dan URL Server) **TIDAK disertakan** di dalam repository ini. Ikuti langkah-langkah di bawah untuk menjalankan aplikasi di komputer Anda.

### 1. **Prasyarat Sistem**
Pastikan Anda sudah menginstal alat-alat berikut:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Versi terbaru)
- [Firebase CLI](https://firebase.google.com/docs/cli)  
  (Install dengan perintah: `npm install -g firebase-tools`)
- [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/)  
  (Install dengan perintah: `dart pub global activate flutterfire_cli`)

### 2. **Clone Repository**
Clone repository ini ke komputer Anda:
```bash
git clone https://github.com/username-anda/flutter-litera.git
cd flutter-litera
```

### 3. **Konfigurasi Firebase (PENTING!)**
File `firebase_options.dart` dan `google-services.json` tidak disertakan di repository ini demi alasan keamanan. Anda harus menghubungkan aplikasi ke Project Firebase milik Anda sendiri.

Langkah-langkah:
1. **Login ke Firebase melalui terminal:**
   ```bash
   firebase login
   ```

2. **Jalankan perintah konfigurasi Firebase:**
   ```bash
   flutterfire configure
   ```

3. **Pilih project Firebase Anda, kemudian pilih platform (Android & iOS) dengan menekan spasi.**

   - Setelah memilih platform, proses konfigurasi akan menghasilkan file `firebase_options.dart` yang akan otomatis ditambahkan ke project Anda. Pastikan file ini sudah ada di dalam project Anda setelah proses selesai.

4. **Tambahkan file `google-services.json` (untuk Android) dan `GoogleService-Info.plist` (untuk iOS):**
   - Untuk Android, letakkan file `google-services.json` di dalam folder `android/app/`.
   - Untuk iOS, letakkan file `GoogleService-Info.plist` di dalam folder `ios/Runner/`.

### 4. **Setup Environment Variables (.env)**
Aplikasi ini menggunakan file `.env` untuk menyimpan konfigurasi API agar lebih mudah diganti antara mode pengembangan (DEVELOPMENT) dan produksi (PROD/LIVE).

1. Buat file baru bernama `.env` di folder root project (sejajar dengan `pubspec.yaml`).
2. Salin konfigurasi berikut ke dalam file `.env`:
   
   ```ini
   # Konfigurasi Aplikasi
   APP_NAME=Litera App
   DEBUG_MODE=true
   
   # API Configuration (BukuAcak API)
   BASE_URL=https://bukuacak-9bdcb4ef2605.herokuapp.com/api/v1
   ```

### 5. **Jalankan Aplikasi**
Setelah konfigurasi selesai, jalankan aplikasi dengan perintah berikut:
```bash
flutter pub get
flutter run
```

---

## **Tech Stack & Libraries**

Project ini dibangun dengan teknologi modern dan mengikuti *best practices*:

- **Framework**: Flutter & Dart
- **Architecture**: Clean Architecture (Separation of Concerns, Feature based Structure)
- **State Management**: `flutter_bloc` & `Cubit`
- **Dependency Injection**: `get_it`
- **Networking**: `dio` (REST API)
- **Backend as a Service**:
  - Firebase Auth (Login & Register)
  - Cloud Firestore (Database User & Transaksi)
- **Local Storage**: `shared_preferences`
- **UI Components**:
  - `google_fonts`
  - `cached_network_image`
- **Functional Programming**: `dartz` (Either Type)
- **Environment Management**: `flutter_dotenv`

---

## **Struktur Folder (Clean Architecture)**

Aplikasi ini menggunakan struktur **Clean Architecture** yang membagi aplikasi menjadi 3 layer utama untuk setiap fitur:

1. **Domain Layer** (Bisnis Logik Murni):
   - **Entities**: Model data murni.
   - **Repositories**: Interface (kontrak) fungsi.
   - **UseCases**: Logika spesifik per fitur.

2. **Data Layer** (Akses Data):
   - **Models**: Konversi data (JSON/Firestore) ke Entity.
   - **DataSources**: Koneksi ke API/Firebase.
   - **Repositories**: Implementasi dari kontrak Domain.

3. **Presentation Layer** (UI):
   - **BLoC/Cubit**: State management.
   - **Pages**: Tampilan layar.
   - **Widgets**: Komponen UI yang dapat digunakan kembali.

---

## **Keamanan & Best Practices**

- **Gitignore Strategy**: File konfigurasi sensitif (`.env`, `firebase_options.dart`, `google-services.json`) di-ignore agar API Key tidak bocor ke publik.
- **Dependency Injection**: Memudahkan testing dan pemeliharaan kode.
- **Repository Pattern**: Memisahkan logika UI dari logika data, memungkinkan penggantian sumber data tanpa merusak UI.

---