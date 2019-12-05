import '../enums/gender_enum.dart';

class Gender {
  Gender({this.gender});
  GENDER_ENUM gender;

  get displayGender {
    if (this.gender == GENDER_ENUM.FEMALE) {
      return 'Female';
    } else if (this.gender == GENDER_ENUM.MALE) {
      return 'Male';
    } else {
      return '';
    }
  }
}
