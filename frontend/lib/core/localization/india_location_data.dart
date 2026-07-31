import 'location_model.dart';

/// ============================================================
/// STATES
/// ============================================================
const List<StateModel> indianStates = [
  StateModel(
    code: "AN",
    localizationKey: "stateAndamanNicobar",
  ),
  StateModel(
    code: "AP",
    localizationKey: "stateAndhraPradesh",
  ),
  StateModel(
    code: "AR",
    localizationKey: "stateArunachalPradesh",
  ),
  StateModel(
    code: "AS",
    localizationKey: "stateAssam",
  ),
  StateModel(
    code: "BR",
    localizationKey: "stateBihar",
  ),
  StateModel(
    code: "CG",
    localizationKey: "stateChhattisgarh",
  ),
  StateModel(
    code: "CH",
    localizationKey: "stateChandigarh",
  ),
  StateModel(
    code: "DD",
    localizationKey: "stateDadraDamanDiu",
  ),
  StateModel(
    code: "DL",
    localizationKey: "stateDelhi",
  ),
  StateModel(
    code: "GA",
    localizationKey: "stateGoa",
  ),
  StateModel(
    code: "GJ",
    localizationKey: "stateGujarat",
  ),
  StateModel(
    code: "HP",
    localizationKey: "stateHimachalPradesh",
  ),
  StateModel(
    code: "HR",
    localizationKey: "stateHaryana",
  ),
  StateModel(
    code: "JH",
    localizationKey: "stateJharkhand",
  ),
  StateModel(
    code: "JK",
    localizationKey: "stateJammuKashmir",
  ),
  StateModel(
    code: "KA",
    localizationKey: "stateKarnataka",
  ),
  StateModel(
    code: "KL",
    localizationKey: "stateKerala",
  ),
  StateModel(
    code: "LA",
    localizationKey: "stateLadakh",
  ),
  StateModel(
    code: "LD",
    localizationKey: "stateLakshadweep",
  ),
  StateModel(
    code: "MH",
    localizationKey: "stateMaharashtra",
  ),
  StateModel(
    code: "ML",
    localizationKey: "stateMeghalaya",
  ),
  StateModel(
    code: "MN",
    localizationKey: "stateManipur",
  ),
  StateModel(
    code: "MP",
    localizationKey: "stateMadhyaPradesh",
  ),
  StateModel(
    code: "MZ",
    localizationKey: "stateMizoram",
  ),
  StateModel(
    code: "NL",
    localizationKey: "stateNagaland",
  ),
  StateModel(
    code: "OD",
    localizationKey: "stateOdisha",
  ),
  StateModel(
    code: "PB",
    localizationKey: "statePunjab",
  ),
  StateModel(
    code: "PY",
    localizationKey: "statePuducherry",
  ),
  StateModel(
    code: "RJ",
    localizationKey: "stateRajasthan",
  ),
  StateModel(
    code: "SK",
    localizationKey: "stateSikkim",
  ),
  StateModel(
    code: "TN",
    localizationKey: "stateTamilNadu",
  ),
  StateModel(
    code: "TS",
    localizationKey: "stateTelangana",
  ),
  StateModel(
    code: "TR",
    localizationKey: "stateTripura",
  ),
  StateModel(
    code: "UK",
    localizationKey: "stateUttarakhand",
  ),
  StateModel(
    code: "UP",
    localizationKey: "stateUttarPradesh",
  ),
  StateModel(
    code: "WB",
    localizationKey: "stateWestBengal",
  ),
];

