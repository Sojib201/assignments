extension StringExtensions on String {
  bool get isEmail {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(this);
  }
}

extension NumExtensions on num {
  double toResponsiveHeight() => this * 1.0; 
}
