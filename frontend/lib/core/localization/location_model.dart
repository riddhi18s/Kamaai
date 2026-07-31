class StateModel {
  final String code;
  final String localizationKey;

  const StateModel({
    required this.code,
    required this.localizationKey,
  });
}

class DistrictModel {
  final String code;
  final String stateCode;
  final String localizationKey;

  const DistrictModel({
    required this.code,
    required this.stateCode,
    required this.localizationKey,
  });
}