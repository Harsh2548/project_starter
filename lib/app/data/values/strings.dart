class Strings {
  Strings._privateConstructor();

  static const appName = 'Student Vault';
  static const empty = '';
  static const mobileNumber = 'Mobile Number';
  static const id = 'Id';
  static const enterId = 'Enter ID';
  static const enterPassword = 'Enter password';
  static const password = 'Password';
  static const getOTP = 'Get OTP';
  static const signIn = 'Sign In';
  static const retry = 'Retry';
  static const login = 'Login';
  static const forSupport = 'For Support';
  static String callUsOn(String number) => 'Call us on $number';
  static const proceedWithYour = 'Proceed with your';
  static const madeWith = 'Made with';
  static const by = 'by';
  static const tnc = 'Term & Conditions';
  static const privacyPolicy = 'Privacy Policy';
}

class ErrorMessages {
  ErrorMessages._privateConstructor();

  static const unauthorized = 'You are not authorized';
  static const noInternet = 'Please check your internet connection';
  static const connectionTimeout = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
  static const invalidPhone = 'Invalid Mobile number';
  static const invalidId = 'Invalid Id';
  static const invalidOTP = 'Invalid OTP';
  static const invalidName = 'Invalid Name';
  static const invalidEmail = 'Invalid Email';
  static const invalidPassword = 'Invalid Password';
  static const invalidTnC = 'Please select terms & conditions before proceeding.';
}