/// ============================================================
/// DISTRICTS (grouped state-wise)
/// ============================================================
///
/// NOTE: "LA" (Ladakh) and "TS" (Telangana) have no district source
/// data available yet and are included as empty lists so the map's
/// key set stays in sync with `indianStates`. Populate them with
/// real districts (code, stateCode, localizationKey) when the data
/// is available — no other code needs to change. Telangana's
/// districts currently live under "AP" (Andhra Pradesh) below,
/// reflecting the pre-2014 undivided-state source data.
const Map<String, List<DistrictModel>> districtsByState = {
  // Andaman & Nicobar Islands
  "AN": [
    DistrictModel(
      code: "AN_ANDAMAN_NICOBAR_IS",
      stateCode: "AN",
      localizationKey: "districtAndamanNicobarIs",
    ),
  ],

  // Andhra Pradesh
  "AP": [
    DistrictModel(
      code: "AP_ADILABAD",
      stateCode: "AP",
      localizationKey: "districtAdilabad",
    ),
    DistrictModel(
      code: "AP_ANANTAPUR",
      stateCode: "AP",
      localizationKey: "districtAnantapur",
    ),
    DistrictModel(
      code: "AP_CHITTOOR",
      stateCode: "AP",
      localizationKey: "districtChittoor",
    ),
    DistrictModel(
      code: "AP_EAST_GODAVARI",
      stateCode: "AP",
      localizationKey: "districtEastGodavari",
    ),
    DistrictModel(
      code: "AP_GUNTUR",
      stateCode: "AP",
      localizationKey: "districtGuntur",
    ),
    DistrictModel(
      code: "AP_HYDERABAD",
      stateCode: "AP",
      localizationKey: "districtHyderabad",
    ),
    DistrictModel(
      code: "AP_KADAPA",
      stateCode: "AP",
      localizationKey: "districtKadapa",
    ),
    DistrictModel(
      code: "AP_KARIMNAGAR",
      stateCode: "AP",
      localizationKey: "districtKarimnagar",
    ),
    DistrictModel(
      code: "AP_KHAMMAM_BHADRACHALAM",
      stateCode: "AP",
      localizationKey: "districtKhammamBhadrachalam",
    ),
    DistrictModel(
      code: "AP_KRISHNA",
      stateCode: "AP",
      localizationKey: "districtKrishna",
    ),
    DistrictModel(
      code: "AP_KURNOOL",
      stateCode: "AP",
      localizationKey: "districtKurnool",
    ),
    DistrictModel(
      code: "AP_MAHBUBNAGAR",
      stateCode: "AP",
      localizationKey: "districtMahbubnagar",
    ),
    DistrictModel(
      code: "AP_MEDAK",
      stateCode: "AP",
      localizationKey: "districtMedak",
    ),
    DistrictModel(
      code: "AP_NALGONDA",
      stateCode: "AP",
      localizationKey: "districtNalgonda",
    ),
    DistrictModel(
      code: "AP_NELLORE",
      stateCode: "AP",
      localizationKey: "districtNellore",
    ),
    DistrictModel(
      code: "AP_NIZAMABAD",
      stateCode: "AP",
      localizationKey: "districtNizamabad",
    ),
    DistrictModel(
      code: "AP_PRAKASAM",
      stateCode: "AP",
      localizationKey: "districtPrakasam",
    ),
    DistrictModel(
      code: "AP_RANGAREDDI",
      stateCode: "AP",
      localizationKey: "districtRangareddi",
    ),
    DistrictModel(
      code: "AP_SRIKAKULAM",
      stateCode: "AP",
      localizationKey: "districtSrikakulam",
    ),
    DistrictModel(
      code: "AP_VISAKHAPATNAM",
      stateCode: "AP",
      localizationKey: "districtVisakhapatnam",
    ),
    DistrictModel(
      code: "AP_VIZIANAGARAM",
      stateCode: "AP",
      localizationKey: "districtVizianagaram",
    ),
    DistrictModel(
      code: "AP_WARANGAL",
      stateCode: "AP",
      localizationKey: "districtWarangal",
    ),
    DistrictModel(
      code: "AP_WEST_GODAVARI",
      stateCode: "AP",
      localizationKey: "districtWestGodavari",
    ),
  ],

  // Arunachal Pradesh
  "AR": [
    DistrictModel(
      code: "AR_ANJAW",
      stateCode: "AR",
      localizationKey: "districtAnjaw",
    ),
    DistrictModel(
      code: "AR_CHANGLANG",
      stateCode: "AR",
      localizationKey: "districtChanglang",
    ),
    DistrictModel(
      code: "AR_EAST_KAMENG",
      stateCode: "AR",
      localizationKey: "districtEastKameng",
    ),
    DistrictModel(
      code: "AR_EAST_SIANG",
      stateCode: "AR",
      localizationKey: "districtEastSiang",
    ),
    DistrictModel(
      code: "AR_KURUNG_KUMEY",
      stateCode: "AR",
      localizationKey: "districtKurungKumey",
    ),
    DistrictModel(
      code: "AR_LOHIT",
      stateCode: "AR",
      localizationKey: "districtLohit",
    ),
    DistrictModel(
      code: "AR_LOWER_DIBANG_VALLEY",
      stateCode: "AR",
      localizationKey: "districtLowerDibangValley",
    ),
    DistrictModel(
      code: "AR_LOWER_SUBANSIRI",
      stateCode: "AR",
      localizationKey: "districtLowerSubansiri",
    ),
    DistrictModel(
      code: "AR_PAPUM_PARE",
      stateCode: "AR",
      localizationKey: "districtPapumPare",
    ),
    DistrictModel(
      code: "AR_TAWANG",
      stateCode: "AR",
      localizationKey: "districtTawang",
    ),
    DistrictModel(
      code: "AR_TIRAP",
      stateCode: "AR",
      localizationKey: "districtTirap",
    ),
    DistrictModel(
      code: "AR_UPPER_DIBANG_VALLEY",
      stateCode: "AR",
      localizationKey: "districtUpperDibangValley",
    ),
    DistrictModel(
      code: "AR_UPPER_SIANG",
      stateCode: "AR",
      localizationKey: "districtUpperSiang",
    ),
    DistrictModel(
      code: "AR_UPPER_SUBANSIRI",
      stateCode: "AR",
      localizationKey: "districtUpperSubansiri",
    ),
    DistrictModel(
      code: "AR_WEST_KAMENG",
      stateCode: "AR",
      localizationKey: "districtWestKameng",
    ),
    DistrictModel(
      code: "AR_WEST_SIANG",
      stateCode: "AR",
      localizationKey: "districtWestSiang",
    ),
  ],

  // Assam
  "AS": [
    DistrictModel(
      code: "AS_BAKSA",
      stateCode: "AS",
      localizationKey: "districtBaksa",
    ),
    DistrictModel(
      code: "AS_BARPETA",
      stateCode: "AS",
      localizationKey: "districtBarpeta",
    ),
    DistrictModel(
      code: "AS_BONGAIGAON",
      stateCode: "AS",
      localizationKey: "districtBongaigaon",
    ),
    DistrictModel(
      code: "AS_CACHAR",
      stateCode: "AS",
      localizationKey: "districtCachar",
    ),
    DistrictModel(
      code: "AS_CHIRANG",
      stateCode: "AS",
      localizationKey: "districtChirang",
    ),
    DistrictModel(
      code: "AS_DARRANG",
      stateCode: "AS",
      localizationKey: "districtDarrang",
    ),
    DistrictModel(
      code: "AS_DHEMAJI",
      stateCode: "AS",
      localizationKey: "districtDhemaji",
    ),
    DistrictModel(
      code: "AS_DHUBRI",
      stateCode: "AS",
      localizationKey: "districtDhubri",
    ),
    DistrictModel(
      code: "AS_DIBRUGARH",
      stateCode: "AS",
      localizationKey: "districtDibrugarh",
    ),
    DistrictModel(
      code: "AS_GOALPARA",
      stateCode: "AS",
      localizationKey: "districtGoalpara",
    ),
    DistrictModel(
      code: "AS_GOLAGHAT",
      stateCode: "AS",
      localizationKey: "districtGolaghat",
    ),
    DistrictModel(
      code: "AS_HAILAKANDI",
      stateCode: "AS",
      localizationKey: "districtHailakandi",
    ),
    DistrictModel(
      code: "AS_JORHAT",
      stateCode: "AS",
      localizationKey: "districtJorhat",
    ),
    DistrictModel(
      code: "AS_KAMRUP",
      stateCode: "AS",
      localizationKey: "districtKamrup",
    ),
    DistrictModel(
      code: "AS_KARBI_ANGLONG",
      stateCode: "AS",
      localizationKey: "districtKarbiAnglong",
    ),
    DistrictModel(
      code: "AS_KARIMGANJ",
      stateCode: "AS",
      localizationKey: "districtKarimganj",
    ),
    DistrictModel(
      code: "AS_KOKRAJHAR",
      stateCode: "AS",
      localizationKey: "districtKokrajhar",
    ),
    DistrictModel(
      code: "AS_LAKHIMPUR",
      stateCode: "AS",
      localizationKey: "districtLakhimpur",
    ),
    DistrictModel(
      code: "AS_MARIGAON",
      stateCode: "AS",
      localizationKey: "districtMarigaon",
    ),
    DistrictModel(
      code: "AS_NAGAON",
      stateCode: "AS",
      localizationKey: "districtNagaon",
    ),
    DistrictModel(
      code: "AS_NALBARI",
      stateCode: "AS",
      localizationKey: "districtNalbari",
    ),
    DistrictModel(
      code: "AS_NORTH_CACHAR_HILLS",
      stateCode: "AS",
      localizationKey: "districtNorthCacharHills",
    ),
    DistrictModel(
      code: "AS_SIBSAGAR",
      stateCode: "AS",
      localizationKey: "districtSibsagar",
    ),
    DistrictModel(
      code: "AS_SONITPUR",
      stateCode: "AS",
      localizationKey: "districtSonitpur",
    ),
    DistrictModel(
      code: "AS_TINSUKIA",
      stateCode: "AS",
      localizationKey: "districtTinsukia",
    ),
    DistrictModel(
      code: "AS_UDALGURI",
      stateCode: "AS",
      localizationKey: "districtUdalguri",
    ),
  ],

  // Bihar
  "BR": [
    DistrictModel(
      code: "BR_ARARIA",
      stateCode: "BR",
      localizationKey: "districtAraria",
    ),
    DistrictModel(
      code: "BR_ARWAL",
      stateCode: "BR",
      localizationKey: "districtArwal",
    ),
    DistrictModel(
      code: "BR_AURANGABAD_BI",
      stateCode: "BR",
      localizationKey: "districtAurangabadBi",
    ),
    DistrictModel(
      code: "BR_BANKA",
      stateCode: "BR",
      localizationKey: "districtBanka",
    ),
    DistrictModel(
      code: "BR_BEGUSARAI",
      stateCode: "BR",
      localizationKey: "districtBegusarai",
    ),
    DistrictModel(
      code: "BR_BHAGALPUR",
      stateCode: "BR",
      localizationKey: "districtBhagalpur",
    ),
    DistrictModel(
      code: "BR_BHOJPUR",
      stateCode: "BR",
      localizationKey: "districtBhojpur",
    ),
    DistrictModel(
      code: "BR_BUXAR",
      stateCode: "BR",
      localizationKey: "districtBuxar",
    ),
    DistrictModel(
      code: "BR_DARBHANGA",
      stateCode: "BR",
      localizationKey: "districtDarbhanga",
    ),
    DistrictModel(
      code: "BR_EAST_CHAMPARAN",
      stateCode: "BR",
      localizationKey: "districtEastChamparan",
    ),
    DistrictModel(
      code: "BR_GAYA",
      stateCode: "BR",
      localizationKey: "districtGaya",
    ),
    DistrictModel(
      code: "BR_GOPALGANJ",
      stateCode: "BR",
      localizationKey: "districtGopalganj",
    ),
    DistrictModel(
      code: "BR_JAMUI",
      stateCode: "BR",
      localizationKey: "districtJamui",
    ),
    DistrictModel(
      code: "BR_JEHANABAD",
      stateCode: "BR",
      localizationKey: "districtJehanabad",
    ),
    DistrictModel(
      code: "BR_KAIMUR",
      stateCode: "BR",
      localizationKey: "districtKaimur",
    ),
    DistrictModel(
      code: "BR_KATIHAR",
      stateCode: "BR",
      localizationKey: "districtKatihar",
    ),
    DistrictModel(
      code: "BR_KHAGARIA",
      stateCode: "BR",
      localizationKey: "districtKhagaria",
    ),
    DistrictModel(
      code: "BR_KISHANGANJ",
      stateCode: "BR",
      localizationKey: "districtKishanganj",
    ),
    DistrictModel(
      code: "BR_LAKHISARAI",
      stateCode: "BR",
      localizationKey: "districtLakhisarai",
    ),
    DistrictModel(
      code: "BR_MADHEPURA",
      stateCode: "BR",
      localizationKey: "districtMadhepura",
    ),
    DistrictModel(
      code: "BR_MADHUBANI",
      stateCode: "BR",
      localizationKey: "districtMadhubani",
    ),
    DistrictModel(
      code: "BR_MUNGER",
      stateCode: "BR",
      localizationKey: "districtMunger",
    ),
    DistrictModel(
      code: "BR_MUZAFFARPUR",
      stateCode: "BR",
      localizationKey: "districtMuzaffarpur",
    ),
    DistrictModel(
      code: "BR_NALANDA",
      stateCode: "BR",
      localizationKey: "districtNalanda",
    ),
    DistrictModel(
      code: "BR_NAWADA",
      stateCode: "BR",
      localizationKey: "districtNawada",
    ),
    DistrictModel(
      code: "BR_PATNA",
      stateCode: "BR",
      localizationKey: "districtPatna",
    ),
    DistrictModel(
      code: "BR_PURNIA",
      stateCode: "BR",
      localizationKey: "districtPurnia",
    ),
    DistrictModel(
      code: "BR_ROHTAS",
      stateCode: "BR",
      localizationKey: "districtRohtas",
    ),
    DistrictModel(
      code: "BR_SAHARSA",
      stateCode: "BR",
      localizationKey: "districtSaharsa",
    ),
    DistrictModel(
      code: "BR_SAMASTIPUR",
      stateCode: "BR",
      localizationKey: "districtSamastipur",
    ),
    DistrictModel(
      code: "BR_SARAN",
      stateCode: "BR",
      localizationKey: "districtSaran",
    ),
    DistrictModel(
      code: "BR_SHEIKHPURA",
      stateCode: "BR",
      localizationKey: "districtSheikhpura",
    ),
    DistrictModel(
      code: "BR_SHEOHAR",
      stateCode: "BR",
      localizationKey: "districtSheohar",
    ),
    DistrictModel(
      code: "BR_SITAMARHI",
      stateCode: "BR",
      localizationKey: "districtSitamarhi",
    ),
    DistrictModel(
      code: "BR_SIWAN",
      stateCode: "BR",
      localizationKey: "districtSiwan",
    ),
    DistrictModel(
      code: "BR_SUPAUL",
      stateCode: "BR",
      localizationKey: "districtSupaul",
    ),
    DistrictModel(
      code: "BR_VAISHALI",
      stateCode: "BR",
      localizationKey: "districtVaishali",
    ),
    DistrictModel(
      code: "BR_WEST_CHAMPARAN",
      stateCode: "BR",
      localizationKey: "districtWestChamparan",
    ),
  ],

  // Chhattisgarh
  "CG": [
    DistrictModel(
      code: "CG_BASTAR",
      stateCode: "CG",
      localizationKey: "districtBastar",
    ),
    DistrictModel(
      code: "CG_BILASPUR_CG",
      stateCode: "CG",
      localizationKey: "districtBilaspurCg",
    ),
    DistrictModel(
      code: "CG_DANTEWADA",
      stateCode: "CG",
      localizationKey: "districtDantewada",
    ),
    DistrictModel(
      code: "CG_DHAMTARI",
      stateCode: "CG",
      localizationKey: "districtDhamtari",
    ),
    DistrictModel(
      code: "CG_DURG",
      stateCode: "CG",
      localizationKey: "districtDurg",
    ),
    DistrictModel(
      code: "CG_JANJGIR",
      stateCode: "CG",
      localizationKey: "districtJanjgir",
    ),
    DistrictModel(
      code: "CG_JASHPUR",
      stateCode: "CG",
      localizationKey: "districtJashpur",
    ),
    DistrictModel(
      code: "CG_KANKER",
      stateCode: "CG",
      localizationKey: "districtKanker",
    ),
    DistrictModel(
      code: "CG_KAWARDHA_KABIR_DHAM",
      stateCode: "CG",
      localizationKey: "districtKawardhaKabirDham",
    ),
    DistrictModel(
      code: "CG_KORBA",
      stateCode: "CG",
      localizationKey: "districtKorba",
    ),
    DistrictModel(
      code: "CG_KORIYA",
      stateCode: "CG",
      localizationKey: "districtKoriya",
    ),
    DistrictModel(
      code: "CG_MAHASAMUND",
      stateCode: "CG",
      localizationKey: "districtMahasamund",
    ),
    DistrictModel(
      code: "CG_RAIGARH_CG",
      stateCode: "CG",
      localizationKey: "districtRaigarhCg",
    ),
    DistrictModel(
      code: "CG_RAIPUR",
      stateCode: "CG",
      localizationKey: "districtRaipur",
    ),
    DistrictModel(
      code: "CG_RAJNANDGAON",
      stateCode: "CG",
      localizationKey: "districtRajnandgaon",
    ),
    DistrictModel(
      code: "CG_SURGUJA_AMBIKAPUR",
      stateCode: "CG",
      localizationKey: "districtSurgujaAmbikapur",
    ),
  ],

  // Chandigarh
  "CH": [
    DistrictModel(
      code: "CH_CHANDIGARH",
      stateCode: "CH",
      localizationKey: "districtChandigarh",
    ),
  ],

  // Dadra & Nagar Haveli and Daman & Diu
  "DD": [
    DistrictModel(
      code: "DD_DAMAN",
      stateCode: "DD",
      localizationKey: "districtDaman",
    ),
    DistrictModel(
      code: "DD_DIU",
      stateCode: "DD",
      localizationKey: "districtDiu",
    ),
    DistrictModel(
      code: "DD_DADRA_NAGAR_HAVELI",
      stateCode: "DD",
      localizationKey: "districtDadraNagarHaveli",
    ),
  ],

  // Delhi
  "DL": [
    DistrictModel(
      code: "DL_CENTRAL",
      stateCode: "DL",
      localizationKey: "districtCentral",
    ),
    DistrictModel(
      code: "DL_CITY_ZONE",
      stateCode: "DL",
      localizationKey: "districtCityZone",
    ),
    DistrictModel(
      code: "DL_CIVILI_LINE",
      stateCode: "DL",
      localizationKey: "districtCiviliLine",
    ),
    DistrictModel(
      code: "DL_KAROL_BAGH",
      stateCode: "DL",
      localizationKey: "districtKarolBagh",
    ),
    DistrictModel(
      code: "DL_NAJAFGARH",
      stateCode: "DL",
      localizationKey: "districtNajafgarh",
    ),
    DistrictModel(
      code: "DL_NARELA",
      stateCode: "DL",
      localizationKey: "districtNarela",
    ),
    DistrictModel(
      code: "DL_ROHINI",
      stateCode: "DL",
      localizationKey: "districtRohini",
    ),
    DistrictModel(
      code: "DL_S_PAHAR_GANJ",
      stateCode: "DL",
      localizationKey: "districtSPaharGanj",
    ),
    DistrictModel(
      code: "DL_SHAHADRA_N",
      stateCode: "DL",
      localizationKey: "districtShahadraN",
    ),
    DistrictModel(
      code: "DL_SHAHADRA_S",
      stateCode: "DL",
      localizationKey: "districtShahadraS",
    ),
    DistrictModel(
      code: "DL_SOUTH",
      stateCode: "DL",
      localizationKey: "districtSouth",
    ),
    DistrictModel(
      code: "DL_WEST",
      stateCode: "DL",
      localizationKey: "districtWest",
    ),
  ],

  // Goa
  "GA": [
    DistrictModel(
      code: "GA_GOA",
      stateCode: "GA",
      localizationKey: "districtGoa",
    ),
  ],

  // Gujarat
  "GJ": [
    DistrictModel(
      code: "GJ_AHMEDABAD",
      stateCode: "GJ",
      localizationKey: "districtAhmedabad",
    ),
    DistrictModel(
      code: "GJ_AMRELI",
      stateCode: "GJ",
      localizationKey: "districtAmreli",
    ),
    DistrictModel(
      code: "GJ_ANAND",
      stateCode: "GJ",
      localizationKey: "districtAnand",
    ),
    DistrictModel(
      code: "GJ_BANASKANTHA",
      stateCode: "GJ",
      localizationKey: "districtBanaskantha",
    ),
    DistrictModel(
      code: "GJ_BHARUCH",
      stateCode: "GJ",
      localizationKey: "districtBharuch",
    ),
    DistrictModel(
      code: "GJ_BHAVNAGAR",
      stateCode: "GJ",
      localizationKey: "districtBhavnagar",
    ),
    DistrictModel(
      code: "GJ_DAHOD",
      stateCode: "GJ",
      localizationKey: "districtDahod",
    ),
    DistrictModel(
      code: "GJ_DANG",
      stateCode: "GJ",
      localizationKey: "districtDang",
    ),
    DistrictModel(
      code: "GJ_GANDHINAGAR",
      stateCode: "GJ",
      localizationKey: "districtGandhinagar",
    ),
    DistrictModel(
      code: "GJ_GODHARA",
      stateCode: "GJ",
      localizationKey: "districtGodhara",
    ),
    DistrictModel(
      code: "GJ_JAMNAGAR",
      stateCode: "GJ",
      localizationKey: "districtJamnagar",
    ),
    DistrictModel(
      code: "GJ_JUNAGADH",
      stateCode: "GJ",
      localizationKey: "districtJunagadh",
    ),
    DistrictModel(
      code: "GJ_KHEDA",
      stateCode: "GJ",
      localizationKey: "districtKheda",
    ),
    DistrictModel(
      code: "GJ_KUTCH",
      stateCode: "GJ",
      localizationKey: "districtKutch",
    ),
    DistrictModel(
      code: "GJ_MAHESANA",
      stateCode: "GJ",
      localizationKey: "districtMahesana",
    ),
    DistrictModel(
      code: "GJ_NARMADA",
      stateCode: "GJ",
      localizationKey: "districtNarmada",
    ),
    DistrictModel(
      code: "GJ_NAVSARI",
      stateCode: "GJ",
      localizationKey: "districtNavsari",
    ),
    DistrictModel(
      code: "GJ_PATAN",
      stateCode: "GJ",
      localizationKey: "districtPatan",
    ),
    DistrictModel(
      code: "GJ_PORBANDAR",
      stateCode: "GJ",
      localizationKey: "districtPorbandar",
    ),
    DistrictModel(
      code: "GJ_RAJKOT",
      stateCode: "GJ",
      localizationKey: "districtRajkot",
    ),
    DistrictModel(
      code: "GJ_SABARKANTHA",
      stateCode: "GJ",
      localizationKey: "districtSabarkantha",
    ),
    DistrictModel(
      code: "GJ_SURAT",
      stateCode: "GJ",
      localizationKey: "districtSurat",
    ),
    DistrictModel(
      code: "GJ_SURENDRANAGAR",
      stateCode: "GJ",
      localizationKey: "districtSurendranagar",
    ),
    DistrictModel(
      code: "GJ_VADODARA",
      stateCode: "GJ",
      localizationKey: "districtVadodara",
    ),
    DistrictModel(
      code: "GJ_VALSAD",
      stateCode: "GJ",
      localizationKey: "districtValsad",
    ),
    DistrictModel(
      code: "GJ_TAPI",
      stateCode: "GJ",
      localizationKey: "districtTapi",
    ),
  ],

  // Himachal Pradesh
  "HP": [
    DistrictModel(
      code: "HP_BILASPUR_HP",
      stateCode: "HP",
      localizationKey: "districtBilaspurHp",
    ),
    DistrictModel(
      code: "HP_CHAMBA",
      stateCode: "HP",
      localizationKey: "districtChamba",
    ),
    DistrictModel(
      code: "HP_HAMIRPUR_HP",
      stateCode: "HP",
      localizationKey: "districtHamirpurHp",
    ),
    DistrictModel(
      code: "HP_KANGRA",
      stateCode: "HP",
      localizationKey: "districtKangra",
    ),
    DistrictModel(
      code: "HP_KULLU",
      stateCode: "HP",
      localizationKey: "districtKullu",
    ),
    DistrictModel(
      code: "HP_MANDI",
      stateCode: "HP",
      localizationKey: "districtMandi",
    ),
    DistrictModel(
      code: "HP_SHIMLA",
      stateCode: "HP",
      localizationKey: "districtShimla",
    ),
    DistrictModel(
      code: "HP_SIRMAUR",
      stateCode: "HP",
      localizationKey: "districtSirmaur",
    ),
    DistrictModel(
      code: "HP_SOLAN",
      stateCode: "HP",
      localizationKey: "districtSolan",
    ),
    DistrictModel(
      code: "HP_UNA",
      stateCode: "HP",
      localizationKey: "districtUna",
    ),
  ],

  // Haryana
  "HR": [
    DistrictModel(
      code: "HR_AMBALA",
      stateCode: "HR",
      localizationKey: "districtAmbala",
    ),
    DistrictModel(
      code: "HR_BHIWANI",
      stateCode: "HR",
      localizationKey: "districtBhiwani",
    ),
    DistrictModel(
      code: "HR_FARIDABAD",
      stateCode: "HR",
      localizationKey: "districtFaridabad",
    ),
    DistrictModel(
      code: "HR_FATEHABAD",
      stateCode: "HR",
      localizationKey: "districtFatehabad",
    ),
    DistrictModel(
      code: "HR_GURGAON",
      stateCode: "HR",
      localizationKey: "districtGurgaon",
    ),
    DistrictModel(
      code: "HR_HISAR",
      stateCode: "HR",
      localizationKey: "districtHisar",
    ),
    DistrictModel(
      code: "HR_JHAJJAR",
      stateCode: "HR",
      localizationKey: "districtJhajjar",
    ),
    DistrictModel(
      code: "HR_JIND",
      stateCode: "HR",
      localizationKey: "districtJind",
    ),
    DistrictModel(
      code: "HR_KAITHAL",
      stateCode: "HR",
      localizationKey: "districtKaithal",
    ),
    DistrictModel(
      code: "HR_KARNAL",
      stateCode: "HR",
      localizationKey: "districtKarnal",
    ),
    DistrictModel(
      code: "HR_KURUKSHETRA",
      stateCode: "HR",
      localizationKey: "districtKurukshetra",
    ),
    DistrictModel(
      code: "HR_MEWAT",
      stateCode: "HR",
      localizationKey: "districtMewat",
    ),
    DistrictModel(
      code: "HR_NARNAUL",
      stateCode: "HR",
      localizationKey: "districtNarnaul",
    ),
    DistrictModel(
      code: "HR_PALWAL",
      stateCode: "HR",
      localizationKey: "districtPalwal",
    ),
    DistrictModel(
      code: "HR_PANCHKULA",
      stateCode: "HR",
      localizationKey: "districtPanchkula",
    ),
    DistrictModel(
      code: "HR_PANIPAT",
      stateCode: "HR",
      localizationKey: "districtPanipat",
    ),
    DistrictModel(
      code: "HR_REWARI",
      stateCode: "HR",
      localizationKey: "districtRewari",
    ),
    DistrictModel(
      code: "HR_ROHTAK",
      stateCode: "HR",
      localizationKey: "districtRohtak",
    ),
    DistrictModel(
      code: "HR_SIRSA",
      stateCode: "HR",
      localizationKey: "districtSirsa",
    ),
    DistrictModel(
      code: "HR_SONIPAT",
      stateCode: "HR",
      localizationKey: "districtSonipat",
    ),
    DistrictModel(
      code: "HR_YAMUNANAGAR",
      stateCode: "HR",
      localizationKey: "districtYamunanagar",
    ),
  ],

  // Jharkhand
  "JH": [
    DistrictModel(
      code: "JH_BOKARO",
      stateCode: "JH",
      localizationKey: "districtBokaro",
    ),
    DistrictModel(
      code: "JH_CHATRA",
      stateCode: "JH",
      localizationKey: "districtChatra",
    ),
    DistrictModel(
      code: "JH_DEOGARH",
      stateCode: "JH",
      localizationKey: "districtDeogarh",
    ),
    DistrictModel(
      code: "JH_DHANBAD",
      stateCode: "JH",
      localizationKey: "districtDhanbad",
    ),
    DistrictModel(
      code: "JH_DUMKA",
      stateCode: "JH",
      localizationKey: "districtDumka",
    ),
    DistrictModel(
      code: "JH_EAST_SINGHBHUM",
      stateCode: "JH",
      localizationKey: "districtEastSinghbhum",
    ),
    DistrictModel(
      code: "JH_GARHWA",
      stateCode: "JH",
      localizationKey: "districtGarhwa",
    ),
    DistrictModel(
      code: "JH_GIRIDIH",
      stateCode: "JH",
      localizationKey: "districtGiridih",
    ),
    DistrictModel(
      code: "JH_GODDA",
      stateCode: "JH",
      localizationKey: "districtGodda",
    ),
    DistrictModel(
      code: "JH_GUMLA",
      stateCode: "JH",
      localizationKey: "districtGumla",
    ),
    DistrictModel(
      code: "JH_HAZARIBAGH",
      stateCode: "JH",
      localizationKey: "districtHazaribagh",
    ),
    DistrictModel(
      code: "JH_JAMTARA",
      stateCode: "JH",
      localizationKey: "districtJamtara",
    ),
    DistrictModel(
      code: "JH_KODARMA",
      stateCode: "JH",
      localizationKey: "districtKodarma",
    ),
    DistrictModel(
      code: "JH_LATHEHAR",
      stateCode: "JH",
      localizationKey: "districtLathehar",
    ),
    DistrictModel(
      code: "JH_LOHARDAGA",
      stateCode: "JH",
      localizationKey: "districtLohardaga",
    ),
    DistrictModel(
      code: "JH_PAKUR",
      stateCode: "JH",
      localizationKey: "districtPakur",
    ),
    DistrictModel(
      code: "JH_PALAMU",
      stateCode: "JH",
      localizationKey: "districtPalamu",
    ),
    DistrictModel(
      code: "JH_RANCHI",
      stateCode: "JH",
      localizationKey: "districtRanchi",
    ),
    DistrictModel(
      code: "JH_SAHIBGANJ",
      stateCode: "JH",
      localizationKey: "districtSahibganj",
    ),
    DistrictModel(
      code: "JH_SARAIKELA_KHARSAWAN",
      stateCode: "JH",
      localizationKey: "districtSaraikelaKharsawan",
    ),
    DistrictModel(
      code: "JH_SIMDEGA",
      stateCode: "JH",
      localizationKey: "districtSimdega",
    ),
    DistrictModel(
      code: "JH_WEST_SINGHBHUM",
      stateCode: "JH",
      localizationKey: "districtWestSinghbhum",
    ),
  ],

  // Jammu & Kashmir
  "JK": [
    DistrictModel(
      code: "JK_BARAMULA",
      stateCode: "JK",
      localizationKey: "districtBaramula",
    ),
    DistrictModel(
      code: "JK_DODA",
      stateCode: "JK",
      localizationKey: "districtDoda",
    ),
    DistrictModel(
      code: "JK_JAMMU",
      stateCode: "JK",
      localizationKey: "districtJammu",
    ),
    DistrictModel(
      code: "JK_KATHUA",
      stateCode: "JK",
      localizationKey: "districtKathua",
    ),
    DistrictModel(
      code: "JK_KISHTWAR",
      stateCode: "JK",
      localizationKey: "districtKishtwar",
    ),
    DistrictModel(
      code: "JK_POONCH",
      stateCode: "JK",
      localizationKey: "districtPoonch",
    ),
    DistrictModel(
      code: "JK_RAJOURI",
      stateCode: "JK",
      localizationKey: "districtRajouri",
    ),
    DistrictModel(
      code: "JK_RAMBAN",
      stateCode: "JK",
      localizationKey: "districtRamban",
    ),
    DistrictModel(
      code: "JK_REASI",
      stateCode: "JK",
      localizationKey: "districtReasi",
    ),
    DistrictModel(
      code: "JK_SAMBHA",
      stateCode: "JK",
      localizationKey: "districtSambha",
    ),
    DistrictModel(
      code: "JK_UDHAMPUR",
      stateCode: "JK",
      localizationKey: "districtUdhampur",
    ),
  ],

  // Karnataka
  "KA": [
    DistrictModel(
      code: "KA_BAGALKOT",
      stateCode: "KA",
      localizationKey: "districtBagalkot",
    ),
    DistrictModel(
      code: "KA_BANGALORE_RURAL",
      stateCode: "KA",
      localizationKey: "districtBangaloreRural",
    ),
    DistrictModel(
      code: "KA_BANGALORE_URBAN",
      stateCode: "KA",
      localizationKey: "districtBangaloreUrban",
    ),
    DistrictModel(
      code: "KA_BELGAUM",
      stateCode: "KA",
      localizationKey: "districtBelgaum",
    ),
    DistrictModel(
      code: "KA_BELLARY",
      stateCode: "KA",
      localizationKey: "districtBellary",
    ),
    DistrictModel(
      code: "KA_BIDAR",
      stateCode: "KA",
      localizationKey: "districtBidar",
    ),
    DistrictModel(
      code: "KA_BIJAPUR",
      stateCode: "KA",
      localizationKey: "districtBijapur",
    ),
    DistrictModel(
      code: "KA_CHAMARAJANAGAR",
      stateCode: "KA",
      localizationKey: "districtChamarajanagar",
    ),
    DistrictModel(
      code: "KA_CHIKKABALLAPUR",
      stateCode: "KA",
      localizationKey: "districtChikkaballapur",
    ),
    DistrictModel(
      code: "KA_CHIKMAGALUR",
      stateCode: "KA",
      localizationKey: "districtChikmagalur",
    ),
    DistrictModel(
      code: "KA_CHITRADURGA",
      stateCode: "KA",
      localizationKey: "districtChitradurga",
    ),
    DistrictModel(
      code: "KA_DAKSHINA_KANNADA",
      stateCode: "KA",
      localizationKey: "districtDakshinaKannada",
    ),
    DistrictModel(
      code: "KA_DAVANAGERE",
      stateCode: "KA",
      localizationKey: "districtDavanagere",
    ),
    DistrictModel(
      code: "KA_DHARWAD",
      stateCode: "KA",
      localizationKey: "districtDharwad",
    ),
    DistrictModel(
      code: "KA_GADAG",
      stateCode: "KA",
      localizationKey: "districtGadag",
    ),
    DistrictModel(
      code: "KA_GULBARGA",
      stateCode: "KA",
      localizationKey: "districtGulbarga",
    ),
    DistrictModel(
      code: "KA_HASSAN",
      stateCode: "KA",
      localizationKey: "districtHassan",
    ),
    DistrictModel(
      code: "KA_HAVERI",
      stateCode: "KA",
      localizationKey: "districtHaveri",
    ),
    DistrictModel(
      code: "KA_KODAGU",
      stateCode: "KA",
      localizationKey: "districtKodagu",
    ),
    DistrictModel(
      code: "KA_KOLAR",
      stateCode: "KA",
      localizationKey: "districtKolar",
    ),
    DistrictModel(
      code: "KA_KOPPAL",
      stateCode: "KA",
      localizationKey: "districtKoppal",
    ),
    DistrictModel(
      code: "KA_MANDYA",
      stateCode: "KA",
      localizationKey: "districtMandya",
    ),
    DistrictModel(
      code: "KA_MYSORE",
      stateCode: "KA",
      localizationKey: "districtMysore",
    ),
    DistrictModel(
      code: "KA_RAICHUR",
      stateCode: "KA",
      localizationKey: "districtRaichur",
    ),
    DistrictModel(
      code: "KA_RAMANAGARA",
      stateCode: "KA",
      localizationKey: "districtRamanagara",
    ),
    DistrictModel(
      code: "KA_SHIMOGA",
      stateCode: "KA",
      localizationKey: "districtShimoga",
    ),
    DistrictModel(
      code: "KA_TUMKUR",
      stateCode: "KA",
      localizationKey: "districtTumkur",
    ),
    DistrictModel(
      code: "KA_UDUPI",
      stateCode: "KA",
      localizationKey: "districtUdupi",
    ),
    DistrictModel(
      code: "KA_UTTARA_KANNADA",
      stateCode: "KA",
      localizationKey: "districtUttaraKannada",
    ),
  ],

  // Kerala
  "KL": [
    DistrictModel(
      code: "KL_ALAPPUZHA",
      stateCode: "KL",
      localizationKey: "districtAlappuzha",
    ),
    DistrictModel(
      code: "KL_ERNAKULAM",
      stateCode: "KL",
      localizationKey: "districtErnakulam",
    ),
    DistrictModel(
      code: "KL_IDUKKI",
      stateCode: "KL",
      localizationKey: "districtIdukki",
    ),
    DistrictModel(
      code: "KL_KANNUR",
      stateCode: "KL",
      localizationKey: "districtKannur",
    ),
    DistrictModel(
      code: "KL_KASARAGOD",
      stateCode: "KL",
      localizationKey: "districtKasaragod",
    ),
    DistrictModel(
      code: "KL_KOLLAM",
      stateCode: "KL",
      localizationKey: "districtKollam",
    ),
    DistrictModel(
      code: "KL_KOTTAYAM",
      stateCode: "KL",
      localizationKey: "districtKottayam",
    ),
    DistrictModel(
      code: "KL_KOZHIKODE",
      stateCode: "KL",
      localizationKey: "districtKozhikode",
    ),
    DistrictModel(
      code: "KL_MALAPPURAM",
      stateCode: "KL",
      localizationKey: "districtMalappuram",
    ),
    DistrictModel(
      code: "KL_PALAKKAD",
      stateCode: "KL",
      localizationKey: "districtPalakkad",
    ),
    DistrictModel(
      code: "KL_PATHANAMTHITTA",
      stateCode: "KL",
      localizationKey: "districtPathanamthitta",
    ),
    DistrictModel(
      code: "KL_THIRUVANANTHAPURAM",
      stateCode: "KL",
      localizationKey: "districtThiruvananthapuram",
    ),
    DistrictModel(
      code: "KL_THRISSUR",
      stateCode: "KL",
      localizationKey: "districtThrissur",
    ),
    DistrictModel(
      code: "KL_WAYANAD",
      stateCode: "KL",
      localizationKey: "districtWayanad",
    ),
  ],

  // Ladakh (no district data available yet)
  "LA": [],

  // Lakshadweep
  "LD": [
    DistrictModel(
      code: "LD_LAKSHADWEEP",
      stateCode: "LD",
      localizationKey: "districtLakshadweep",
    ),
  ],

  // Maharashtra
  "MH": [
    DistrictModel(
      code: "MH_AHMEDNAGAR",
      stateCode: "MH",
      localizationKey: "districtAhmednagar",
    ),
    DistrictModel(
      code: "MH_AKOLA",
      stateCode: "MH",
      localizationKey: "districtAkola",
    ),
    DistrictModel(
      code: "MH_AMARAVATI",
      stateCode: "MH",
      localizationKey: "districtAmaravati",
    ),
    DistrictModel(
      code: "MH_AURANGABAD",
      stateCode: "MH",
      localizationKey: "districtAurangabad",
    ),
    DistrictModel(
      code: "MH_BEED",
      stateCode: "MH",
      localizationKey: "districtBeed",
    ),
    DistrictModel(
      code: "MH_BHANDARA",
      stateCode: "MH",
      localizationKey: "districtBhandara",
    ),
    DistrictModel(
      code: "MH_BULDANA",
      stateCode: "MH",
      localizationKey: "districtBuldana",
    ),
    DistrictModel(
      code: "MH_CHANDRAPUR",
      stateCode: "MH",
      localizationKey: "districtChandrapur",
    ),
    DistrictModel(
      code: "MH_DHULE",
      stateCode: "MH",
      localizationKey: "districtDhule",
    ),
    DistrictModel(
      code: "MH_GADCHIROLI",
      stateCode: "MH",
      localizationKey: "districtGadchiroli",
    ),
    DistrictModel(
      code: "MH_GONDIA",
      stateCode: "MH",
      localizationKey: "districtGondia",
    ),
    DistrictModel(
      code: "MH_HINGOLI",
      stateCode: "MH",
      localizationKey: "districtHingoli",
    ),
    DistrictModel(
      code: "MH_JALGAON",
      stateCode: "MH",
      localizationKey: "districtJalgaon",
    ),
    DistrictModel(
      code: "MH_JALNA",
      stateCode: "MH",
      localizationKey: "districtJalna",
    ),
    DistrictModel(
      code: "MH_KOLHAPUR",
      stateCode: "MH",
      localizationKey: "districtKolhapur",
    ),
    DistrictModel(
      code: "MH_LATUR",
      stateCode: "MH",
      localizationKey: "districtLatur",
    ),
    DistrictModel(
      code: "MH_NAGPUR",
      stateCode: "MH",
      localizationKey: "districtNagpur",
    ),
    DistrictModel(
      code: "MH_NANDED",
      stateCode: "MH",
      localizationKey: "districtNanded",
    ),
    DistrictModel(
      code: "MH_NANDURBAR",
      stateCode: "MH",
      localizationKey: "districtNandurbar",
    ),
    DistrictModel(
      code: "MH_NASIK",
      stateCode: "MH",
      localizationKey: "districtNasik",
    ),
    DistrictModel(
      code: "MH_OSMANABAD",
      stateCode: "MH",
      localizationKey: "districtOsmanabad",
    ),
    DistrictModel(
      code: "MH_PARBHANI",
      stateCode: "MH",
      localizationKey: "districtParbhani",
    ),
    DistrictModel(
      code: "MH_PUNE",
      stateCode: "MH",
      localizationKey: "districtPune",
    ),
    DistrictModel(
      code: "MH_RAIGAD",
      stateCode: "MH",
      localizationKey: "districtRaigad",
    ),
    DistrictModel(
      code: "MH_RATNAGIRI",
      stateCode: "MH",
      localizationKey: "districtRatnagiri",
    ),
    DistrictModel(
      code: "MH_SANGLI",
      stateCode: "MH",
      localizationKey: "districtSangli",
    ),
    DistrictModel(
      code: "MH_SATARA",
      stateCode: "MH",
      localizationKey: "districtSatara",
    ),
    DistrictModel(
      code: "MH_SINDHUDURG",
      stateCode: "MH",
      localizationKey: "districtSindhudurg",
    ),
    DistrictModel(
      code: "MH_SOLAPUR",
      stateCode: "MH",
      localizationKey: "districtSolapur",
    ),
    DistrictModel(
      code: "MH_THANE",
      stateCode: "MH",
      localizationKey: "districtThane",
    ),
    DistrictModel(
      code: "MH_WARDHA",
      stateCode: "MH",
      localizationKey: "districtWardha",
    ),
    DistrictModel(
      code: "MH_WASHIM",
      stateCode: "MH",
      localizationKey: "districtWashim",
    ),
    DistrictModel(
      code: "MH_YAWATMAL",
      stateCode: "MH",
      localizationKey: "districtYawatmal",
    ),
  ],

  // Meghalaya
  "ML": [
    DistrictModel(
      code: "ML_BHOI",
      stateCode: "ML",
      localizationKey: "districtBhoi",
    ),
    DistrictModel(
      code: "ML_EAST_GARO_HILLS",
      stateCode: "ML",
      localizationKey: "districtEastGaroHills",
    ),
    DistrictModel(
      code: "ML_EAST_KHASI_HILLS",
      stateCode: "ML",
      localizationKey: "districtEastKhasiHills",
    ),
    DistrictModel(
      code: "ML_JAINTIA_HILLS",
      stateCode: "ML",
      localizationKey: "districtJaintiaHills",
    ),
    DistrictModel(
      code: "ML_SOUTH_GARO_HILLS",
      stateCode: "ML",
      localizationKey: "districtSouthGaroHills",
    ),
    DistrictModel(
      code: "ML_WEST_GARO_HILLS",
      stateCode: "ML",
      localizationKey: "districtWestGaroHills",
    ),
    DistrictModel(
      code: "ML_WEST_KHASI_HILLS",
      stateCode: "ML",
      localizationKey: "districtWestKhasiHills",
    ),
  ],

  // Manipur
  "MN": [
    DistrictModel(
      code: "MN_BISHNUPUR",
      stateCode: "MN",
      localizationKey: "districtBishnupur",
    ),
    DistrictModel(
      code: "MN_CHANDEL",
      stateCode: "MN",
      localizationKey: "districtChandel",
    ),
    DistrictModel(
      code: "MN_CHURACHANDPUR",
      stateCode: "MN",
      localizationKey: "districtChurachandpur",
    ),
    DistrictModel(
      code: "MN_IMPHAL_EAST",
      stateCode: "MN",
      localizationKey: "districtImphalEast",
    ),
    DistrictModel(
      code: "MN_IMPHAL_WEST",
      stateCode: "MN",
      localizationKey: "districtImphalWest",
    ),
    DistrictModel(
      code: "MN_KANGPOKPI",
      stateCode: "MN",
      localizationKey: "districtKangpokpi",
    ),
    DistrictModel(
      code: "MN_SENAPATI",
      stateCode: "MN",
      localizationKey: "districtSenapati",
    ),
    DistrictModel(
      code: "MN_TAMENGLONG",
      stateCode: "MN",
      localizationKey: "districtTamenglong",
    ),
    DistrictModel(
      code: "MN_THOUBAL",
      stateCode: "MN",
      localizationKey: "districtThoubal",
    ),
    DistrictModel(
      code: "MN_UKHRUL",
      stateCode: "MN",
      localizationKey: "districtUkhrul",
    ),
  ],

  // Madhya Pradesh
  "MP": [
    DistrictModel(
      code: "MP_ANUPUR",
      stateCode: "MP",
      localizationKey: "districtAnupur",
    ),
    DistrictModel(
      code: "MP_ASHOK_NAGAR",
      stateCode: "MP",
      localizationKey: "districtAshokNagar",
    ),
    DistrictModel(
      code: "MP_BALAGHAT",
      stateCode: "MP",
      localizationKey: "districtBalaghat",
    ),
    DistrictModel(
      code: "MP_BARWANI",
      stateCode: "MP",
      localizationKey: "districtBarwani",
    ),
    DistrictModel(
      code: "MP_BETUL",
      stateCode: "MP",
      localizationKey: "districtBetul",
    ),
    DistrictModel(
      code: "MP_BHIND",
      stateCode: "MP",
      localizationKey: "districtBhind",
    ),
    DistrictModel(
      code: "MP_BHOPAL",
      stateCode: "MP",
      localizationKey: "districtBhopal",
    ),
    DistrictModel(
      code: "MP_BURHANPUR",
      stateCode: "MP",
      localizationKey: "districtBurhanpur",
    ),
    DistrictModel(
      code: "MP_CHHATARPUR",
      stateCode: "MP",
      localizationKey: "districtChhatarpur",
    ),
    DistrictModel(
      code: "MP_CHHINDWARA",
      stateCode: "MP",
      localizationKey: "districtChhindwara",
    ),
    DistrictModel(
      code: "MP_DAMOH",
      stateCode: "MP",
      localizationKey: "districtDamoh",
    ),
    DistrictModel(
      code: "MP_DATIA",
      stateCode: "MP",
      localizationKey: "districtDatia",
    ),
    DistrictModel(
      code: "MP_DEWAS",
      stateCode: "MP",
      localizationKey: "districtDewas",
    ),
    DistrictModel(
      code: "MP_DHAR",
      stateCode: "MP",
      localizationKey: "districtDhar",
    ),
    DistrictModel(
      code: "MP_DINDORI",
      stateCode: "MP",
      localizationKey: "districtDindori",
    ),
    DistrictModel(
      code: "MP_GUNA",
      stateCode: "MP",
      localizationKey: "districtGuna",
    ),
    DistrictModel(
      code: "MP_GWALIOR",
      stateCode: "MP",
      localizationKey: "districtGwalior",
    ),
    DistrictModel(
      code: "MP_HARDA",
      stateCode: "MP",
      localizationKey: "districtHarda",
    ),
    DistrictModel(
      code: "MP_HOSHANGABAD",
      stateCode: "MP",
      localizationKey: "districtHoshangabad",
    ),
    DistrictModel(
      code: "MP_INDORE",
      stateCode: "MP",
      localizationKey: "districtIndore",
    ),
    DistrictModel(
      code: "MP_JABALPUR",
      stateCode: "MP",
      localizationKey: "districtJabalpur",
    ),
    DistrictModel(
      code: "MP_JHABUA",
      stateCode: "MP",
      localizationKey: "districtJhabua",
    ),
    DistrictModel(
      code: "MP_KATNI",
      stateCode: "MP",
      localizationKey: "districtKatni",
    ),
    DistrictModel(
      code: "MP_KHANDWA",
      stateCode: "MP",
      localizationKey: "districtKhandwa",
    ),
    DistrictModel(
      code: "MP_KHARGONE",
      stateCode: "MP",
      localizationKey: "districtKhargone",
    ),
    DistrictModel(
      code: "MP_MANDLA",
      stateCode: "MP",
      localizationKey: "districtMandla",
    ),
    DistrictModel(
      code: "MP_MANDSAUR",
      stateCode: "MP",
      localizationKey: "districtMandsaur",
    ),
    DistrictModel(
      code: "MP_MORENA",
      stateCode: "MP",
      localizationKey: "districtMorena",
    ),
    DistrictModel(
      code: "MP_NARSINGHPUR",
      stateCode: "MP",
      localizationKey: "districtNarsinghpur",
    ),
    DistrictModel(
      code: "MP_NEEMUCH",
      stateCode: "MP",
      localizationKey: "districtNeemuch",
    ),
    DistrictModel(
      code: "MP_PANNA",
      stateCode: "MP",
      localizationKey: "districtPanna",
    ),
    DistrictModel(
      code: "MP_RAISEN",
      stateCode: "MP",
      localizationKey: "districtRaisen",
    ),
    DistrictModel(
      code: "MP_RAJGARH",
      stateCode: "MP",
      localizationKey: "districtRajgarh",
    ),
    DistrictModel(
      code: "MP_RATLAM",
      stateCode: "MP",
      localizationKey: "districtRatlam",
    ),
    DistrictModel(
      code: "MP_REWA",
      stateCode: "MP",
      localizationKey: "districtRewa",
    ),
    DistrictModel(
      code: "MP_SAGAR",
      stateCode: "MP",
      localizationKey: "districtSagar",
    ),
    DistrictModel(
      code: "MP_SATNA",
      stateCode: "MP",
      localizationKey: "districtSatna",
    ),
    DistrictModel(
      code: "MP_SEONI",
      stateCode: "MP",
      localizationKey: "districtSeoni",
    ),
    DistrictModel(
      code: "MP_SHAHDOL",
      stateCode: "MP",
      localizationKey: "districtShahdol",
    ),
    DistrictModel(
      code: "MP_SHAJAPUR",
      stateCode: "MP",
      localizationKey: "districtShajapur",
    ),
    DistrictModel(
      code: "MP_SHEOPUR",
      stateCode: "MP",
      localizationKey: "districtSheopur",
    ),
    DistrictModel(
      code: "MP_SHIVPURI",
      stateCode: "MP",
      localizationKey: "districtShivpuri",
    ),
    DistrictModel(
      code: "MP_SIDHI",
      stateCode: "MP",
      localizationKey: "districtSidhi",
    ),
    DistrictModel(
      code: "MP_TIKAMGARH",
      stateCode: "MP",
      localizationKey: "districtTikamgarh",
    ),
    DistrictModel(
      code: "MP_UJJAIN",
      stateCode: "MP",
      localizationKey: "districtUjjain",
    ),
    DistrictModel(
      code: "MP_UMARIA",
      stateCode: "MP",
      localizationKey: "districtUmaria",
    ),
    DistrictModel(
      code: "MP_VIDISHA",
      stateCode: "MP",
      localizationKey: "districtVidisha",
    ),
  ],

  // Mizoram
  "MZ": [
    DistrictModel(
      code: "MZ_AIZAWAL_WEST",
      stateCode: "MZ",
      localizationKey: "districtAizawalWest",
    ),
    DistrictModel(
      code: "MZ_AIZAWL_EAST",
      stateCode: "MZ",
      localizationKey: "districtAizawlEast",
    ),
    DistrictModel(
      code: "MZ_CHAMPHAI",
      stateCode: "MZ",
      localizationKey: "districtChamphai",
    ),
    DistrictModel(
      code: "MZ_KOLASIB",
      stateCode: "MZ",
      localizationKey: "districtKolasib",
    ),
    DistrictModel(
      code: "MZ_LAWNGTLAI",
      stateCode: "MZ",
      localizationKey: "districtLawngtlai",
    ),
    DistrictModel(
      code: "MZ_LUNGLEI",
      stateCode: "MZ",
      localizationKey: "districtLunglei",
    ),
    DistrictModel(
      code: "MZ_MAMIT",
      stateCode: "MZ",
      localizationKey: "districtMamit",
    ),
    DistrictModel(
      code: "MZ_SAIHA",
      stateCode: "MZ",
      localizationKey: "districtSaiha",
    ),
    DistrictModel(
      code: "MZ_SERCHHIP",
      stateCode: "MZ",
      localizationKey: "districtSerchhip",
    ),
  ],

  // Nagaland
  "NL": [
    DistrictModel(
      code: "NL_DIMAPUR",
      stateCode: "NL",
      localizationKey: "districtDimapur",
    ),
    DistrictModel(
      code: "NL_KIPHIRE",
      stateCode: "NL",
      localizationKey: "districtKiphire",
    ),
    DistrictModel(
      code: "NL_KOHIMA",
      stateCode: "NL",
      localizationKey: "districtKohima",
    ),
    DistrictModel(
      code: "NL_LONGLENG",
      stateCode: "NL",
      localizationKey: "districtLongleng",
    ),
    DistrictModel(
      code: "NL_MOKOKCHUNG",
      stateCode: "NL",
      localizationKey: "districtMokokchung",
    ),
    DistrictModel(
      code: "NL_MON",
      stateCode: "NL",
      localizationKey: "districtMon",
    ),
    DistrictModel(
      code: "NL_PEREN",
      stateCode: "NL",
      localizationKey: "districtPeren",
    ),
    DistrictModel(
      code: "NL_PHEK",
      stateCode: "NL",
      localizationKey: "districtPhek",
    ),
    DistrictModel(
      code: "NL_TUENSANG",
      stateCode: "NL",
      localizationKey: "districtTuensang",
    ),
    DistrictModel(
      code: "NL_WOKHA",
      stateCode: "NL",
      localizationKey: "districtWokha",
    ),
    DistrictModel(
      code: "NL_ZUNHEBOTO",
      stateCode: "NL",
      localizationKey: "districtZunheboto",
    ),
  ],

  // Odisha
  "OD": [
    DistrictModel(
      code: "OD_ANGUL",
      stateCode: "OD",
      localizationKey: "districtAngul",
    ),
    DistrictModel(
      code: "OD_BALANGIR",
      stateCode: "OD",
      localizationKey: "districtBalangir",
    ),
    DistrictModel(
      code: "OD_BALESHWAR",
      stateCode: "OD",
      localizationKey: "districtBaleshwar",
    ),
    DistrictModel(
      code: "OD_BARGARH",
      stateCode: "OD",
      localizationKey: "districtBargarh",
    ),
    DistrictModel(
      code: "OD_BAUDH",
      stateCode: "OD",
      localizationKey: "districtBaudh",
    ),
    DistrictModel(
      code: "OD_BHADRAK",
      stateCode: "OD",
      localizationKey: "districtBhadrak",
    ),
    DistrictModel(
      code: "OD_CUTTACK",
      stateCode: "OD",
      localizationKey: "districtCuttack",
    ),
    DistrictModel(
      code: "OD_DEBAGARH",
      stateCode: "OD",
      localizationKey: "districtDebagarh",
    ),
    DistrictModel(
      code: "OD_DHENKANAL",
      stateCode: "OD",
      localizationKey: "districtDhenkanal",
    ),
    DistrictModel(
      code: "OD_GAJAPATI",
      stateCode: "OD",
      localizationKey: "districtGajapati",
    ),
    DistrictModel(
      code: "OD_GANJAM",
      stateCode: "OD",
      localizationKey: "districtGanjam",
    ),
    DistrictModel(
      code: "OD_JAGATSINGHAPUR",
      stateCode: "OD",
      localizationKey: "districtJagatsinghapur",
    ),
    DistrictModel(
      code: "OD_JAJPUR",
      stateCode: "OD",
      localizationKey: "districtJajpur",
    ),
    DistrictModel(
      code: "OD_JHARSUGUDA",
      stateCode: "OD",
      localizationKey: "districtJharsuguda",
    ),
    DistrictModel(
      code: "OD_KALAHANDI",
      stateCode: "OD",
      localizationKey: "districtKalahandi",
    ),
    DistrictModel(
      code: "OD_KANDHAMAL",
      stateCode: "OD",
      localizationKey: "districtKandhamal",
    ),
    DistrictModel(
      code: "OD_KENDRAPARA",
      stateCode: "OD",
      localizationKey: "districtKendrapara",
    ),
    DistrictModel(
      code: "OD_KEONJHAR",
      stateCode: "OD",
      localizationKey: "districtKeonjhar",
    ),
    DistrictModel(
      code: "OD_KHURDA",
      stateCode: "OD",
      localizationKey: "districtKhurda",
    ),
    DistrictModel(
      code: "OD_KORAPUT",
      stateCode: "OD",
      localizationKey: "districtKoraput",
    ),
    DistrictModel(
      code: "OD_MALKANGIRI",
      stateCode: "OD",
      localizationKey: "districtMalkangiri",
    ),
    DistrictModel(
      code: "OD_MAYURBHANJ",
      stateCode: "OD",
      localizationKey: "districtMayurbhanj",
    ),
    DistrictModel(
      code: "OD_NABARANGAPUR",
      stateCode: "OD",
      localizationKey: "districtNabarangapur",
    ),
    DistrictModel(
      code: "OD_NAYAGARH",
      stateCode: "OD",
      localizationKey: "districtNayagarh",
    ),
    DistrictModel(
      code: "OD_NUAPADA",
      stateCode: "OD",
      localizationKey: "districtNuapada",
    ),
    DistrictModel(
      code: "OD_PURI",
      stateCode: "OD",
      localizationKey: "districtPuri",
    ),
    DistrictModel(
      code: "OD_RAYAGADA",
      stateCode: "OD",
      localizationKey: "districtRayagada",
    ),
    DistrictModel(
      code: "OD_SAMBALPUR",
      stateCode: "OD",
      localizationKey: "districtSambalpur",
    ),
    DistrictModel(
      code: "OD_SONAPUR_SUBARNAPUR",
      stateCode: "OD",
      localizationKey: "districtSonapurSubarnapur",
    ),
    DistrictModel(
      code: "OD_SUNDARGARH",
      stateCode: "OD",
      localizationKey: "districtSundargarh",
    ),
  ],

  // Punjab
  "PB": [
    DistrictModel(
      code: "PB_AMRITSAR",
      stateCode: "PB",
      localizationKey: "districtAmritsar",
    ),
    DistrictModel(
      code: "PB_BATHINDA",
      stateCode: "PB",
      localizationKey: "districtBathinda",
    ),
    DistrictModel(
      code: "PB_BARNALA",
      stateCode: "PB",
      localizationKey: "districtBarnala",
    ),
    DistrictModel(
      code: "PB_FARIDKOT",
      stateCode: "PB",
      localizationKey: "districtFaridkot",
    ),
    DistrictModel(
      code: "PB_FATEGARH_SAHIB",
      stateCode: "PB",
      localizationKey: "districtFategarhSahib",
    ),
    DistrictModel(
      code: "PB_FIROZPUR",
      stateCode: "PB",
      localizationKey: "districtFirozpur",
    ),
    DistrictModel(
      code: "PB_GURDASPUR",
      stateCode: "PB",
      localizationKey: "districtGurdaspur",
    ),
    DistrictModel(
      code: "PB_HOSHIARPUR",
      stateCode: "PB",
      localizationKey: "districtHoshiarpur",
    ),
    DistrictModel(
      code: "PB_JALANDHAR",
      stateCode: "PB",
      localizationKey: "districtJalandhar",
    ),
    DistrictModel(
      code: "PB_KAPURTHALA",
      stateCode: "PB",
      localizationKey: "districtKapurthala",
    ),
    DistrictModel(
      code: "PB_LUDHIANA",
      stateCode: "PB",
      localizationKey: "districtLudhiana",
    ),
    DistrictModel(
      code: "PB_MANSA_PU",
      stateCode: "PB",
      localizationKey: "districtMansaPu",
    ),
    DistrictModel(
      code: "PB_MOGA",
      stateCode: "PB",
      localizationKey: "districtMoga",
    ),
    DistrictModel(
      code: "PB_MOHALI_SASNAGAR",
      stateCode: "PB",
      localizationKey: "districtMohaliSasnagar",
    ),
    DistrictModel(
      code: "PB_MUKATSAR",
      stateCode: "PB",
      localizationKey: "districtMukatsar",
    ),
    DistrictModel(
      code: "PB_NAWANSHAHR",
      stateCode: "PB",
      localizationKey: "districtNawanshahr",
    ),
    DistrictModel(
      code: "PB_PATIALA",
      stateCode: "PB",
      localizationKey: "districtPatiala",
    ),
    DistrictModel(
      code: "PB_RUPNAGAR_ROPAR",
      stateCode: "PB",
      localizationKey: "districtRupnagarRopar",
    ),
    DistrictModel(
      code: "PB_SANGRUR",
      stateCode: "PB",
      localizationKey: "districtSangrur",
    ),
    DistrictModel(
      code: "PB_TARN_TARAN",
      stateCode: "PB",
      localizationKey: "districtTarnTaran",
    ),
  ],

  // Puducherry
  "PY": [
    DistrictModel(
      code: "PY_PONDICHERRY",
      stateCode: "PY",
      localizationKey: "districtPondicherry",
    ),
  ],

  // Rajasthan
  "RJ": [
    DistrictModel(
      code: "RJ_AJMER",
      stateCode: "RJ",
      localizationKey: "districtAjmer",
    ),
    DistrictModel(
      code: "RJ_ALWAR",
      stateCode: "RJ",
      localizationKey: "districtAlwar",
    ),
    DistrictModel(
      code: "RJ_BANSWARA",
      stateCode: "RJ",
      localizationKey: "districtBanswara",
    ),
    DistrictModel(
      code: "RJ_BARAN",
      stateCode: "RJ",
      localizationKey: "districtBaran",
    ),
    DistrictModel(
      code: "RJ_BARMER",
      stateCode: "RJ",
      localizationKey: "districtBarmer",
    ),
    DistrictModel(
      code: "RJ_BHARATPUR",
      stateCode: "RJ",
      localizationKey: "districtBharatpur",
    ),
    DistrictModel(
      code: "RJ_BHILWARA",
      stateCode: "RJ",
      localizationKey: "districtBhilwara",
    ),
    DistrictModel(
      code: "RJ_BIKANER",
      stateCode: "RJ",
      localizationKey: "districtBikaner",
    ),
    DistrictModel(
      code: "RJ_BUNDI",
      stateCode: "RJ",
      localizationKey: "districtBundi",
    ),
    DistrictModel(
      code: "RJ_CHITTAURGARH",
      stateCode: "RJ",
      localizationKey: "districtChittaurgarh",
    ),
    DistrictModel(
      code: "RJ_CHURU",
      stateCode: "RJ",
      localizationKey: "districtChuru",
    ),
    DistrictModel(
      code: "RJ_DAUSA",
      stateCode: "RJ",
      localizationKey: "districtDausa",
    ),
    DistrictModel(
      code: "RJ_DHAULPUR",
      stateCode: "RJ",
      localizationKey: "districtDhaulpur",
    ),
    DistrictModel(
      code: "RJ_DUNGARPUR",
      stateCode: "RJ",
      localizationKey: "districtDungarpur",
    ),
    DistrictModel(
      code: "RJ_GANGANAGAR",
      stateCode: "RJ",
      localizationKey: "districtGanganagar",
    ),
    DistrictModel(
      code: "RJ_HANUMANGARH",
      stateCode: "RJ",
      localizationKey: "districtHanumangarh",
    ),
    DistrictModel(
      code: "RJ_JAIPUR",
      stateCode: "RJ",
      localizationKey: "districtJaipur",
    ),
    DistrictModel(
      code: "RJ_JAISALMER",
      stateCode: "RJ",
      localizationKey: "districtJaisalmer",
    ),
    DistrictModel(
      code: "RJ_JALORE",
      stateCode: "RJ",
      localizationKey: "districtJalore",
    ),
    DistrictModel(
      code: "RJ_JHALAWAR",
      stateCode: "RJ",
      localizationKey: "districtJhalawar",
    ),
    DistrictModel(
      code: "RJ_JHUNJHUNUN",
      stateCode: "RJ",
      localizationKey: "districtJhunjhunun",
    ),
    DistrictModel(
      code: "RJ_JODHPUR",
      stateCode: "RJ",
      localizationKey: "districtJodhpur",
    ),
    DistrictModel(
      code: "RJ_KARAULI",
      stateCode: "RJ",
      localizationKey: "districtKarauli",
    ),
    DistrictModel(
      code: "RJ_KOTA",
      stateCode: "RJ",
      localizationKey: "districtKota",
    ),
    DistrictModel(
      code: "RJ_NAGAUR",
      stateCode: "RJ",
      localizationKey: "districtNagaur",
    ),
    DistrictModel(
      code: "RJ_PALI",
      stateCode: "RJ",
      localizationKey: "districtPali",
    ),
    DistrictModel(
      code: "RJ_PRATAPGARH",
      stateCode: "RJ",
      localizationKey: "districtPratapgarh",
    ),
    DistrictModel(
      code: "RJ_RAJSAMAND",
      stateCode: "RJ",
      localizationKey: "districtRajsamand",
    ),
    DistrictModel(
      code: "RJ_SAWAI_MADHOPUR",
      stateCode: "RJ",
      localizationKey: "districtSawaiMadhopur",
    ),
    DistrictModel(
      code: "RJ_SIKAR",
      stateCode: "RJ",
      localizationKey: "districtSikar",
    ),
    DistrictModel(
      code: "RJ_SIROHI",
      stateCode: "RJ",
      localizationKey: "districtSirohi",
    ),
    DistrictModel(
      code: "RJ_TONK",
      stateCode: "RJ",
      localizationKey: "districtTonk",
    ),
    DistrictModel(
      code: "RJ_UDAIPUR",
      stateCode: "RJ",
      localizationKey: "districtUdaipur",
    ),
  ],

  // Sikkim
  "SK": [
    DistrictModel(
      code: "SK_EAST",
      stateCode: "SK",
      localizationKey: "districtEast",
    ),
    DistrictModel(
      code: "SK_NORTH",
      stateCode: "SK",
      localizationKey: "districtNorth",
    ),
    DistrictModel(
      code: "SK_SOUTH",
      stateCode: "SK",
      localizationKey: "districtSouth",
    ),
    DistrictModel(
      code: "SK_WEST",
      stateCode: "SK",
      localizationKey: "districtWest",
    ),
  ],

  // Tamil Nadu
  "TN": [
    DistrictModel(
      code: "TN_KANCHEEPURAM",
      stateCode: "TN",
      localizationKey: "districtKancheepuram",
    ),
    DistrictModel(
      code: "TN_SAIDAPET",
      stateCode: "TN",
      localizationKey: "districtSaidapet",
    ),
    DistrictModel(
      code: "TN_THIRUVALLORE",
      stateCode: "TN",
      localizationKey: "districtThiruvallore",
    ),
    DistrictModel(
      code: "TN_POONAMALLEE",
      stateCode: "TN",
      localizationKey: "districtPoonamallee",
    ),
    DistrictModel(
      code: "TN_VELLORE",
      stateCode: "TN",
      localizationKey: "districtVellore",
    ),
    DistrictModel(
      code: "TN_THIRUPPATTUR",
      stateCode: "TN",
      localizationKey: "districtThiruppattur",
    ),
    DistrictModel(
      code: "TN_TIRUVANNAMALAI",
      stateCode: "TN",
      localizationKey: "districtTiruvannamalai",
    ),
    DistrictModel(
      code: "TN_CHEYYAR",
      stateCode: "TN",
      localizationKey: "districtCheyyar",
    ),
    DistrictModel(
      code: "TN_CUDDALORE",
      stateCode: "TN",
      localizationKey: "districtCuddalore",
    ),
    DistrictModel(
      code: "TN_VILLUPURAM",
      stateCode: "TN",
      localizationKey: "districtVillupuram",
    ),
    DistrictModel(
      code: "TN_KALLAKURICHI",
      stateCode: "TN",
      localizationKey: "districtKallakurichi",
    ),
    DistrictModel(
      code: "TN_THANJAVUR",
      stateCode: "TN",
      localizationKey: "districtThanjavur",
    ),
    DistrictModel(
      code: "TN_THIRUVARUR",
      stateCode: "TN",
      localizationKey: "districtThiruvarur",
    ),
    DistrictModel(
      code: "TN_NAGAPATTINAM",
      stateCode: "TN",
      localizationKey: "districtNagapattinam",
    ),
    DistrictModel(
      code: "TN_THIRUCHIRAPALLI",
      stateCode: "TN",
      localizationKey: "districtThiruchirapalli",
    ),
    DistrictModel(
      code: "TN_KARUR",
      stateCode: "TN",
      localizationKey: "districtKarur",
    ),
    DistrictModel(
      code: "TN_PERAMBALUR",
      stateCode: "TN",
      localizationKey: "districtPerambalur",
    ),
    DistrictModel(
      code: "TN_PUDUKOTTAI",
      stateCode: "TN",
      localizationKey: "districtPudukottai",
    ),
    DistrictModel(
      code: "TN_ARANTHANGI",
      stateCode: "TN",
      localizationKey: "districtAranthangi",
    ),
    DistrictModel(
      code: "TN_MADURAI",
      stateCode: "TN",
      localizationKey: "districtMadurai",
    ),
    DistrictModel(
      code: "TN_THENI",
      stateCode: "TN",
      localizationKey: "districtTheni",
    ),
    DistrictModel(
      code: "TN_DINDIGUL",
      stateCode: "TN",
      localizationKey: "districtDindigul",
    ),
    DistrictModel(
      code: "TN_PALANI",
      stateCode: "TN",
      localizationKey: "districtPalani",
    ),
    DistrictModel(
      code: "TN_RAMANATHAPURAM",
      stateCode: "TN",
      localizationKey: "districtRamanathapuram",
    ),
    DistrictModel(
      code: "TN_PARAMAKUDI",
      stateCode: "TN",
      localizationKey: "districtParamakudi",
    ),
    DistrictModel(
      code: "TN_SIVAGANGA",
      stateCode: "TN",
      localizationKey: "districtSivaganga",
    ),
    DistrictModel(
      code: "TN_VIRUDHUNAGAR",
      stateCode: "TN",
      localizationKey: "districtVirudhunagar",
    ),
    DistrictModel(
      code: "TN_SIVAKASI",
      stateCode: "TN",
      localizationKey: "districtSivakasi",
    ),
    DistrictModel(
      code: "TN_THIRUNELVELI",
      stateCode: "TN",
      localizationKey: "districtThirunelveli",
    ),
    DistrictModel(
      code: "TN_SANKARANKOIL",
      stateCode: "TN",
      localizationKey: "districtSankarankoil",
    ),
    DistrictModel(
      code: "TN_THOOTHUKUDI",
      stateCode: "TN",
      localizationKey: "districtThoothukudi",
    ),
    DistrictModel(
      code: "TN_KOVILPATTI",
      stateCode: "TN",
      localizationKey: "districtKovilpatti",
    ),
    DistrictModel(
      code: "TN_NAGERCOIL",
      stateCode: "TN",
      localizationKey: "districtNagercoil",
    ),
    DistrictModel(
      code: "TN_SALEM",
      stateCode: "TN",
      localizationKey: "districtSalem",
    ),
    DistrictModel(
      code: "TN_NAMAKKAL",
      stateCode: "TN",
      localizationKey: "districtNamakkal",
    ),
    DistrictModel(
      code: "TN_DHARMAPURI",
      stateCode: "TN",
      localizationKey: "districtDharmapuri",
    ),
    DistrictModel(
      code: "TN_KRISHNAGIRI",
      stateCode: "TN",
      localizationKey: "districtKrishnagiri",
    ),
    DistrictModel(
      code: "TN_COIMBATORE",
      stateCode: "TN",
      localizationKey: "districtCoimbatore",
    ),
    DistrictModel(
      code: "TN_THIRUPPUR",
      stateCode: "TN",
      localizationKey: "districtThiruppur",
    ),
    DistrictModel(
      code: "TN_ERODE",
      stateCode: "TN",
      localizationKey: "districtErode",
    ),
    DistrictModel(
      code: "TN_DHARAPURAM",
      stateCode: "TN",
      localizationKey: "districtDharapuram",
    ),
    DistrictModel(
      code: "TN_THE_NILGIRIS",
      stateCode: "TN",
      localizationKey: "districtTheNilgiris",
    ),
    DistrictModel(
      code: "TN_CHENNAI_CORP",
      stateCode: "TN",
      localizationKey: "districtChennaiCorp",
    ),
  ],

  // Telangana (no district data available yet)
  "TS": [],

  // Tripura
  "TR": [
    DistrictModel(
      code: "TR_EAST_DHALAI",
      stateCode: "TR",
      localizationKey: "districtEastDhalai",
    ),
    DistrictModel(
      code: "TR_NORTH_TRIPURA",
      stateCode: "TR",
      localizationKey: "districtNorthTripura",
    ),
    DistrictModel(
      code: "TR_SOUTH_TRIPURA",
      stateCode: "TR",
      localizationKey: "districtSouthTripura",
    ),
    DistrictModel(
      code: "TR_WEST_TRIPURA",
      stateCode: "TR",
      localizationKey: "districtWestTripura",
    ),
  ],

  // Uttarakhand
  "UK": [
    DistrictModel(
      code: "UK_ALMORA",
      stateCode: "UK",
      localizationKey: "districtAlmora",
    ),
    DistrictModel(
      code: "UK_BAGESHWAR",
      stateCode: "UK",
      localizationKey: "districtBageshwar",
    ),
    DistrictModel(
      code: "UK_CHAMOLI",
      stateCode: "UK",
      localizationKey: "districtChamoli",
    ),
    DistrictModel(
      code: "UK_CHAMPAWAT",
      stateCode: "UK",
      localizationKey: "districtChampawat",
    ),
    DistrictModel(
      code: "UK_DEHRADUN",
      stateCode: "UK",
      localizationKey: "districtDehradun",
    ),
    DistrictModel(
      code: "UK_PAURI_GARHWAL",
      stateCode: "UK",
      localizationKey: "districtPauriGarhwal",
    ),
    DistrictModel(
      code: "UK_HARDWAR",
      stateCode: "UK",
      localizationKey: "districtHardwar",
    ),
    DistrictModel(
      code: "UK_NAINITAL",
      stateCode: "UK",
      localizationKey: "districtNainital",
    ),
    DistrictModel(
      code: "UK_PITHORAGARH",
      stateCode: "UK",
      localizationKey: "districtPithoragarh",
    ),
    DistrictModel(
      code: "UK_RUDRAPRAYAG",
      stateCode: "UK",
      localizationKey: "districtRudraprayag",
    ),
    DistrictModel(
      code: "UK_TEHRI_GARHWAL",
      stateCode: "UK",
      localizationKey: "districtTehriGarhwal",
    ),
    DistrictModel(
      code: "UK_UDHAM_SINGH_NAGAR",
      stateCode: "UK",
      localizationKey: "districtUdhamSinghNagar",
    ),
    DistrictModel(
      code: "UK_UTTARKASHI",
      stateCode: "UK",
      localizationKey: "districtUttarkashi",
    ),
  ],

  // Uttar Pradesh
  "UP": [
    DistrictModel(
      code: "UP_AGRA",
      stateCode: "UP",
      localizationKey: "districtAgra",
    ),
    DistrictModel(
      code: "UP_ALIGARH",
      stateCode: "UP",
      localizationKey: "districtAligarh",
    ),
    DistrictModel(
      code: "UP_ALLAHABAD",
      stateCode: "UP",
      localizationKey: "districtAllahabad",
    ),
    DistrictModel(
      code: "UP_AMBEDKAR_NAGAR",
      stateCode: "UP",
      localizationKey: "districtAmbedkarNagar",
    ),
    DistrictModel(
      code: "UP_AURAIYA",
      stateCode: "UP",
      localizationKey: "districtAuraiya",
    ),
    DistrictModel(
      code: "UP_AZAMGARH",
      stateCode: "UP",
      localizationKey: "districtAzamgarh",
    ),
    DistrictModel(
      code: "UP_BAGHPAT",
      stateCode: "UP",
      localizationKey: "districtBaghpat",
    ),
    DistrictModel(
      code: "UP_BAHRAICH",
      stateCode: "UP",
      localizationKey: "districtBahraich",
    ),
    DistrictModel(
      code: "UP_BALLIA",
      stateCode: "UP",
      localizationKey: "districtBallia",
    ),
    DistrictModel(
      code: "UP_BALRAMPUR",
      stateCode: "UP",
      localizationKey: "districtBalrampur",
    ),
    DistrictModel(
      code: "UP_BANDA",
      stateCode: "UP",
      localizationKey: "districtBanda",
    ),
    DistrictModel(
      code: "UP_BARABANKI",
      stateCode: "UP",
      localizationKey: "districtBarabanki",
    ),
    DistrictModel(
      code: "UP_BAREILLY",
      stateCode: "UP",
      localizationKey: "districtBareilly",
    ),
    DistrictModel(
      code: "UP_BASTI",
      stateCode: "UP",
      localizationKey: "districtBasti",
    ),
    DistrictModel(
      code: "UP_BIJNOR",
      stateCode: "UP",
      localizationKey: "districtBijnor",
    ),
    DistrictModel(
      code: "UP_BUDAUN",
      stateCode: "UP",
      localizationKey: "districtBudaun",
    ),
    DistrictModel(
      code: "UP_BULANDSHAHAR",
      stateCode: "UP",
      localizationKey: "districtBulandshahar",
    ),
    DistrictModel(
      code: "UP_CHANDAULI",
      stateCode: "UP",
      localizationKey: "districtChandauli",
    ),
    DistrictModel(
      code: "UP_CHITRAKOOT",
      stateCode: "UP",
      localizationKey: "districtChitrakoot",
    ),
    DistrictModel(
      code: "UP_DEORIA",
      stateCode: "UP",
      localizationKey: "districtDeoria",
    ),
    DistrictModel(
      code: "UP_ETAH",
      stateCode: "UP",
      localizationKey: "districtEtah",
    ),
    DistrictModel(
      code: "UP_ETAWAH",
      stateCode: "UP",
      localizationKey: "districtEtawah",
    ),
    DistrictModel(
      code: "UP_FAIZABAD",
      stateCode: "UP",
      localizationKey: "districtFaizabad",
    ),
    DistrictModel(
      code: "UP_FARRUKHABAD",
      stateCode: "UP",
      localizationKey: "districtFarrukhabad",
    ),
    DistrictModel(
      code: "UP_FATEHPUR",
      stateCode: "UP",
      localizationKey: "districtFatehpur",
    ),
    DistrictModel(
      code: "UP_FIROZABAD",
      stateCode: "UP",
      localizationKey: "districtFirozabad",
    ),
    DistrictModel(
      code: "UP_GAUTAM_BUDH_NAGAR",
      stateCode: "UP",
      localizationKey: "districtGautamBudhNagar",
    ),
    DistrictModel(
      code: "UP_GHAZIABAD",
      stateCode: "UP",
      localizationKey: "districtGhaziabad",
    ),
    DistrictModel(
      code: "UP_GHAZIPUR",
      stateCode: "UP",
      localizationKey: "districtGhazipur",
    ),
    DistrictModel(
      code: "UP_GONDA",
      stateCode: "UP",
      localizationKey: "districtGonda",
    ),
    DistrictModel(
      code: "UP_GORAKHPUR",
      stateCode: "UP",
      localizationKey: "districtGorakhpur",
    ),
    DistrictModel(
      code: "UP_HAMIRPUR_UP",
      stateCode: "UP",
      localizationKey: "districtHamirpurUp",
    ),
    DistrictModel(
      code: "UP_HARDOI",
      stateCode: "UP",
      localizationKey: "districtHardoi",
    ),
    DistrictModel(
      code: "UP_HATHRAS_MAHAMAYANAGAR",
      stateCode: "UP",
      localizationKey: "districtHathrasMahamayanagar",
    ),
    DistrictModel(
      code: "UP_JALAUN",
      stateCode: "UP",
      localizationKey: "districtJalaun",
    ),
    DistrictModel(
      code: "UP_JAUNPUR",
      stateCode: "UP",
      localizationKey: "districtJaunpur",
    ),
    DistrictModel(
      code: "UP_JHANSI",
      stateCode: "UP",
      localizationKey: "districtJhansi",
    ),
    DistrictModel(
      code: "UP_JYOTIBA_PHULE_NAGAR",
      stateCode: "UP",
      localizationKey: "districtJyotibaPhuleNagar",
    ),
    DistrictModel(
      code: "UP_KANNAUJ",
      stateCode: "UP",
      localizationKey: "districtKannauj",
    ),
    DistrictModel(
      code: "UP_KANPUR_NAGAR",
      stateCode: "UP",
      localizationKey: "districtKanpurNagar",
    ),
    DistrictModel(
      code: "UP_KANPUR_DEHAT",
      stateCode: "UP",
      localizationKey: "districtKanpurDehat",
    ),
    DistrictModel(
      code: "UP_KAUSHAMBI",
      stateCode: "UP",
      localizationKey: "districtKaushambi",
    ),
    DistrictModel(
      code: "UP_KHERI",
      stateCode: "UP",
      localizationKey: "districtKheri",
    ),
    DistrictModel(
      code: "UP_KUSHINAGAR",
      stateCode: "UP",
      localizationKey: "districtKushinagar",
    ),
    DistrictModel(
      code: "UP_LALITPUR",
      stateCode: "UP",
      localizationKey: "districtLalitpur",
    ),
    DistrictModel(
      code: "UP_LUCKNOW",
      stateCode: "UP",
      localizationKey: "districtLucknow",
    ),
    DistrictModel(
      code: "UP_MAHARAJGANJ",
      stateCode: "UP",
      localizationKey: "districtMaharajganj",
    ),
    DistrictModel(
      code: "UP_MAHOBA",
      stateCode: "UP",
      localizationKey: "districtMahoba",
    ),
    DistrictModel(
      code: "UP_MAINPURI",
      stateCode: "UP",
      localizationKey: "districtMainpuri",
    ),
    DistrictModel(
      code: "UP_MATHURA",
      stateCode: "UP",
      localizationKey: "districtMathura",
    ),
    DistrictModel(
      code: "UP_MAU",
      stateCode: "UP",
      localizationKey: "districtMau",
    ),
    DistrictModel(
      code: "UP_MEERUT",
      stateCode: "UP",
      localizationKey: "districtMeerut",
    ),
    DistrictModel(
      code: "UP_MIRZAPUR",
      stateCode: "UP",
      localizationKey: "districtMirzapur",
    ),
    DistrictModel(
      code: "UP_MORADABAD",
      stateCode: "UP",
      localizationKey: "districtMoradabad",
    ),
    DistrictModel(
      code: "UP_MUZAFFARNAGAR",
      stateCode: "UP",
      localizationKey: "districtMuzaffarnagar",
    ),
    DistrictModel(
      code: "UP_PILIBHIT",
      stateCode: "UP",
      localizationKey: "districtPilibhit",
    ),
    DistrictModel(
      code: "UP_PRATAPGARH",
      stateCode: "UP",
      localizationKey: "districtPratapgarh",
    ),
    DistrictModel(
      code: "UP_RAEBARELI",
      stateCode: "UP",
      localizationKey: "districtRaebareli",
    ),
    DistrictModel(
      code: "UP_RAMPUR",
      stateCode: "UP",
      localizationKey: "districtRampur",
    ),
    DistrictModel(
      code: "UP_SAHARANPUR",
      stateCode: "UP",
      localizationKey: "districtSaharanpur",
    ),
    DistrictModel(
      code: "UP_SANT_KABIR_NAGAR",
      stateCode: "UP",
      localizationKey: "districtSantKabirNagar",
    ),
    DistrictModel(
      code: "UP_SANT_RAVIDAS_NAGAR",
      stateCode: "UP",
      localizationKey: "districtSantRavidasNagar",
    ),
    DistrictModel(
      code: "UP_SHAHJAHANPUR",
      stateCode: "UP",
      localizationKey: "districtShahjahanpur",
    ),
    DistrictModel(
      code: "UP_SHRAVASTI",
      stateCode: "UP",
      localizationKey: "districtShravasti",
    ),
    DistrictModel(
      code: "UP_SIDDHARTHNAGAR",
      stateCode: "UP",
      localizationKey: "districtSiddharthnagar",
    ),
    DistrictModel(
      code: "UP_SITAPUR",
      stateCode: "UP",
      localizationKey: "districtSitapur",
    ),
    DistrictModel(
      code: "UP_SONBHADRA",
      stateCode: "UP",
      localizationKey: "districtSonbhadra",
    ),
    DistrictModel(
      code: "UP_SULTANPUR",
      stateCode: "UP",
      localizationKey: "districtSultanpur",
    ),
    DistrictModel(
      code: "UP_UNNAO",
      stateCode: "UP",
      localizationKey: "districtUnnao",
    ),
    DistrictModel(
      code: "UP_VARANASI",
      stateCode: "UP",
      localizationKey: "districtVaranasi",
    ),
  ],

  // West Bengal
  "WB": [
    DistrictModel(
      code: "WB_ALIPURDUAR",
      stateCode: "WB",
      localizationKey: "districtAlipurduar",
    ),
    DistrictModel(
      code: "WB_BANKURA",
      stateCode: "WB",
      localizationKey: "districtBankura",
    ),
    DistrictModel(
      code: "WB_BIRBHUM",
      stateCode: "WB",
      localizationKey: "districtBirbhum",
    ),
    DistrictModel(
      code: "WB_COOCH_BEHAR",
      stateCode: "WB",
      localizationKey: "districtCoochBehar",
    ),
    DistrictModel(
      code: "WB_DARJEELING",
      stateCode: "WB",
      localizationKey: "districtDarjeeling",
    ),
    DistrictModel(
      code: "WB_HOOGHLY",
      stateCode: "WB",
      localizationKey: "districtHooghly",
    ),
    DistrictModel(
      code: "WB_HOWRAH",
      stateCode: "WB",
      localizationKey: "districtHowrah",
    ),
    DistrictModel(
      code: "WB_JALPAIGURI",
      stateCode: "WB",
      localizationKey: "districtJalpaiguri",
    ),
    DistrictModel(
      code: "WB_JHARGRAM",
      stateCode: "WB",
      localizationKey: "districtJhargram",
    ),
    DistrictModel(
      code: "WB_KALIMPONG",
      stateCode: "WB",
      localizationKey: "districtKalimpong",
    ),
    DistrictModel(
      code: "WB_KOLKATA",
      stateCode: "WB",
      localizationKey: "districtKolkata",
    ),
    DistrictModel(
      code: "WB_MALDA",
      stateCode: "WB",
      localizationKey: "districtMalda",
    ),
    DistrictModel(
      code: "WB_MURSHIDABAD",
      stateCode: "WB",
      localizationKey: "districtMurshidabad",
    ),
    DistrictModel(
      code: "WB_NADIA",
      stateCode: "WB",
      localizationKey: "districtNadia",
    ),
    DistrictModel(
      code: "WB_NORTH_24_PARGANAS",
      stateCode: "WB",
      localizationKey: "districtNorth24Parganas",
    ),
    DistrictModel(
      code: "WB_SOUTH_24_PARGANAS",
      stateCode: "WB",
      localizationKey: "districtSouth24Parganas",
    ),
    DistrictModel(
      code: "WB_PASCHIM_BARDHAMAN",
      stateCode: "WB",
      localizationKey: "districtPaschimBardhaman",
    ),
    DistrictModel(
      code: "WB_PURBA_BARDHAMAN",
      stateCode: "WB",
      localizationKey: "districtPurbaBardhaman",
    ),
    DistrictModel(
      code: "WB_PASCHIM_MEDINIPUR",
      stateCode: "WB",
      localizationKey: "districtPaschimMedinipur",
    ),
    DistrictModel(
      code: "WB_PURBA_MEDINIPUR",
      stateCode: "WB",
      localizationKey: "districtPurbaMedinipur",
    ),
    DistrictModel(
      code: "WB_PURULIA",
      stateCode: "WB",
      localizationKey: "districtPurulia",
    ),
    DistrictModel(
      code: "WB_UTTAR_DINAJPUR",
      stateCode: "WB",
      localizationKey: "districtUttarDinajpur",
    ),
    DistrictModel(
      code: "WB_DAKSHIN_DINAJPUR",
      stateCode: "WB",
      localizationKey: "districtDakshinDinajpur",
    ),
  ],
};

