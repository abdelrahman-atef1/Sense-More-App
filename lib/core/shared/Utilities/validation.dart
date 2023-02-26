  import 'package:sense_more/core/shared/Utilities/regix_check.dart';

String? emailValidation(String email){
    if(!REGEXCheck.isEmail(email)) return 'Please enter a valid Email address';
    return null;
  }
  String? nameValidation(String value){
    if(!REGEXCheck.isName(value,minNameSections: 2)) return 'Please enter your full name';
    return null;
  }
  String? passwordValidation(String password,String passwordConfirmation){
    if(password != passwordConfirmation) return 'Password didn\'t match';
    return null;
  }