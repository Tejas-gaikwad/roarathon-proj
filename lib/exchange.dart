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


    // final String mockJson = '''
    // {
    //   "base": {
    //     "fields": {
    //       "accountNumber": {
    //         "label": "Account Number"
    //       },
    //       "bankName": {
    //         "label": "Bank Name"
    //       },
    //       "ifscCode": {
    //         "label": "IFSC Code"
    //       },
    //       "test": {
    //         "label": "Test"
    //       },

    //        "intermediaryCode": {
    //         "label": "Intermediary Code"
    //       },
    //       "tradeName": {
    //         "label": "Trade Name"
    //       },
    //        "name": {
    //         "label": "Name"
    //       },
    //       "segment": {
    //         "label": "Segment"
    //       },
    //        "dataState": {
    //         "label": "Data State"
    //       },
    //       "pan": {
    //         "label": "PAN"
    //       },
    //        "regNo": {
    //         "label": "Reg No"
    //       },
    //       "regDate": {
    //         "label": "Reg Date"
    //       },
    //        "reType": {
    //         "label": "Reg Type"
    //       }

         
         
         
    //     }
    //   }
    // }
    // ''';

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
    rows.value =
    // [
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "12345678901234",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    //   {
    //     "accountNumber": "17181",
    //     "bankName": "Axis Bank",
    //     "ifscCode": "UTIB0000123",
    //     "test": "Test Data 1",
    //     "intermediaryCode": "12345",
    //     "tradeName": "Global Financial Services",
    //     "name": "John Doe",
    //     "segment": "Equity",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN54321",
    //     "regDate": "2022-01-15",
    //     "reType": "Broker",
    //   },
    // ];


    //13 filed
    // [
    //   {
    //     "accountNumber": "987654321098765",
    //     "bankname": "HDFC Bank",
    //     "ifscCode": "HDFC0000001",
    //     "test": "Data Validation A",
    //     "intermediaryCode": "INT001",
    //     "tradename": "Alpha Solutions Pvt. Ltd.",
    //     "name": "Aarav Sharma",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "ABCDE1234F",
    //     "regNo": "REGN00001",
    //     "regDate": "2023-01-15",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "123456789012345",
    //     "bankname": "ICICI Bank",
    //     "ifscCode": "ICIC0000002",
    //     "test": "Performance test B",
    //     "intermediaryCode": "INT002",
    //     "tradename": "Beta Innovations Ltd.",
    //     "name": "Bhavya Patel",
    //     "segment": "Corporate",
    //     "dataState": "Pending",
    //     "pan": "FGHIJ5678K",
    //     "regNo": "REGN00002",
    //     "regDate": "2024-03-20",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "543210987654321",
    //     "bankname": "State Bank of India",
    //     "ifscCode": "SBIN0000003",
    //     "test": "Unit test C",
    //     "intermediaryCode": "INT003",
    //     "tradename": "Gamma Enterprises",
    //     "name": "Chetan Kumar",
    //     "segment": "SME",
    //     "dataState": "Inactive",
    //     "pan": "KLMNO9012L",
    //     "regNo": "REGN00003",
    //     "regDate": "2022-11-01",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "098765432109876",
    //     "bankname": "Axis Bank",
    //     "ifscCode": "UTIB0000004",
    //     "test": "Regression test D",
    //     "intermediaryCode": "INT004",
    //     "tradename": "Delta Solutions",
    //     "name": "Deepika Singh",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "PQRST3456M",
    //     "regNo": "REGN00004",
    //     "regDate": "2025-06-25",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "678901234567890",
    //     "bankname": "Punjab National Bank",
    //     "ifscCode": "PUNB0000005",
    //     "test": "Integration test E",
    //     "intermediaryCode": "INT005",
    //     "tradename": "Epsilon Group",
    //     "name": "Eshan Gupta",
    //     "segment": "Corporate",
    //     "dataState": "Active",
    //     "pan": "UVWXY7890N",
    //     "regNo": "REGN00005",
    //     "regDate": "2023-09-10",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "234567890123456",
    //     "bankname": "Canara Bank",
    //     "ifscCode": "CNRB0000006",
    //     "test": "Security test F",
    //     "intermediaryCode": "INT006",
    //     "tradename": "Zeta Systems",
    //     "name": "Fatima Khan",
    //     "segment": "SME",
    //     "dataState": "Suspended",
    //     "pan": "ABCDE5432O",
    //     "regNo": "REGN00006",
    //     "regDate": "2024-11-05",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "876543210987654",
    //     "bankname": "Bank of Baroda",
    //     "ifscCode": "BARB0000007",
    //     "test": "Usability test G",
    //     "intermediaryCode": "INT007",
    //     "tradename": "Eta Technologies",
    //     "name": "Gaurav Saini",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "FGHIJ9876P",
    //     "regNo": "REGN00007",
    //     "regDate": "2023-04-22",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "112233445566778",
    //     "bankname": "Union Bank of India",
    //     "ifscCode": "UBIN0000008",
    //     "test": "Load test H",
    //     "intermediaryCode": "INT008",
    //     "tradename": "Theta Solutions",
    //     "name": "Harshita Jain",
    //     "segment": "Corporate",
    //     "dataState": "Active",
    //     "pan": "KLMNO2109Q",
    //     "regNo": "REGN00008",
    //     "regDate": "2022-07-18",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "998877665544332",
    //     "bankname": "IDBI Bank",
    //     "ifscCode": "IBKL0000009",
    //     "test": "Stress test I",
    //     "intermediaryCode": "INT009",
    //     "tradename": "Iota Innovations",
    //     "name": "Ishaan Sharma",
    //     "segment": "SME",
    //     "dataState": "Pending",
    //     "pan": "PQRST6543R",
    //     "regNo": "REGN00009",
    //     "regDate": "2025-01-05",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "445566778899001",
    //     "bankname": "Indian Bank",
    //     "ifscCode": "IDIB0000010",
    //     "test": "Acceptance test J",
    //     "intermediaryCode": "INT010",
    //     "tradename": "Kappa Enterprises",
    //     "name": "Janya Reddy",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "UVWXY0987S",
    //     "regNo": "REGN00010",
    //     "regDate": "2023-11-30",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "765432109876543",
    //     "bankname": "Bank of India",
    //     "ifscCode": "BKID0000011",
    //     "test": "Functional test K",
    //     "intermediaryCode": "INT011",
    //     "tradename": "Lambda Solutions",
    //     "name": "Kartik Jain",
    //     "segment": "Corporate",
    //     "dataState": "Inactive",
    //     "pan": "ABCDE8765T",
    //     "regNo": "REGN00011",
    //     "regDate": "2024-05-12",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "321098765432109",
    //     "bankname": "Central Bank of India",
    //     "ifscCode": "CBIN0000012",
    //     "test": "Smoke test L",
    //     "intermediaryCode": "INT012",
    //     "tradename": "Mu Innovations",
    //     "name": "Lavanya Kumar",
    //     "segment": "SME",
    //     "dataState": "Active",
    //     "pan": "FGHIJ2345U",
    //     "regNo": "REGN00012",
    //     "regDate": "2022-08-25",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "654321098765432",
    //     "bankname": "Yes Bank",
    //     "ifscCode": "YESB0000013",
    //     "test": "Exploratory test M",
    //     "intermediaryCode": "INT013",
    //     "tradename": "Nu Enterprises",
    //     "name": "Manya Sharma",
    //     "segment": "Retail",
    //     "dataState": "Pending",
    //     "pan": "KLMNO6789V",
    //     "regNo": "REGN00013",
    //     "regDate": "2025-02-01",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "001122334455667",
    //     "bankname": "Kotak Mahindra Bank",
    //     "ifscCode": "KKBK0000014",
    //     "test": "Compatibility test N",
    //     "intermediaryCode": "INT014",
    //     "tradename": "Xi Solutions",
    //     "name": "Nakul Verma",
    //     "segment": "Corporate",
    //     "dataState": "Active",
    //     "pan": "PQRST0123W",
    //     "regNo": "REGN00014",
    //     "regDate": "2023-03-10",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "889900112233445",
    //     "bankname": "IndusInd Bank",
    //     "ifscCode": "INDB0000015",
    //     "test": "Performance test O",
    //     "intermediaryCode": "INT015",
    //     "tradename": "Omicron Group",
    //     "name": "Omkar Deshmukh",
    //     "segment": "SME",
    //     "dataState": "Inactive",
    //     "pan": "UVWXY4567X",
    //     "regNo": "REGN00015",
    //     "regDate": "2024-07-01",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "223344556677889",
    //     "bankname": "Bandhan Bank",
    //     "ifscCode": "BAND0000016",
    //     "test": "Reliability test P",
    //     "intermediaryCode": "INT016",
    //     "tradename": "Pi Technologies",
    //     "name": "Preeti Agarwal",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "ABCDE8765Y",
    //     "regNo": "REGN00016",
    //     "regDate": "2022-09-19",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "556677889900112",
    //     "bankname": "RBL Bank",
    //     "ifscCode": "RATN0000017",
    //     "test": "Stress test Q",
    //     "intermediaryCode": "INT017",
    //     "tradename": "Rho Solutions",
    //     "name": "Rahul Sharma",
    //     "segment": "Corporate",
    //     "dataState": "Pending",
    //     "pan": "FGHIJ2345Z",
    //     "regNo": "REGN00017",
    //     "regDate": "2025-04-03",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "887766554433221",
    //     "bankname": "Federal Bank",
    //     "ifscCode": "FDRL0000018",
    //     "test": "Security test R",
    //     "intermediaryCode": "INT018",
    //     "tradename": "Sigma Innovations",
    //     "name": "Ria Singhania",
    //     "segment": "SME",
    //     "dataState": "Inactive",
    //     "pan": "KLMNO6789A",
    //     "regNo": "REGN00018",
    //     "regDate": "2023-07-28",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "110099887766554",
    //     "bankname": "South Indian Bank",
    //     "ifscCode": "SIBL0000019",
    //     "test": "Data Validation S",
    //     "intermediaryCode": "INT019",
    //     "tradename": "Tau Enterprises",
    //     "name": "Samar Singh",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "PQRST0123B",
    //     "regNo": "REGN00019",
    //     "regDate": "2024-02-14",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "443322110099887",
    //     "bankname": "DBS Bank India",
    //     "ifscCode": "DBSS0000020",
    //     "test": "Unit test T",
    //     "intermediaryCode": "INT020",
    //     "tradename": "Upsilon Group",
    //     "name": "Tara Sharma",
    //     "segment": "Corporate",
    //     "dataState": "Active",
    //     "pan": "UVWXY4567C",
    //     "regNo": "REGN00020",
    //     "regDate": "2022-12-01",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "776655443322110",
    //     "bankname": "AU Small Finance Bank",
    //     "ifscCode": "AUBL0000021",
    //     "test": "Functional test U",
    //     "intermediaryCode": "INT021",
    //     "tradename": "Phi Solutions",
    //     "name": "Uday Kumar",
    //     "segment": "SME",
    //     "dataState": "Active",
    //     "pan": "ABCDE8765D",
    //     "regNo": "REGN00021",
    //     "regDate": "2025-05-09",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "109876543210987",
    //     "bankname": "Equitas Small Finance Bank",
    //     "ifscCode": "ESFB0000022",
    //     "test": "Integration test V",
    //     "intermediaryCode": "INT022",
    //     "tradename": "Chi Innovations",
    //     "name": "Vaibhav Gupta",
    //     "segment": "Retail",
    //     "dataState": "Pending",
    //     "pan": "FGHIJ2345E",
    //     "regNo": "REGN00022",
    //     "regDate": "2023-02-28",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "432109876543210",
    //     "bankname": "Ujjivan Small Finance Bank",
    //     "ifscCode": "UJVN0000023",
    //     "test": "Regression test W",
    //     "intermediaryCode": "INT023",
    //     "tradename": "Psi Enterprises",
    //     "name": "Wasiq Ali",
    //     "segment": "Corporate",
    //     "dataState": "Inactive",
    //     "pan": "KLMNO6789F",
    //     "regNo": "REGN00023",
    //     "regDate": "2024-08-17",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "765432109876543",
    //     "bankname": "Utkarsh Small Finance Bank",
    //     "ifscCode": "UTKS0000024",
    //     "test": "Usability test X",
    //     "intermediaryCode": "INT024",
    //     "tradename": "Omega Group",
    //     "name": "Xavier D'Souza",
    //     "segment": "SME",
    //     "dataState": "Active",
    //     "pan": "PQRST0123G",
    //     "regNo": "REGN00024",
    //     "regDate": "2022-10-04",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "111222333444555",
    //     "bankname": "ESAF Small Finance Bank",
    //     "ifscCode": "ESFB0000025",
    //     "test": "Load test Y",
    //     "intermediaryCode": "INT025",
    //     "tradename": "Sigma Alpha Corp",
    //     "name": "Yashika Reddy",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "UVWXY4567H",
    //     "regNo": "REGN00025",
    //     "regDate": "2025-03-08",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "444555666777888",
    //     "bankname": "North East Small Finance Bank",
    //     "ifscCode": "NESF0000026",
    //     "test": "Stress test Z",
    //     "intermediaryCode": "INT026",
    //     "tradename": "Beta Gamma Ltd.",
    //     "name": "Zara Khan",
    //     "segment": "Corporate",
    //     "dataState": "Pending",
    //     "pan": "ABCDE8765I",
    //     "regNo": "REGN00026",
    //     "regDate": "2023-06-16",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "777888999000111",
    //     "bankname": "Fincare Small Finance Bank",
    //     "ifscCode": "FISC0000027",
    //     "test": "Acceptance test AA",
    //     "intermediaryCode": "INT027",
    //     "tradename": "Delta Epsilon",
    //     "name": "Ankit Rai",
    //     "segment": "SME",
    //     "dataState": "Inactive",
    //     "pan": "FGHIJ2345J",
    //     "regNo": "REGN00027",
    //     "regDate": "2024-09-21",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "000111222333444",
    //     "bankname": "Jana Small Finance Bank",
    //     "ifscCode": "JANA0000028",
    //     "test": "Compatibility test BB",
    //     "intermediaryCode": "INT028",
    //     "tradename": "Theta Kappa Solutions",
    //     "name": "Bharti Devi",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "KLMNO6789K",
    //     "regNo": "REGN00028",
    //     "regDate": "2022-05-11",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "333444555666777",
    //     "bankname": "Suryoday Small Finance Bank",
    //     "ifscCode": "SRDY0000029",
    //     "test": "Performance test CC",
    //     "intermediaryCode": "INT029",
    //     "tradename": "Mu Nu Enterprises",
    //     "name": "Chirag Malhotra",
    //     "segment": "Corporate",
    //     "dataState": "Active",
    //     "pan": "PQRST0123L",
    //     "regNo": "REGN00029",
    //     "regDate": "2025-01-20",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "666777888999000",
    //     "bankname": "Shivalik Small Finance Bank",
    //     "ifscCode": "SIVL0000030",
    //     "test": "Reliability test DD",
    //     "intermediaryCode": "INT030",
    //     "tradename": "Xi Omicron Group",
    //     "name": "Disha Sharma",
    //     "segment": "SME",
    //     "dataState": "Suspended",
    //     "pan": "UVWXY4567M",
    //     "regNo": "REGN00030",
    //     "regDate": "2023-08-05",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "999000111222333",
    //     "bankname": "CSB Bank",
    //     "ifscCode": "CSBK0000031",
    //     "test": "Security test EE",
    //     "intermediaryCode": "INT031",
    //     "tradename": "Pi Rho Technologies",
    //     "name": "Eklavya Jha",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "ABCDE8765N",
    //     "regNo": "REGN00031",
    //     "regDate": "2024-01-01",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "111222333444555",
    //     "bankname": "Karur Vysya Bank",
    //     "ifscCode": "KVBL0000032",
    //     "test": "Data Validation FF",
    //     "intermediaryCode": "INT032",
    //     "tradename": "Sigma Tau Solutions",
    //     "name": "Garima Singh",
    //     "segment": "Corporate",
    //     "dataState": "Active",
    //     "pan": "FGHIJ2345O",
    //     "regNo": "REGN00032",
    //     "regDate": "2022-03-17",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "444555666777888",
    //     "bankname": "City Union Bank",
    //     "ifscCode": "CIUB0000033",
    //     "test": "Unit test GG",
    //     "intermediaryCode": "INT033",
    //     "tradename": "Upsilon Phi Innovations",
    //     "name": "Harshvardhan Rao",
    //     "segment": "SME",
    //     "dataState": "Active",
    //     "pan": "KLMNO6789P",
    //     "regNo": "REGN00033",
    //     "regDate": "2025-06-01",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "777888999000111",
    //     "bankname": "DCB Bank",
    //     "ifscCode": "DCBL0000034",
    //     "test": "Functional test HH",
    //     "intermediaryCode": "INT034",
    //     "tradename": "Chi Psi Enterprises",
    //     "name": "Indira Krishnan",
    //     "segment": "Retail",
    //     "dataState": "Pending",
    //     "pan": "PQRST0123Q",
    //     "regNo": "REGN00034",
    //     "regDate": "2023-05-20",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "000111222333444",
    //     "bankname": "IDFC First Bank",
    //     "ifscCode": "IDFB0000035",
    //     "test": "Integration test II",
    //     "intermediaryCode": "INT035",
    //     "tradename": "Omega Alpha Group",
    //     "name": "Jatin Verma",
    //     "segment": "Corporate",
    //     "dataState": "Inactive",
    //     "pan": "UVWXY4567R",
    //     "regNo": "REGN00035",
    //     "regDate": "2024-10-15",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "333444555666777",
    //     "bankname": "Maharashtra Bank",
    //     "ifscCode": "MAHB0000036",
    //     "test": "Regression test JJ",
    //     "intermediaryCode": "INT036",
    //     "tradename": "Beta Gamma Solutions",
    //     "name": "Kavya Murthy",
    //     "segment": "SME",
    //     "dataState": "Active",
    //     "pan": "ABCDE8765S",
    //     "regNo": "REGN00036",
    //     "regDate": "2022-06-29",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "666777888999000",
    //     "bankname": "Indian Overseas Bank",
    //     "ifscCode": "IOBA0000037",
    //     "test": "Usability test KK",
    //     "intermediaryCode": "INT037",
    //     "tradename": "Delta Epsilon Innovations",
    //     "name": "Lakshmi Iyer",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "FGHIJ2345T",
    //     "regNo": "REGN00037",
    //     "regDate": "2025-04-18",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "999000111222333",
    //     "bankname": "UCO Bank",
    //     "ifscCode": "UCBA0000038",
    //     "test": "Load test LL",
    //     "intermediaryCode": "INT038",
    //     "tradename": "Theta Kappa Enterprises",
    //     "name": "Manish Sharma",
    //     "segment": "Corporate",
    //     "dataState": "Pending",
    //     "pan": "KLMNO6789U",
    //     "regNo": "REGN00038",
    //     "regDate": "2023-01-09",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "111222333444555",
    //     "bankname": "Karnataka Bank",
    //     "ifscCode": "KARB0000039",
    //     "test": "Stress test MM",
    //     "intermediaryCode": "INT039",
    //     "tradename": "Mu Nu Solutions",
    //     "name": "Naina Kapoor",
    //     "segment": "SME",
    //     "dataState": "Inactive",
    //     "pan": "PQRST0123V",
    //     "regNo": "REGN00039",
    //     "regDate": "2024-06-05",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "444555666777888",
    //     "bankname": "Jammu & Kashmir Bank",
    //     "ifscCode": "JAKA0000040",
    //     "test": "Acceptance test NN",
    //     "intermediaryCode": "INT040",
    //     "tradename": "Xi Omicron Innovations",
    //     "name": "Om Prakash",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "UVWXY4567W",
    //     "regNo": "REGN00040",
    //     "regDate": "2022-11-25",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "777888999000111",
    //     "bankname": "Nainital Bank",
    //     "ifscCode": "NTBL0000041",
    //     "test": "Compatibility test OO",
    //     "intermediaryCode": "INT041",
    //     "tradename": "Pi Rho Enterprises",
    //     "name": "Pooja Sharma",
    //     "segment": "Corporate",
    //     "dataState": "Active",
    //     "pan": "ABCDE8765X",
    //     "regNo": "REGN00041",
    //     "regDate": "2025-02-12",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "000111222333444",
    //     "bankname": "RBL Bank",
    //     "ifscCode": "RATN0000042",
    //     "test": "Performance test PP",
    //     "intermediaryCode": "INT042",
    //     "tradename": "Sigma Tau Group",
    //     "name": "Qasim Ali",
    //     "segment": "SME",
    //     "dataState": "Pending",
    //     "pan": "FGHIJ2345Y",
    //     "regNo": "REGN00042",
    //     "regDate": "2023-09-01",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "333444555666777",
    //     "bankname": "Equitas Small Finance Bank",
    //     "ifscCode": "ESFB0000043",
    //     "test": "Reliability test QQ",
    //     "intermediaryCode": "INT043",
    //     "tradename": "Upsilon Phi Technologies",
    //     "name": "Rachit Bansal",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "KLMNO6789Z",
    //     "regNo": "REGN00043",
    //     "regDate": "2024-03-29",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "666777888999000",
    //     "bankname": "IDFC First Bank",
    //     "ifscCode": "IDFB0000044",
    //     "test": "Security test RR",
    //     "intermediaryCode": "INT044",
    //     "tradename": "Chi Psi Solutions",
    //     "name": "Sakshi Singh",
    //     "segment": "Corporate",
    //     "dataState": "Inactive",
    //     "pan": "PQRST0123A",
    //     "regNo": "REGN00044",
    //     "regDate": "2022-07-07",
    //     "reType": "Company",
    //   },
    //   {
    //     "accountNumber": "999000111222333",
    //     "bankname": "Federal Bank",
    //     "ifscCode": "FDRL0000045",
    //     "test": "Data Validation SS",
    //     "intermediaryCode": "INT045",
    //     "tradename": "Omega Alpha Innovations",
    //     "name": "Tarun Kumar",
    //     "segment": "SME",
    //     "dataState": "Active",
    //     "pan": "UVWXY4567B",
    //     "regNo": "REGN00045",
    //     "regDate": "2025-05-01",
    //     "reType": "Partnership",
    //   },
    //   {
    //     "accountNumber": "111222333444555",
    //     "bankname": "DBS Bank India",
    //     "ifscCode": "DBSS0000046",
    //     "test": "Unit test TT",
    //     "intermediaryCode": "INT046",
    //     "tradename": "Beta Gamma Enterprises",
    //     "name": "Urvashi Mehta",
    //     "segment": "Retail",
    //     "dataState": "Active",
    //     "pan": "ABCDE8765C",
    //     "regNo": "REGN00046",
    //     "regDate": "2023-02-10",
    //     "reType": "Individual",
    //   },
    //   {
    //     "accountNumber": "444555666777888",
    //     "bankname": "South Indian Bank",
    //     "ifscCode": "SIBL0000047",
    //     "test": "Functional test UU",
    //     "intermediaryCode": "INT047",
    //     "tradename": "Delta Epsilon Group",
    //     "name": "Vijayalakshmi Rao",
    //     "segment": "Corporate",
    //     "dataState": "Pending",
    //     "pan": "FGHIJ2345D",
    //     "regNo": "REGN00047",
    //     "regDate": "2024-07-22",
    //     "reType": "Company",
    //   },
    // ];

