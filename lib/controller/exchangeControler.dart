import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ExchangeController extends GetxController {
  var isLoading = true.obs;
  var fieldLabels = <String>[].obs;
  var fieldKeys = <String>[].obs;

  // Mock dummy data rows
  var rows =
      [
        {
          "accountNumber": "12345678901234",
          "bankName": "Axis Bank",
          "ifscCode": "UTIB0000123",
          "test": "Test Data 1",
        },
        {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },


           {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },
           {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },
           {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },
           {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },
           {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },
           {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },   {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },   {
          "accountNumber": "56789012345678",
          "bankName": "HDFC Bank",
          "ifscCode": "HDFC0000456",
          "test": "Test Data 2",
        },
      ].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSchema();
  }

  Future<void> fetchSchema() async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate network

      // Replace this with actual API call
      final String mockJson = '''
{
  "base": {
    "type0": "Schema",
    "id0": "SK.Test^Bank",
    "apiVersion0": 0,
    "dataState0": "Active",
    "summary0": [
      "SK.Test",
      "Bank",
      "Referrable"
    ],
    "createdOn0": "1727773721809",
    "createdBy0": "Admin",
    "createdById0": "1",
    "lastChange0": {
      "version0": 2,
      "lastActiveVersion0": 1,
      "change0": "Update",
      "on0": "1733130559825",
      "by0": "Admin",
      "byId0": "1"
    },
    "confidentiality": "Internal",
    "description": "This is the schema that contains Bank details.",
    "label": "Bank Schema",
    "schemaState": "23817167744704",
    "namespace": "SK.Test",
    "name": "Bank",
    "schemaType": "Referrable",
    "fields": {
      "accountNumber": {
        "keyField": true,
        "dataType": "Number",
        "confidentiality": "Internal",
        "length": 14,
        "errorMessage": "Invalid Account Number : Enter 14 digit account number.",
        "description": "This is the account number",
        "label": "Account Number",
        "summaryField": true,
        "type0": "SK.Schemata^Field",
        "id0": "accountNumber",
        "name": "accountNumber",
        "pkOrder0": "23817367577769",
        "order": 1
      },
      "bankName": {
        "id0": "bankName",
        "dataType": "String",
        "minLength": 3,
        "confidentiality": "Internal",
        "name": "bankName",
        "label": "Bank Name",
        "summaryField": true,
        "type0": "SK.Schemata^Field",
        "required": true,
        "maxLength": 20,
        "order": 2
      },
      "ifscCode": {
        "id0": "ifscCode",
        "dataType": "String",
        "confidentiality": "Internal",
        "name": "ifscCode",
        "pattern": "alphaNumeric",
        "type0": "SK.Schemata^Field",
        "required": true,
        "order": 3
      },
      "test": {
        "id0": "test",
        "dataType": "String",
        "name": "test",
        "type0": "SK.Schemata^Field",
        "order": 4
      }
    }
  },
  "versions": {},
  "rejectedDelta": {}
}
''';

      final Map<String, dynamic> parsed = jsonDecode(mockJson);
      final fields = parsed['base']['fields'] as Map<String, dynamic>;

      fieldLabels.clear();
      fieldKeys.clear();

      fields.forEach((key, value) {
        fieldKeys.add(key);
        fieldLabels.add(value['label'] ?? key);
      });

      isLoading.value = false;
    } catch (e) {
      print("EXCEPTION ---   $e");
    }
  }
}
