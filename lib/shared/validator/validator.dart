/// Validate user input and data
class Validator {
  /// Validates Full Name and needs to be more than 4 characters
  static String? name(String? value) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (regExp.hasMatch(value!) && value.trim().length > 4) {
      return null;
    } else if (value.trim().length < 5) {
      return 'Full name must be more than 4 characters';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    // Regular expression to match phone numbers that are 10 or more digits and may start with '+'
    const pattern = r'^\+?\d{10,}$';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return '😉 Come on, don\'t be shy, enter your number';
    } else if (!regExp.hasMatch(value)) {
      return '📢 Phone numbers must have at least 10 digits and can start with a +';
    }
    return null;
  }
  static String? onlyText(String? value) {
    // Regular expression to match only letters and spaces
    const pattern = r'^[a-zA-Z\s]+$';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!regExp.hasMatch(value)) {
      return 'Only letters and spaces are allowed';
    }
    return null;
  }

  static String? textAndNumbers(String? value) {
    // Regular expression to allow letters, numbers, and spaces
    const pattern = r'^[a-zA-Z0-9\s]+$';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Please enter some text or numbers';
    } else if (!regExp.hasMatch(value)) {
      return 'Only letters, numbers, and spaces are allowed';
    }
    return null;
  }

  static String? numbersAndDecimalOnly(String? value) {
    // Regular expression to allow numbers and a single optional decimal point
    const pattern = r'^[0-9]+(\.[0-9]+)?$';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Please enter a valid number';
    } else if (!regExp.hasMatch(value)) {
      return 'Only valid numbers or decimals are allowed';
    }
    return null;
  }



  static String? anything(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please info required'; // Optional check for empty input
    }
    return null; // Always valid if not empty
  }


  /// Pattern checks for valid phone Numbers
  // static String? phoneNumber(String? value) {
  //   const pattern = r'(^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$)';
  //   final regExp = RegExp(pattern);
  //   if (value!.isEmpty) {
  //     return '😉 Come on, don\'t be shy, enter your number';
  //   } else if (!regExp.hasMatch(value)) {
  //     return "Hmm 🤔, that doesn't look like a valid phone number";
  //   } else if (value.length > 16 || value.length < 9) {
  //     return "Hmm 🤔, that doesn't look like a valid phone number";
  //   } else if (value.startsWith('0') && value.length < 10) {
  //     return "👏 Come on, ${10 - value.length} digits more";
  //   } else if (value.startsWith('0') && value.length > 10) {
  //     return "📢 Valid phone numbers are 10 digits right ?";
  //   } else if (value.startsWith("") && value.length < 12) {
  //     return "Not sure if this is a valid phone number";
  //   }
  //   return null;
  // }
 /* static String? phoneNumber(String? value) {
    if (value!.isEmpty) {
      return '😉 Come on, don\'t be shy, enter your number';
    } else if (value.length < 10) {
      return '👏 Come on, ${10 - value.length} digits more';
    }

    /// When [value] is greater than 10
    else if (value.length > 10) {
      return '📢 Valid phone numbers are 10 digits right ?';
    }
    return null;
  }*/

  /// pattern for a valid code must start with either grp_ or comm_ and the length is 10 plus the prefix

  static String? validCode(String? value) {
    if (value!.isEmpty) {
      return "Come on, enter the code";
    } else if (!value.startsWith("grp_") && !value.startsWith("comm_")) {
      return "Invalid community or group code";
    } else if (value.startsWith('grp_') && value.length != 14) {
      return "Invalid group code";
    } else if (value.startsWith('comm_') && value.length != 15) {
      return "Invalid Community code";
    }

    return null;
  }

  static String? email(String? value) {
    // Regular expression to validate email addresses
    const pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return '📧 Please enter your email';
    } else if (!regExp.hasMatch(value)) {
      return '📧 Enter a valid email address';
    }
    return null;
  }





}
