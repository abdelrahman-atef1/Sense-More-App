  import 'package:sense_more/core/shared/Utilities/regix_check.dart';

String? emailValidation(String email){
    if(!REGEXCheck.isEmail(email)) return 'برجاء إدخال بريد إلكتروني صالح';
    return null;
  }
  String? nameValidation(String value){
    if(!REGEXCheck.isName(value,minNameSections: 2)) return 'برجاء إدخال الاسم كاملاً';
    return null;
  }
  String? passwordValidation(String password,String passwordConfirmation){
    if(password != passwordConfirmation) return 'كلمتي المرور غير متطابقتان';
    return null;
  }