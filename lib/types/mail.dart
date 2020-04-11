
class Mail {

  /// The actual mail value set on construction
  final String _value;

  /// The pattern the email should match to
  /// be considered valid
  RegExp _pattern = new RegExp(
      r".+\@.+\.[a-zA-Z0-9]{2,}", 
      caseSensitive: false, 
      multiLine: false
    );


  Mail(this._value);


  /// Checks whether the mail is valid
  bool isValid() {
    return _pattern.hasMatch(_value);
  }

}