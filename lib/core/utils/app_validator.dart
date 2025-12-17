class AppValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }

    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }

    bool hasLetter = value.contains(RegExp(r'[a-zA-Z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));

    if (!hasLetter || !hasDigit) {
      return 'Password harus kombinasi huruf dan angka';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama wajib diisi';
    }
    if (value.length < 3) {
      return 'Nama terlalu pendek';
    }
    return null;
  }
}
