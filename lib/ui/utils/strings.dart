extension StringExtension on String {
  String toUpperCaseFirstLetter() {
    if (this.isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalize() {
    return this.toUpperCase();
  }
}
