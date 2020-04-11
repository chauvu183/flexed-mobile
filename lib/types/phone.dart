

class PhoneNumber {

  /// The actual mail value set on construction
  final String _value;

  /// The pattern the phone number should match to
  /// be considered valid
  RegExp _pattern = new RegExp(
      r"[0-9\s-]{5,}", 
      caseSensitive: false, 
      multiLine: false
    );


  PhoneNumber(this._value);


  /// Checks whether the phone number is valid
  bool isValid() {
    return _pattern.hasMatch(_value);
  }

}
