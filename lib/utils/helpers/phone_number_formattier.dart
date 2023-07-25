class PhoneNumber {
  static String defaultFormattier(String phoneNumber) {
    return (phoneNumber.replaceAllMapped(
        RegExp(r'(\d)(\d{3})(\d{3})(\d{2})(\d+)'),
        (Match m) => "+${m[1]} (${m[2]}) ${m[3]} ${m[4]} ${m[5]}"));
  }
}
