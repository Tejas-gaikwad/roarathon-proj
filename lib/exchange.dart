import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rms_mgmt/FormScreen.dart';

class BankSchemaController extends GetxController {
  var isLoading = true.obs;
  var fieldLabels = <String>[].obs;
  var fieldKeys = <String>[].obs;

  // Track form mode
  var isEditMode = false.obs;
  var currentEditIndex = (-1).obs;

  // Form controllers
  final Map<String, TextEditingController> formControllers = {};

  // Data rows
  var rows = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSchema();
  }

  Future<void> fetchSchema() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network

    final String mockJson = '''
    {
      "base": {
        "fields": {
          "ISIN": {
            "label": "ISIN Code"
          },
          "Symbol": {
            "label": "Symbol"
          },
          "BloomCode": {
            "label": "Bloom Code"
          },
          "CompanyName": {
            "label": "Company Name"
          },

           "TargetPrice": {
            "label": "Target Price"
          },
          "Upside": {
            "label": "Upside"
          },
           "Sector": {
            "label": "Sector"
          },
          "MktCap": {
            "label": "MktCap"
          },
           "Recomendation": {
            "label": "Recomendation"
          }
         
        }
      }
    }
    ''';

  

    final Map<String, dynamic> parsed = jsonDecode(mockJson);
    final fields = parsed['base']['fields'] as Map<String, dynamic>;

    fieldLabels.clear();
    fieldKeys.clear();
    formControllers.clear();

    fields.forEach((key, value) {
      fieldKeys.add(key);
      fieldLabels.add(value['label'] ?? key);
      formControllers[key] = TextEditingController();
    });

    // Add dummy row
    rows.value = [
      {
        "ISIN": "INE001A01018",
        "Symbol": "RELIANCE",
        "BloomCode": "RIL IN Equity",
        "CompanyName": "Reliance Industries Ltd.",
        "TargetPrice": "3200.00",
        "Upside": "15.50",
        "Sector": "Oil & Gas",
        "MktCap": "2200000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE002A01018",
        "Symbol": "TCS",
        "BloomCode": "TCS IN Equity",
        "CompanyName": "Tata Consultancy Services Ltd.",
        "TargetPrice": "4500.00",
        "Upside": "12.00",
        "Sector": "Information Technology",
        "MktCap": "1500000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE003A01018",
        "Symbol": "HDFCBANK",
        "BloomCode": "HDFCBANK IN Equity",
        "CompanyName": "HDFC Bank Ltd.",
        "TargetPrice": "1900.00",
        "Upside": "10.20",
        "Sector": "Financials",
        "MktCap": "1200000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE004A01018",
        "Symbol": "INFY",
        "BloomCode": "INFY IN Equity",
        "CompanyName": "Infosys Ltd.",
        "TargetPrice": "1800.00",
        "Upside": "18.75",
        "Sector": "Information Technology",
        "MktCap": "750000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE005A01018",
        "Symbol": "ICICIBANK",
        "BloomCode": "ICICIBANK IN Equity",
        "CompanyName": "ICICI Bank Ltd.",
        "TargetPrice": "1200.00",
        "Upside": "14.30",
        "Sector": "Financials",
        "MktCap": "800000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE006A01018",
        "Symbol": "LT",
        "BloomCode": "LT IN Equity",
        "CompanyName": "Larsen & Toubro Ltd.",
        "TargetPrice": "4000.00",
        "Upside": "20.50",
        "Sector": "Capital Goods",
        "MktCap": "600000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE007A01018",
        "Symbol": "SBIN",
        "BloomCode": "SBIN IN Equity",
        "CompanyName": "State Bank of India",
        "TargetPrice": "850.00",
        "Upside": "11.80",
        "Sector": "Financials",
        "MktCap": "700000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE008A01018",
        "Symbol": "BHARTIARTL",
        "BloomCode": "BHARTI IN Equity",
        "CompanyName": "Bharti Airtel Ltd.",
        "TargetPrice": "1300.00",
        "Upside": "16.00",
        "Sector": "Telecommunication",
        "MktCap": "780000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE009A01018",
        "Symbol": "HINDUNILVR",
        "BloomCode": "HUVR IN Equity",
        "CompanyName": "Hindustan Unilever Ltd.",
        "TargetPrice": "2800.00",
        "Upside": "9.50",
        "Sector": "FMCG",
        "MktCap": "650000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE010A01018",
        "Symbol": "ITC",
        "BloomCode": "ITC IN Equity",
        "CompanyName": "ITC Ltd.",
        "TargetPrice": "520.00",
        "Upside": "10.00",
        "Sector": "FMCG",
        "MktCap": "580000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE011A01018",
        "Symbol": "AXISBANK",
        "BloomCode": "AXSB IN Equity",
        "CompanyName": "Axis Bank Ltd.",
        "TargetPrice": "1300.00",
        "Upside": "15.00",
        "Sector": "Financials",
        "MktCap": "400000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE012A01018",
        "Symbol": "KOTAKBANK",
        "BloomCode": "KOTAKBANK IN Equity",
        "CompanyName": "Kotak Mahindra Bank Ltd.",
        "TargetPrice": "2100.00",
        "Upside": "13.50",
        "Sector": "Financials",
        "MktCap": "450000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE013A01018",
        "Symbol": "ASIANPAINT",
        "BloomCode": "APNT IN Equity",
        "CompanyName": "Asian Paints Ltd.",
        "TargetPrice": "3800.00",
        "Upside": "17.00",
        "Sector": "Chemicals",
        "MktCap": "350000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE014A01018",
        "Symbol": "MARUTI",
        "BloomCode": "MSIL IN Equity",
        "CompanyName": "Maruti Suzuki India Ltd.",
        "TargetPrice": "13000.00",
        "Upside": "22.00",
        "Sector": "Automobile",
        "MktCap": "380000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE015A01018",
        "Symbol": "ULTRACEMCO",
        "BloomCode": "UCL IN Equity",
        "CompanyName": "UltraTech Cement Ltd.",
        "TargetPrice": "12000.00",
        "Upside": "19.00",
        "Sector": "Construction Materials",
        "MktCap": "320000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE016A01018",
        "Symbol": "NTPC",
        "BloomCode": "NTPC IN Equity",
        "CompanyName": "NTPC Ltd.",
        "TargetPrice": "400.00",
        "Upside": "10.50",
        "Sector": "Power",
        "MktCap": "300000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE017A01018",
        "Symbol": "POWERGRID",
        "BloomCode": "PWGR IN Equity",
        "CompanyName": "Power Grid Corporation of India Ltd.",
        "TargetPrice": "320.00",
        "Upside": "11.20",
        "Sector": "Power",
        "MktCap": "280000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE018A01018",
        "Symbol": "HCLTECH",
        "BloomCode": "HCLT IN Equity",
        "CompanyName": "HCL Technologies Ltd.",
        "TargetPrice": "1600.00",
        "Upside": "14.80",
        "Sector": "Information Technology",
        "MktCap": "420000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE019A01018",
        "Symbol": "WIPRO",
        "BloomCode": "WPRO IN Equity",
        "CompanyName": "Wipro Ltd.",
        "TargetPrice": "600.00",
        "Upside": "13.00",
        "Sector": "Information Technology",
        "MktCap": "300000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE020A01018",
        "Symbol": "TECHM",
        "BloomCode": "TECHM IN Equity",
        "CompanyName": "Tech Mahindra Ltd.",
        "TargetPrice": "1500.00",
        "Upside": "16.50",
        "Sector": "Information Technology",
        "MktCap": "280000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE021A01018",
        "Symbol": "INDUSINDBK",
        "BloomCode": "IIBK IN Equity",
        "CompanyName": "IndusInd Bank Ltd.",
        "TargetPrice": "1800.00",
        "Upside": "18.00",
        "Sector": "Financials",
        "MktCap": "180000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE022A01018",
        "Symbol": "NESTLEIND",
        "BloomCode": "NESTLE IN Equity",
        "CompanyName": "Nestle India Ltd.",
        "TargetPrice": "28000.00",
        "Upside": "8.00",
        "Sector": "FMCG",
        "MktCap": "260000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE023A01018",
        "Symbol": "BAJFINANCE",
        "BloomCode": "BAF IN Equity",
        "CompanyName": "Bajaj Finance Ltd.",
        "TargetPrice": "9000.00",
        "Upside": "25.00",
        "Sector": "Financials",
        "MktCap": "420000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE024A01018",
        "Symbol": "ONGC",
        "BloomCode": "ONGC IN Equity",
        "CompanyName": "Oil and Natural Gas Corporation Ltd.",
        "TargetPrice": "300.00",
        "Upside": "10.00",
        "Sector": "Oil & Gas",
        "MktCap": "290000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE025A01018",
        "Symbol": "GRASIM",
        "BloomCode": "GRASIM IN Equity",
        "CompanyName": "Grasim Industries Ltd.",
        "TargetPrice": "2600.00",
        "Upside": "15.00",
        "Sector": "Diversified",
        "MktCap": "180000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE026A01018",
        "Symbol": "DRREDDY",
        "BloomCode": "DRL IN Equity",
        "CompanyName": "Dr. Reddy's Laboratories Ltd.",
        "TargetPrice": "7000.00",
        "Upside": "12.50",
        "Sector": "Pharmaceuticals",
        "MktCap": "100000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE027A01018",
        "Symbol": "SUNPHARMA",
        "BloomCode": "SUNP IN Equity",
        "CompanyName": "Sun Pharmaceutical Industries Ltd.",
        "TargetPrice": "1700.00",
        "Upside": "19.50",
        "Sector": "Pharmaceuticals",
        "MktCap": "380000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE028A01018",
        "Symbol": "CIPLA",
        "BloomCode": "CIPLA IN Equity",
        "CompanyName": "Cipla Ltd.",
        "TargetPrice": "1700.00",
        "Upside": "16.00",
        "Sector": "Pharmaceuticals",
        "MktCap": "140000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE029A01018",
        "Symbol": "EICHERMOT",
        "BloomCode": "EIM IN Equity",
        "CompanyName": "Eicher Motors Ltd.",
        "TargetPrice": "5000.00",
        "Upside": "20.00",
        "Sector": "Automobile",
        "MktCap": "140000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE030A01018",
        "Symbol": "HDFCLIFE",
        "BloomCode": "HDFCLIFE IN Equity",
        "CompanyName": "HDFC Life Insurance Company Ltd.",
        "TargetPrice": "800.00",
        "Upside": "14.00",
        "Sector": "Financials",
        "MktCap": "130000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE031A01018",
        "Symbol": "SBI LIFE",
        "BloomCode": "SBILIFE IN Equity",
        "CompanyName": "SBI Life Insurance Company Ltd.",
        "TargetPrice": "1600.00",
        "Upside": "17.50",
        "Sector": "Financials",
        "MktCap": "150000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE032A01018",
        "Symbol": "ICICIPRULI",
        "BloomCode": "ICICIPRU IN Equity",
        "CompanyName": "ICICI Prudential Life Insurance Company Ltd.",
        "TargetPrice": "700.00",
        "Upside": "12.00",
        "Sector": "Financials",
        "MktCap": "100000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE033A01018",
        "Symbol": "M&M",
        "BloomCode": "MM IN Equity",
        "CompanyName": "Mahindra & Mahindra Ltd.",
        "TargetPrice": "2700.00",
        "Upside": "21.00",
        "Sector": "Automobile",
        "MktCap": "280000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE034A01018",
        "Symbol": "TITAN",
        "BloomCode": "TITAN IN Equity",
        "CompanyName": "Titan Company Ltd.",
        "TargetPrice": "4200.00",
        "Upside": "15.00",
        "Sector": "Consumer Discretionary",
        "MktCap": "380000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE035A01018",
        "Symbol": "BAJAJ-AUTO",
        "BloomCode": "BAJAJAU IN Equity",
        "CompanyName": "Bajaj Auto Ltd.",
        "TargetPrice": "11000.00",
        "Upside": "18.00",
        "Sector": "Automobile",
        "MktCap": "220000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE036A01018",
        "Symbol": "BPCL",
        "BloomCode": "BPCL IN Equity",
        "CompanyName": "Bharat Petroleum Corporation Ltd.",
        "TargetPrice": "700.00",
        "Upside": "13.00",
        "Sector": "Oil & Gas",
        "MktCap": "150000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE037A01018",
        "Symbol": "IOC",
        "BloomCode": "IOC IN Equity",
        "CompanyName": "Indian Oil Corporation Ltd.",
        "TargetPrice": "200.00",
        "Upside": "9.00",
        "Sector": "Oil & Gas",
        "MktCap": "180000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE038A01018",
        "Symbol": "COALINDIA",
        "BloomCode": "COAL IN Equity",
        "CompanyName": "Coal India Ltd.",
        "TargetPrice": "500.00",
        "Upside": "11.00",
        "Sector": "Metals & Mining",
        "MktCap": "300000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE039A01018",
        "Symbol": "GAIL",
        "BloomCode": "GAIL IN Equity",
        "CompanyName": "GAIL (India) Ltd.",
        "TargetPrice": "250.00",
        "Upside": "14.50",
        "Sector": "Oil & Gas",
        "MktCap": "130000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE040A01018",
        "Symbol": "ADANIENT",
        "BloomCode": "ADEL IN Equity",
        "CompanyName": "Adani Enterprises Ltd.",
        "TargetPrice": "3800.00",
        "Upside": "28.00",
        "Sector": "Diversified",
        "MktCap": "400000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE041A01018",
        "Symbol": "ADANIPORTS",
        "BloomCode": "ADANIPORT IN Equity",
        "CompanyName": "Adani Ports and Special Economic Zone Ltd.",
        "TargetPrice": "1800.00",
        "Upside": "20.00",
        "Sector": "Logistics",
        "MktCap": "300000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE042A01018",
        "Symbol": "ADANIGREEN",
        "BloomCode": "ADANIEN IN Equity",
        "CompanyName": "Adani Green Energy Ltd.",
        "TargetPrice": "2200.00",
        "Upside": "35.00",
        "Sector": "Renewable Energy",
        "MktCap": "320000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE043A01018",
        "Symbol": "ASIANPAINT",
        "BloomCode": "ASAP IN Equity",
        "CompanyName": "Berger Paints India Ltd.",
        "TargetPrice": "850.00",
        "Upside": "12.00",
        "Sector": "Chemicals",
        "MktCap": "70000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE044A01018",
        "Symbol": "DMART",
        "BloomCode": "DMART IN Equity",
        "CompanyName": "Avenue Supermarts Ltd.",
        "TargetPrice": "5200.00",
        "Upside": "18.00",
        "Sector": "Retail",
        "MktCap": "330000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE045A01018",
        "Symbol": "APOLLOHOSP",
        "BloomCode": "APHS IN Equity",
        "CompanyName": "Apollo Hospitals Enterprise Ltd.",
        "TargetPrice": "7500.00",
        "Upside": "20.00",
        "Sector": "Healthcare",
        "MktCap": "90000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE046A01018",
        "Symbol": "DIVISLAB",
        "BloomCode": "DIVI IN Equity",
        "CompanyName": "Divi's Laboratories Ltd.",
        "TargetPrice": "5000.00",
        "Upside": "15.00",
        "Sector": "Pharmaceuticals",
        "MktCap": "95000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE047A01018",
        "Symbol": "HEROMOTOCO",
        "BloomCode": "HROM IN Equity",
        "CompanyName": "Hero MotoCorp Ltd.",
        "TargetPrice": "5000.00",
        "Upside": "16.00",
        "Sector": "Automobile",
        "MktCap": "80000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE048A01018",
        "Symbol": "BAJAJFINSV",
        "BloomCode": "BJFS IN Equity",
        "CompanyName": "Bajaj Finserv Ltd.",
        "TargetPrice": "2000.00",
        "Upside": "22.00",
        "Sector": "Financials",
        "MktCap": "280000.00",
        "Recomendation": "BUY",
      },
      {
        "ISIN": "INE049A01018",
        "Symbol": "GODREJCP",
        "BloomCode": "GODREJCP IN Equity",
        "CompanyName": "Godrej Consumer Products Ltd.",
        "TargetPrice": "1300.00",
        "Upside": "10.00",
        "Sector": "FMCG",
        "MktCap": "120000.00",
        "Recomendation": "HOLD",
      },
      {
        "ISIN": "INE050A01018",
        "Symbol": "DABUR",
        "BloomCode": "DABUR IN Equity",
        "CompanyName": "Dabur India Ltd.",
        "TargetPrice": "700.00",
        "Upside": "11.50",
        "Sector": "FMCG",
        "MktCap": "100000.00",
        "Recomendation": "BUY",
      },
     
    ];

    isLoading.value = false;
  }

  void startCreate() {
    isEditMode.value = false;
    currentEditIndex.value = -1;
    clearForm();
    Get.to(() => FormScreen());
  }

  void startEdit(int index) {
    isEditMode.value = true;
    currentEditIndex.value = index;

    final row = rows[index];
    for (var key in fieldKeys) {
      formControllers[key]?.text = row[key] ?? '';
    }

    Get.to(() => FormScreen());
  }

  void submitForm() {
    Map<String, String> formData = {};
    for (var key in fieldKeys) {
      formData[key] = formControllers[key]?.text ?? '';
    }

    if (isEditMode.value && currentEditIndex.value >= 0) {
      rows[currentEditIndex.value] = formData;
    } else {
      rows.add(formData);
    }

    //Get.back(); // Close dialog
  }

  void clearForm() {
    for (var controller in formControllers.values) {
      controller.clear();
    }
  }

  void deleteRow(int index) {
    Get.defaultDialog(
      title: "Delete Entry",
      middleText: "Are you sure you want to delete this entry?",
      textCancel: "Cancel",
      textConfirm: "Delete",
      confirmTextColor: Colors.white,
      onConfirm: () {
        rows.removeAt(index);
        Get.back(); // close dialog
      },
    );
  }
}

