enum Gender {
  male,
  female,
  other,
}

extension GenderLocalization on Gender {
  String get id {
    switch (this) {
      case Gender.male:
        return "male";
      case Gender.female:
        return "female";
      case Gender.other:
        return "other";
    }
  }

  String get localizationKey {
    switch (this) {
      case Gender.male:
        return "genderMale";
      case Gender.female:
        return "genderFemale";
      case Gender.other:
        return "genderOther";
    }
  }

  static Gender? fromId(String? id) {
    switch (id) {
      case "male":
        return Gender.male;

      case "female":
        return Gender.female;

      case "other":
        return Gender.other;

      default:
        return null;
    }
  }
}

const List<Gender> supportedGenders = [
  Gender.male,
  Gender.female,
  Gender.other,
];