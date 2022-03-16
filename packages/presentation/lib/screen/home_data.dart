class PalindromeData {
  bool isPalindrome;
  String inputPalindrome;

  PalindromeData(this.isPalindrome, this.inputPalindrome);

  factory PalindromeData.init() => PalindromeData(false, '');

  void call({
    required bool? isPalindrome,
    required String? inputPalindrome,
  }) {
    if (isPalindrome != null) this.isPalindrome = isPalindrome;
    if (inputPalindrome != null) this.inputPalindrome = inputPalindrome;
  }
}
