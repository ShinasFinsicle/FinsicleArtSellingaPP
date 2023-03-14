validatefields(value) {
  if (value!.isEmpty) {
    return 'Please Fill these Fields';
  } else {
    return null;
  }
}

phoneValidator(value) {
  final pattern = r'^\+?\d{10,}$'; // Match 10 or more digits
  final regExp = RegExp(pattern);

  if (value.isEmpty) {
    return 'Please enter your phone number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid phone number';
  }
  return null; // Return null if the input is valid
}
