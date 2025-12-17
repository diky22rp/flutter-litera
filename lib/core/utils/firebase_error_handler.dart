import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  static String getMessage(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'email-already-in-use':
          return 'Email ini sudah terdaftar. Silakan login.';
        case 'invalid-email':
          return 'Format email tidak valid.';
        case 'operation-not-allowed':
          return 'Login email/password belum diaktifkan di Firebase.';
        case 'weak-password':
          return 'Password terlalu lemah. Gunakan kombinasi huruf & angka.';
        case 'user-disabled':
          return 'Akun ini telah dinonaktifkan oleh admin.';
        case 'user-not-found':
          return 'Akun tidak ditemukan. Silakan daftar dulu.';
        case 'wrong-password':
          return 'Password salah. Coba ingat-ingat lagi.';
        case 'invalid-credential':
          return 'Email atau password salah.';
        case 'too-many-requests':
          return 'Terlalu banyak percobaan. Coba lagi nanti.';
        case 'network-request-failed':
          return 'Koneksi internet bermasalah.';
        default:
          return 'Terjadi kesalahan: ${error.message}';
      }
    } else {
      return 'Terjadi kesalahan tidak terduga: $error';
    }
  }
}