class DynamicBankSchemaPage extends StatefulWidget {
  DynamicBankSchemaPage({super.key});

  @override
  State<DynamicBankSchemaPage> createState() => _DynamicBankSchemaPageState();
}

class _DynamicBankSchemaPageState extends State<DynamicBankSchemaPage> {
  final BankSchemaController controller = Get.put(BankSchemaController());

  final ScrollController horizontalScrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bank Schema Table')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final searchQuery = searchController.text.trim();
        final filteredRows =
            controller.rows.where((row) {
              final accountNumber = row['ISIN']?.toLowerCase() ?? '';
              return accountNumber.contains(searchQuery.toLowerCase());
            }).toList();

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Top Bar: Create + Search
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: "Search by Account Number",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            setState(() {}); // Refresh filtered rows
                          },
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: controller.startCreate,
                    icon: const Icon(Icons.add),
                    label: const Text("Create New"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(() {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              dataTableTheme: DataTableThemeData(
                                dataRowColor: MaterialStateProperty.resolveWith<
                                  Color?
                                >((Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.08);
                                  }
                                  // Default color for data rows (can be alternating, etc.)
                                  return null; // Use default
                                }),
                                headingRowColor: MaterialStateProperty.resolveWith<
                                  Color?
                                >((Set<MaterialState> states) {
                                  return Colors
                                      .blueAccent; // Set your desired header color here
                                }),
                                headingTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Set header text color
                                ),
                                dataTextStyle: TextStyle(
                                  color:
                                      Colors.black87, // Set data row text color
                                ),
                              ),
                            ),
                            child: DataTable(
                              columns: [
                                ...controller.fieldLabels.map(
                                  (label) => DataColumn(label: Text(label)),
                                ),
                                const DataColumn(label: Text('Actions')),
                              ],
                              rows:
                                  filteredRows.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    var row = entry.value;

                                    return DataRow(
                                      cells: [
                                        ...controller.fieldKeys.map(
                                          (key) =>
                                              DataCell(Text(row[key] ?? '')),
                                        ),
                                        DataCell(
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.blue,
                                                ),
                                                onPressed:
                                                    () => controller.startEdit(
                                                      index,
                                                    ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed:
                                                    () => controller.deleteRow(
                                                      index,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
