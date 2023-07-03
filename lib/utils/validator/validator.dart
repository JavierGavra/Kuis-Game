class Validator {
  static String? validateNama(String text) {
    if (text == "") return 'Nama tidak boleh kosong';
    if (text.length < 3) return 'Nama terlalu pendek';
    return null;
  }
}
