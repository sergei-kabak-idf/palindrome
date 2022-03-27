class PalindromeData {
  String outputPalindrome;
  String inputPalindrome;

  PalindromeData(this.outputPalindrome, this.inputPalindrome);

  factory PalindromeData.init() => PalindromeData('null', '');

  void call({
    required String? outputPalindrome,
    required String? inputPalindrome,
  }) {
    if (outputPalindrome != null) this.outputPalindrome = outputPalindrome;
    if (inputPalindrome != null) this.inputPalindrome = inputPalindrome;
  }
}