[
 
  {
    "ISIN": "INE001A01018",
    "Symbol": "RELIANCE",
    "BloomCode": "RIL IN Equity",
    "CompanyName": "Reliance Industries Ltd.",
    "TargetPrice": "3200.00",
    "Upside": "15.50",
    "Sector": "Oil & Gas",
    "MktCap": "2200000.00",
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
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
    "Recomendation": "BUY"
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
    "Recomendation": "HOLD"
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
    "Recomendation": "BUY"
  }
  // {
  //   "ISIN": "INE002A01018",
  //   "Symbol": "TCS",
  //   "BloomCode": "TCS IN Equity",
  //   "CompanyName": "Tata Consultancy Services Ltd.",
  //   "TargetPrice": 4500.00,
  //   "Upside": 12.00,
  //   "Sector": "Information Technology",
  //   "MktCap": 1500000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE003A01018",
  //   "Symbol": "HDFCBANK",
  //   "BloomCode": "HDFCBANK IN Equity",
  //   "CompanyName": "HDFC Bank Ltd.",
  //   "TargetPrice": 1900.00,
  //   "Upside": 10.20,
  //   "Sector": "Financials",
  //   "MktCap": 1200000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE004A01018",
  //   "Symbol": "INFY",
  //   "BloomCode": "INFY IN Equity",
  //   "CompanyName": "Infosys Ltd.",
  //   "TargetPrice": 1800.00,
  //   "Upside": 18.75,
  //   "Sector": "Information Technology",
  //   "MktCap": 750000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE005A01018",
  //   "Symbol": "ICICIBANK",
  //   "BloomCode": "ICICIBANK IN Equity",
  //   "CompanyName": "ICICI Bank Ltd.",
  //   "TargetPrice": 1200.00,
  //   "Upside": 14.30,
  //   "Sector": "Financials",
  //   "MktCap": 800000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE006A01018",
  //   "Symbol": "LT",
  //   "BloomCode": "LT IN Equity",
  //   "CompanyName": "Larsen & Toubro Ltd.",
  //   "TargetPrice": 4000.00,
  //   "Upside": 20.50,
  //   "Sector": "Capital Goods",
  //   "MktCap": 600000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE007A01018",
  //   "Symbol": "SBIN",
  //   "BloomCode": "SBIN IN Equity",
  //   "CompanyName": "State Bank of India",
  //   "TargetPrice": 850.00,
  //   "Upside": 11.80,
  //   "Sector": "Financials",
  //   "MktCap": 700000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE008A01018",
  //   "Symbol": "BHARTIARTL",
  //   "BloomCode": "BHARTI IN Equity",
  //   "CompanyName": "Bharti Airtel Ltd.",
  //   "TargetPrice": 1300.00,
  //   "Upside": 16.00,
  //   "Sector": "Telecommunication",
  //   "MktCap": 780000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE009A01018",
  //   "Symbol": "HINDUNILVR",
  //   "BloomCode": "HUVR IN Equity",
  //   "CompanyName": "Hindustan Unilever Ltd.",
  //   "TargetPrice": 2800.00,
  //   "Upside": 9.50,
  //   "Sector": "FMCG",
  //   "MktCap": 650000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE010A01018",
  //   "Symbol": "ITC",
  //   "BloomCode": "ITC IN Equity",
  //   "CompanyName": "ITC Ltd.",
  //   "TargetPrice": 520.00,
  //   "Upside": 10.00,
  //   "Sector": "FMCG",
  //   "MktCap": 580000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE011A01018",
  //   "Symbol": "AXISBANK",
  //   "BloomCode": "AXSB IN Equity",
  //   "CompanyName": "Axis Bank Ltd.",
  //   "TargetPrice": 1300.00,
  //   "Upside": 15.00,
  //   "Sector": "Financials",
  //   "MktCap": 400000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE012A01018",
  //   "Symbol": "KOTAKBANK",
  //   "BloomCode": "KOTAKBANK IN Equity",
  //   "CompanyName": "Kotak Mahindra Bank Ltd.",
  //   "TargetPrice": 2100.00,
  //   "Upside": 13.50,
  //   "Sector": "Financials",
  //   "MktCap": 450000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE013A01018",
  //   "Symbol": "ASIANPAINT",
  //   "BloomCode": "APNT IN Equity",
  //   "CompanyName": "Asian Paints Ltd.",
  //   "TargetPrice": 3800.00,
  //   "Upside": 17.00,
  //   "Sector": "Chemicals",
  //   "MktCap": 350000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE014A01018",
  //   "Symbol": "MARUTI",
  //   "BloomCode": "MSIL IN Equity",
  //   "CompanyName": "Maruti Suzuki India Ltd.",
  //   "TargetPrice": 13000.00,
  //   "Upside": 22.00,
  //   "Sector": "Automobile",
  //   "MktCap": 380000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE015A01018",
  //   "Symbol": "ULTRACEMCO",
  //   "BloomCode": "UCL IN Equity",
  //   "CompanyName": "UltraTech Cement Ltd.",
  //   "TargetPrice": 12000.00,
  //   "Upside": 19.00,
  //   "Sector": "Construction Materials",
  //   "MktCap": 320000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE016A01018",
  //   "Symbol": "NTPC",
  //   "BloomCode": "NTPC IN Equity",
  //   "CompanyName": "NTPC Ltd.",
  //   "TargetPrice": 400.00,
  //   "Upside": 10.50,
  //   "Sector": "Power",
  //   "MktCap": 300000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE017A01018",
  //   "Symbol": "POWERGRID",
  //   "BloomCode": "PWGR IN Equity",
  //   "CompanyName": "Power Grid Corporation of India Ltd.",
  //   "TargetPrice": 320.00,
  //   "Upside": 11.20,
  //   "Sector": "Power",
  //   "MktCap": 280000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE018A01018",
  //   "Symbol": "HCLTECH",
  //   "BloomCode": "HCLT IN Equity",
  //   "CompanyName": "HCL Technologies Ltd.",
  //   "TargetPrice": 1600.00,
  //   "Upside": 14.80,
  //   "Sector": "Information Technology",
  //   "MktCap": 420000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE019A01018",
  //   "Symbol": "WIPRO",
  //   "BloomCode": "WPRO IN Equity",
  //   "CompanyName": "Wipro Ltd.",
  //   "TargetPrice": 600.00,
  //   "Upside": 13.00,
  //   "Sector": "Information Technology",
  //   "MktCap": 300000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE020A01018",
  //   "Symbol": "TECHM",
  //   "BloomCode": "TECHM IN Equity",
  //   "CompanyName": "Tech Mahindra Ltd.",
  //   "TargetPrice": 1500.00,
  //   "Upside": 16.50,
  //   "Sector": "Information Technology",
  //   "MktCap": 280000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE021A01018",
  //   "Symbol": "INDUSINDBK",
  //   "BloomCode": "IIBK IN Equity",
  //   "CompanyName": "IndusInd Bank Ltd.",
  //   "TargetPrice": 1800.00,
  //   "Upside": 18.00,
  //   "Sector": "Financials",
  //   "MktCap": 180000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE022A01018",
  //   "Symbol": "NESTLEIND",
  //   "BloomCode": "NESTLE IN Equity",
  //   "CompanyName": "Nestle India Ltd.",
  //   "TargetPrice": 28000.00,
  //   "Upside": 8.00,
  //   "Sector": "FMCG",
  //   "MktCap": 260000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE023A01018",
  //   "Symbol": "BAJFINANCE",
  //   "BloomCode": "BAF IN Equity",
  //   "CompanyName": "Bajaj Finance Ltd.",
  //   "TargetPrice": 9000.00,
  //   "Upside": 25.00,
  //   "Sector": "Financials",
  //   "MktCap": 420000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE024A01018",
  //   "Symbol": "ONGC",
  //   "BloomCode": "ONGC IN Equity",
  //   "CompanyName": "Oil and Natural Gas Corporation Ltd.",
  //   "TargetPrice": 300.00,
  //   "Upside": 10.00,
  //   "Sector": "Oil & Gas",
  //   "MktCap": 290000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE025A01018",
  //   "Symbol": "GRASIM",
  //   "BloomCode": "GRASIM IN Equity",
  //   "CompanyName": "Grasim Industries Ltd.",
  //   "TargetPrice": 2600.00,
  //   "Upside": 15.00,
  //   "Sector": "Diversified",
  //   "MktCap": 180000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE026A01018",
  //   "Symbol": "DRREDDY",
  //   "BloomCode": "DRL IN Equity",
  //   "CompanyName": "Dr. Reddy's Laboratories Ltd.",
  //   "TargetPrice": 7000.00,
  //   "Upside": 12.50,
  //   "Sector": "Pharmaceuticals",
  //   "MktCap": 100000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE027A01018",
  //   "Symbol": "SUNPHARMA",
  //   "BloomCode": "SUNP IN Equity",
  //   "CompanyName": "Sun Pharmaceutical Industries Ltd.",
  //   "TargetPrice": 1700.00,
  //   "Upside": 19.50,
  //   "Sector": "Pharmaceuticals",
  //   "MktCap": 380000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE028A01018",
  //   "Symbol": "CIPLA",
  //   "BloomCode": "CIPLA IN Equity",
  //   "CompanyName": "Cipla Ltd.",
  //   "TargetPrice": 1700.00,
  //   "Upside": 16.00,
  //   "Sector": "Pharmaceuticals",
  //   "MktCap": 140000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE029A01018",
  //   "Symbol": "EICHERMOT",
  //   "BloomCode": "EIM IN Equity",
  //   "CompanyName": "Eicher Motors Ltd.",
  //   "TargetPrice": 5000.00,
  //   "Upside": 20.00,
  //   "Sector": "Automobile",
  //   "MktCap": 140000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE030A01018",
  //   "Symbol": "HDFCLIFE",
  //   "BloomCode": "HDFCLIFE IN Equity",
  //   "CompanyName": "HDFC Life Insurance Company Ltd.",
  //   "TargetPrice": 800.00,
  //   "Upside": 14.00,
  //   "Sector": "Financials",
  //   "MktCap": 130000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE031A01018",
  //   "Symbol": "SBI LIFE",
  //   "BloomCode": "SBILIFE IN Equity",
  //   "CompanyName": "SBI Life Insurance Company Ltd.",
  //   "TargetPrice": 1600.00,
  //   "Upside": 17.50,
  //   "Sector": "Financials",
  //   "MktCap": 150000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE032A01018",
  //   "Symbol": "ICICIPRULI",
  //   "BloomCode": "ICICIPRU IN Equity",
  //   "CompanyName": "ICICI Prudential Life Insurance Company Ltd.",
  //   "TargetPrice": 700.00,
  //   "Upside": 12.00,
  //   "Sector": "Financials",
  //   "MktCap": 100000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE033A01018",
  //   "Symbol": "M&M",
  //   "BloomCode": "MM IN Equity",
  //   "CompanyName": "Mahindra & Mahindra Ltd.",
  //   "TargetPrice": 2700.00,
  //   "Upside": 21.00,
  //   "Sector": "Automobile",
  //   "MktCap": 280000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE034A01018",
  //   "Symbol": "TITAN",
  //   "BloomCode": "TITAN IN Equity",
  //   "CompanyName": "Titan Company Ltd.",
  //   "TargetPrice": 4200.00,
  //   "Upside": 15.00,
  //   "Sector": "Consumer Discretionary",
  //   "MktCap": 380000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE035A01018",
  //   "Symbol": "BAJAJ-AUTO",
  //   "BloomCode": "BAJAJAU IN Equity",
  //   "CompanyName": "Bajaj Auto Ltd.",
  //   "TargetPrice": 11000.00,
  //   "Upside": 18.00,
  //   "Sector": "Automobile",
  //   "MktCap": 220000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE036A01018",
  //   "Symbol": "BPCL",
  //   "BloomCode": "BPCL IN Equity",
  //   "CompanyName": "Bharat Petroleum Corporation Ltd.",
  //   "TargetPrice": 700.00,
  //   "Upside": 13.00,
  //   "Sector": "Oil & Gas",
  //   "MktCap": 150000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE037A01018",
  //   "Symbol": "IOC",
  //   "BloomCode": "IOC IN Equity",
  //   "CompanyName": "Indian Oil Corporation Ltd.",
  //   "TargetPrice": 200.00,
  //   "Upside": 9.00,
  //   "Sector": "Oil & Gas",
  //   "MktCap": 180000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE038A01018",
  //   "Symbol": "COALINDIA",
  //   "BloomCode": "COAL IN Equity",
  //   "CompanyName": "Coal India Ltd.",
  //   "TargetPrice": 500.00,
  //   "Upside": 11.00,
  //   "Sector": "Metals & Mining",
  //   "MktCap": 300000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE039A01018",
  //   "Symbol": "GAIL",
  //   "BloomCode": "GAIL IN Equity",
  //   "CompanyName": "GAIL (India) Ltd.",
  //   "TargetPrice": 250.00,
  //   "Upside": 14.50,
  //   "Sector": "Oil & Gas",
  //   "MktCap": 130000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE040A01018",
  //   "Symbol": "ADANIENT",
  //   "BloomCode": "ADEL IN Equity",
  //   "CompanyName": "Adani Enterprises Ltd.",
  //   "TargetPrice": 3800.00,
  //   "Upside": 28.00,
  //   "Sector": "Diversified",
  //   "MktCap": 400000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE041A01018",
  //   "Symbol": "ADANIPORTS",
  //   "BloomCode": "ADANIPORT IN Equity",
  //   "CompanyName": "Adani Ports and Special Economic Zone Ltd.",
  //   "TargetPrice": 1800.00,
  //   "Upside": 20.00,
  //   "Sector": "Logistics",
  //   "MktCap": 300000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE042A01018",
  //   "Symbol": "ADANIGREEN",
  //   "BloomCode": "ADANIEN IN Equity",
  //   "CompanyName": "Adani Green Energy Ltd.",
  //   "TargetPrice": 2200.00,
  //   "Upside": 35.00,
  //   "Sector": "Renewable Energy",
  //   "MktCap": 320000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE043A01018",
  //   "Symbol": "ASIANPAINT",
  //   "BloomCode": "ASAP IN Equity",
  //   "CompanyName": "Berger Paints India Ltd.",
  //   "TargetPrice": 850.00,
  //   "Upside": 12.00,
  //   "Sector": "Chemicals",
  //   "MktCap": 70000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE044A01018",
  //   "Symbol": "DMART",
  //   "BloomCode": "DMART IN Equity",
  //   "CompanyName": "Avenue Supermarts Ltd.",
  //   "TargetPrice": 5200.00,
  //   "Upside": 18.00,
  //   "Sector": "Retail",
  //   "MktCap": 330000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE045A01018",
  //   "Symbol": "APOLLOHOSP",
  //   "BloomCode": "APHS IN Equity",
  //   "CompanyName": "Apollo Hospitals Enterprise Ltd.",
  //   "TargetPrice": 7500.00,
  //   "Upside": 20.00,
  //   "Sector": "Healthcare",
  //   "MktCap": 90000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE046A01018",
  //   "Symbol": "DIVISLAB",
  //   "BloomCode": "DIVI IN Equity",
  //   "CompanyName": "Divi's Laboratories Ltd.",
  //   "TargetPrice": 5000.00,
  //   "Upside": 15.00,
  //   "Sector": "Pharmaceuticals",
  //   "MktCap": 95000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE047A01018",
  //   "Symbol": "HEROMOTOCO",
  //   "BloomCode": "HROM IN Equity",
  //   "CompanyName": "Hero MotoCorp Ltd.",
  //   "TargetPrice": 5000.00,
  //   "Upside": 16.00,
  //   "Sector": "Automobile",
  //   "MktCap": 80000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE048A01018",
  //   "Symbol": "BAJAJFINSV",
  //   "BloomCode": "BJFS IN Equity",
  //   "CompanyName": "Bajaj Finserv Ltd.",
  //   "TargetPrice": 2000.00,
  //   "Upside": 22.00,
  //   "Sector": "Financials",
  //   "MktCap": 280000.00,
  //   "Recomendation": "BUY"
  // },
  // {
  //   "ISIN": "INE049A01018",
  //   "Symbol": "GODREJCP",
  //   "BloomCode": "GODREJCP IN Equity",
  //   "CompanyName": "Godrej Consumer Products Ltd.",
  //   "TargetPrice": 1300.00,
  //   "Upside": 10.00,
  //   "Sector": "FMCG",
  //   "MktCap": 120000.00,
  //   "Recomendation": "HOLD"
  // },
  // {
  //   "ISIN": "INE050A01018",
  //   "Symbol": "DABUR",
  //   "BloomCode": "DABUR IN Equity",
  //   "CompanyName": "Dabur India Ltd.",
  //   "TargetPrice": 700.00,
  //   "Upside": 11.50,
  //   "Sector": "FMCG",
  //   "MktCap": 100000.00,
  //   "Recomendation": "BUY"
  // }
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