/// ============================================================
/// HELPER METHODS
/// ============================================================
/// These form the public API for location lookups. GPS distance
/// ranking, nearby-worker matching, and map integration can all be
/// layered on top of these without changing their signatures.

/// Returns all Indian states.
List<StateModel> getAllStates() => indianStates;

/// Returns districts for a given state code via direct map lookup.
/// Never filters the full district list — O(1) lookup by design.
List<DistrictModel> getDistricts(String stateCode) {
  return districtsByState[stateCode] ?? const [];
}

/// Returns the state matching [code], or null if not found.
StateModel? getState(String code) {
  for (final state in indianStates) {
    if (state.code == code) return state;
  }
  return null;
}

/// Returns the district matching [districtCode], or null if not found.
/// Uses the district's embedded stateCode to jump straight to its
/// state's district list instead of scanning every state.
DistrictModel? getDistrict(String districtCode) {
  final stateCode = districtCode.split('_').first;
  final districts = districtsByState[stateCode];
  if (districts == null) return null;
  for (final district in districts) {
    if (district.code == districtCode) return district;
  }
  return null;
}

/// Case-insensitive, partial-match search over state localization
/// keys and codes (e.g. "beng" matches "stateWestBengal").
List<StateModel> searchStates(String query) {
  if (query.isEmpty) return indianStates;
  final normalizedQuery = query.toLowerCase();
  return indianStates
      .where((state) =>
          state.localizationKey.toLowerCase().contains(normalizedQuery) ||
          state.code.toLowerCase().contains(normalizedQuery))
      .toList();
}

/// Case-insensitive, partial-match search over a single state's
/// districts (e.g. "kol" matches "districtKolkata",
/// "how" matches "districtHowrah").
List<DistrictModel> searchDistricts(String stateCode, String query) {
  final districts = districtsByState[stateCode] ?? const [];
  if (query.isEmpty) return districts;
  final normalizedQuery = query.toLowerCase();
  return districts
      .where((district) =>
          district.localizationKey.toLowerCase().contains(normalizedQuery) ||
          district.code.toLowerCase().contains(normalizedQuery))
      .toList();
}