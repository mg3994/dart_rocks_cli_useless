class Email {
  final String value;

  Email(this.value) {
    assertValidEmail(value);
  }

  @override
  String toString() => value;
}

void sendEmail(Email address, String text) {
  print('send email to $address with text $text');
}

bool isValidEmail(String input) {
  return input.contains('@');
}

void assertValidEmail(String input) {
  if (!isValidEmail(input)) {
    throw ArgumentError('$input is no email');
  }
}

void main() {
  const email = 'hi@youtube.com';

  // assertValidEmail(email);
  final emailObj = Email(email);

  sendEmail(emailObj, 'our text saying Hello');

  // This will throw an error
  // sendEmail(Email('totally not an email'), 'asdf');
}
