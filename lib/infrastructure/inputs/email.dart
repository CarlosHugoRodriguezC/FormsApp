import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {
  const Email.pure() : super.pure('');

  const Email.dirty(String value) : super.dirty(value);

  static final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailError.empty) {
      return 'Email cannot be empty';
    }

    if (displayError == EmailError.format) {
      return 'Email format is invalid';
    }

    return null;
  }

  @override
  EmailError? validator(String value) {
    if (value.trim().isEmpty) {
      return EmailError.empty;
    }

    if (!emailRegExp.hasMatch(value)) {
      return EmailError.format;
    }

    return null;
  }
}
