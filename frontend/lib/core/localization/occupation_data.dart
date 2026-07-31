import 'occupation_model.dart';

const List<OccupationModel> occupations = [
  OccupationModel(
    id: "construction_worker",
    nameKey: "occupationConstructionWorker",
    icon: "construction",
  ),
  OccupationModel(
    id: "electrician",
    nameKey: "occupationElectrician",
    icon: "electric_bolt",
  ),
  OccupationModel(
    id: "plumber",
    nameKey: "occupationPlumber",
    icon: "plumbing",
  ),
  OccupationModel(
    id: "carpenter",
    nameKey: "occupationCarpenter",
    icon: "carpenter",
  ),
  OccupationModel(
    id: "painter",
    nameKey: "occupationPainter",
    icon: "format_paint",
  ),
  OccupationModel(
    id: "mason",
    nameKey: "occupationMason",
    icon: "foundation",
  ),
  OccupationModel(
    id: "welder",
    nameKey: "occupationWelder",
    icon: "engineering",
  ),
  OccupationModel(
    id: "mechanic",
    nameKey: "occupationMechanic",
    icon: "build",
  ),
  OccupationModel(
    id: "driver",
    nameKey: "occupationDriver",
    icon: "drive_eta",
  ),
  OccupationModel(
    id: "delivery_partner",
    nameKey: "occupationDeliveryPartner",
    icon: "delivery_dining",
  ),
  OccupationModel(
    id: "house_maid",
    nameKey: "occupationHouseMaid",
    icon: "cleaning_services",
  ),
  OccupationModel(
    id: "cook",
    nameKey: "occupationCook",
    icon: "restaurant",
  ),
  OccupationModel(
    id: "babysitter",
    nameKey: "occupationBabysitter",
    icon: "child_care",
  ),
  OccupationModel(
    id: "caregiver",
    nameKey: "occupationCaregiver",
    icon: "health_and_safety",
  ),
  OccupationModel(
    id: "gardener",
    nameKey: "occupationGardener",
    icon: "yard",
  ),
  OccupationModel(
    id: "farmer",
    nameKey: "occupationFarmer",
    icon: "agriculture",
  ),
  OccupationModel(
    id: "milkman",
    nameKey: "occupationMilkman",
    icon: "local_drink",
  ),
  OccupationModel(
    id: "tailor",
    nameKey: "occupationTailor",
    icon: "content_cut",
  ),
  OccupationModel(
    id: "weaver",
    nameKey: "occupationWeaver",
    icon: "checkroom",
  ),
  OccupationModel(
    id: "embroidery_artist",
    nameKey: "occupationEmbroideryArtist",
    icon: "style",
  ),
  OccupationModel(
    id: "potter",
    nameKey: "occupationPotter",
    icon: "sports_handball",
  ),
  OccupationModel(
    id: "blacksmith",
    nameKey: "occupationBlacksmith",
    icon: "hardware",
  ),
  OccupationModel(
    id: "artisan",
    nameKey: "occupationArtisan",
    icon: "palette",
  ),
  OccupationModel(
    id: "handicraft_artist",
    nameKey: "occupationHandicraftArtist",
    icon: "brush",
  ),
  OccupationModel(
    id: "beautician",
    nameKey: "occupationBeautician",
    icon: "face",
  ),
  OccupationModel(
    id: "barber",
    nameKey: "occupationBarber",
    icon: "content_cut",
  ),
  OccupationModel(
    id: "security_guard",
    nameKey: "occupationSecurityGuard",
    icon: "shield",
  ),
  OccupationModel(
    id: "cleaner",
    nameKey: "occupationCleaner",
    icon: "cleaning_services",
  ),
  OccupationModel(
    id: "shop_helper",
    nameKey: "occupationShopHelper",
    icon: "storefront",
  ),
  OccupationModel(
    id: "vendor",
    nameKey: "occupationVendor",
    icon: "store",
  ),
  OccupationModel(
    id: "technician",
    nameKey: "occupationTechnician",
    icon: "precision_manufacturing",
  ),
  OccupationModel(
    id: "mobile_repair",
    nameKey: "occupationMobileRepair",
    icon: "smartphone",
  ),
  OccupationModel(
    id: "computer_repair",
    nameKey: "occupationComputerRepair",
    icon: "computer",
  ),
  OccupationModel(
    id: "ac_repair",
    nameKey: "occupationAcRepair",
    icon: "ac_unit",
  ),
  OccupationModel(
    id: "refrigerator_repair",
    nameKey: "occupationRefrigeratorRepair",
    icon: "kitchen",
  ),
  OccupationModel(
    id: "washing_machine_repair",
    nameKey: "occupationWashingMachineRepair",
    icon: "local_laundry_service",
  ),
  OccupationModel(
    id: "teacher",
    nameKey: "occupationTeacher",
    icon: "school",
  ),
  OccupationModel(
    id: "tutor",
    nameKey: "occupationTutor",
    icon: "menu_book",
  ),
  OccupationModel(
    id: "student",
    nameKey: "occupationStudent",
    icon: "school",
  ),
  OccupationModel(
    id: "other",
    nameKey: "occupationOther",
    icon: "more_horiz",
  ),
];

/// Returns all occupations.
List<OccupationModel> getAllOccupations() => occupations;

/// Returns a single occupation by id.
OccupationModel? getOccupation(String id) {
  try {
    return occupations.firstWhere((occupation) => occupation.id == id);
  } catch (_) {
    return null;
  }
}

/// Search occupations by id or localization key.
List<OccupationModel> searchOccupations(String query) {
  if (query.trim().isEmpty) {
    return occupations;
  }

  final q = query.toLowerCase();

  return occupations.where((occupation) {
    return occupation.id.toLowerCase().contains(q) ||
        occupation.nameKey.toLowerCase().contains(q);
  }).toList();
}