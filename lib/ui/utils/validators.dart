import 'package:reactive_forms/reactive_forms.dart';
import 'package:zxcvbn/zxcvbn.dart';

ValidatorFunction mustMatch(String controlName, String matchingControlName) {
  return (AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName) as AbstractControl<String?>;
    final matchingFormControl =
        form.control(matchingControlName) as AbstractControl<String?>;

    if (matchingFormControl.value != null &&
        matchingFormControl.value!.isNotEmpty &&
        formControl.value != matchingFormControl.value) {
      matchingFormControl.setErrors({'mustMatch': true});
    } else {
      matchingFormControl.removeError('mustMatch');
    }

    return null;
  };
}

Map<String, dynamic>? validPassword(AbstractControl control) {
  final zxcvbn = Zxcvbn();

  // final form = control as FormGroup;
  final formControl = control.value;

  if (formControl.value != null) {
    final result = zxcvbn.evaluate(formControl.value.toString());

    if (result.score! <= 1) {
      formControl.setErrors({'': false});
    } else if (result.score! >= 2) {
      formControl.removeError('');
    }
  }

  return null;
}

String? onlyLettersValidator(AbstractControl control) {
  // check if the control value is a string
  if (control.value is! String) {
    return 'Invalid input';
  }
  // check if the string contains only letters
  String value = control.value as String;
  if (!value.contains(RegExp(r'^[a-zA-Z]+$'))) {
    return 'Only letters are allowed';
  }
  // return null if the control is valid
  return null;
}

class PasswordValidator extends Validator<dynamic> {
  final String controlName;

  PasswordValidator({
    required this.controlName,
  }) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName);

    final zxcvbn = Zxcvbn();

    // final form = control as FormGroup;

    if (formControl.value != null && formControl.value.toString().isNotEmpty) {
      final result = zxcvbn.evaluate(formControl.value.toString());

      if (result.score! <= 1) {
        formControl.setErrors({'': false});
      } else if (result.score! >= 2) {
        formControl.removeError('');
      }
    }

    return null;
  }
}

class PhoneValidator extends Validator<dynamic> {
  final String controlName;

  PhoneValidator({
    required this.controlName,
  }) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName);

    if (formControl.value != null) {
      if (!formControl.value.toString().startsWith("01")) {
        formControl.setErrors({'phoneValidation': true});
      }
    }

    return null;
  }
}

class PhoneLength extends Validator<dynamic> {
  final String controlName;
  final int length;

  PhoneLength({required this.controlName, this.length = 11}) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName);

    if (formControl.value != null) {
      if (formControl.value.toString().length < length ||
          formControl.value.toString().length > length) {
        formControl.setErrors({'phoneValidation': true});
      }
    }

    return null;
  }
}
