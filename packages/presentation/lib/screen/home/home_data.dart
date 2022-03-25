class PalindromeData {
  String inputPalindrome;

  PalindromeData(this.inputPalindrome);

  factory PalindromeData.init() => PalindromeData('');

  PalindromeData copy() => PalindromeData(inputPalindrome);
}
