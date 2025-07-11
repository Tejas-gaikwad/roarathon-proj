# rms_mgmt

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

apis

login ---

curl --location 'http://10.12.37.18:9459/infinity/login' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header 'Authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbmZpbml0eS1TeXN0ZW0tQWRtaW4iLCJleHAiOjE3NTIyNTQwODAsImlzcyI6IjEwLjEyLjM3LjE4Iiwicm9sZXMiOlsic3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiLCJhZHZpc29yeS1tYW5hZ2VtZW50LXJvbGUiLCJJbmZpbml0eS1TeXN0ZW0tQWRtaW4tUm9sZSIsImRpeS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIkhSRW1wbG95ZWVEYXRhSFJPcENyZWF0ZVJvbGUiLCJmcmFuY2hpc2Utc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJkaXktc2NoZW1hLXJlYWQtcm9sZSIsInN5c3RlbS1hdXRoLXJvbGUiLCJzeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImhyZGF0YS1jcmVhdGUtcm9sZSIsImZyYW5jaGlzZS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIm1mcHJvamVjdC1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImRpeS1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImJ1eWJhY2stc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJtZnByb2plY3Qtc3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiXSwidXNlcl9pZCI6Ijk2ODA5NTc2NTQ0MDAiLCJsb2dpbl9pZCI6ImluZmluaXR5LnN5c3RlbS5hZG1pbkBzaGFyZWtoYW4uY29tIn0.W5AhgyFVDQME0ET-MoKGl8g3EDphqw0Mq0TxwXRktYm4r3qinnTC9rRs4rHVUuBeQgcq1qxS95s4BxK3qWqhow' \
--data-urlencode 'password=12345' \
--data-urlencode 'username=rakesh'

getById schema --

curl --location 'http://10.12.37.18:9459/infinity/data/SK.Schemata/Schema/SK.Test1%5EResearchStockList' \
--header 'Authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbmZpbml0eS1TeXN0ZW0tQWRtaW4iLCJleHAiOjE3NTIyNTQwODAsImlzcyI6IjEwLjEyLjM3LjE4Iiwicm9sZXMiOlsic3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiLCJhZHZpc29yeS1tYW5hZ2VtZW50LXJvbGUiLCJJbmZpbml0eS1TeXN0ZW0tQWRtaW4tUm9sZSIsImRpeS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIkhSRW1wbG95ZWVEYXRhSFJPcENyZWF0ZVJvbGUiLCJmcmFuY2hpc2Utc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJkaXktc2NoZW1hLXJlYWQtcm9sZSIsInN5c3RlbS1hdXRoLXJvbGUiLCJzeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImhyZGF0YS1jcmVhdGUtcm9sZSIsImZyYW5jaGlzZS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIm1mcHJvamVjdC1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImRpeS1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImJ1eWJhY2stc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJtZnByb2plY3Qtc3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiXSwidXNlcl9pZCI6Ijk2ODA5NTc2NTQ0MDAiLCJsb2dpbl9pZCI6ImluZmluaXR5LnN5c3RlbS5hZG1pbkBzaGFyZWtoYW4uY29tIn0.W5AhgyFVDQME0ET-MoKGl8g3EDphqw0Mq0TxwXRktYm4r3qinnTC9rRs4rHVUuBeQgcq1qxS95s4BxK3qWqhow'

getAll ---

curl --location 'http://10.12.37.18:9459/infinity/data/SK.Test1/ResearchStockList?getAllOperationType=FULL_RECORD&limit0=200' \
--header 'Authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbmZpbml0eS1TeXN0ZW0tQWRtaW4iLCJleHAiOjE3NTIyNTQwODAsImlzcyI6IjEwLjEyLjM3LjE4Iiwicm9sZXMiOlsic3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiLCJhZHZpc29yeS1tYW5hZ2VtZW50LXJvbGUiLCJJbmZpbml0eS1TeXN0ZW0tQWRtaW4tUm9sZSIsImRpeS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIkhSRW1wbG95ZWVEYXRhSFJPcENyZWF0ZVJvbGUiLCJmcmFuY2hpc2Utc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJkaXktc2NoZW1hLXJlYWQtcm9sZSIsInN5c3RlbS1hdXRoLXJvbGUiLCJzeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImhyZGF0YS1jcmVhdGUtcm9sZSIsImZyYW5jaGlzZS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIm1mcHJvamVjdC1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImRpeS1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImJ1eWJhY2stc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJtZnByb2plY3Qtc3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiXSwidXNlcl9pZCI6Ijk2ODA5NTc2NTQ0MDAiLCJsb2dpbl9pZCI6ImluZmluaXR5LnN5c3RlbS5hZG1pbkBzaGFyZWtoYW4uY29tIn0.W5AhgyFVDQME0ET-MoKGl8g3EDphqw0Mq0TxwXRktYm4r3qinnTC9rRs4rHVUuBeQgcq1qxS95s4BxK3qWqhow'

post ---

curl --location 'http://10.12.37.18:9459/infinity/data/SK.Test1/ResearchStockList' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbmZpbml0eS1TeXN0ZW0tQWRtaW4iLCJleHAiOjE3NTIyNTQwODAsImlzcyI6IjEwLjEyLjM3LjE4Iiwicm9sZXMiOlsic3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiLCJhZHZpc29yeS1tYW5hZ2VtZW50LXJvbGUiLCJJbmZpbml0eS1TeXN0ZW0tQWRtaW4tUm9sZSIsImRpeS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIkhSRW1wbG95ZWVEYXRhSFJPcENyZWF0ZVJvbGUiLCJmcmFuY2hpc2Utc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJkaXktc2NoZW1hLXJlYWQtcm9sZSIsInN5c3RlbS1hdXRoLXJvbGUiLCJzeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImhyZGF0YS1jcmVhdGUtcm9sZSIsImZyYW5jaGlzZS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIm1mcHJvamVjdC1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImRpeS1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImJ1eWJhY2stc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJtZnByb2plY3Qtc3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiXSwidXNlcl9pZCI6Ijk2ODA5NTc2NTQ0MDAiLCJsb2dpbl9pZCI6ImluZmluaXR5LnN5c3RlbS5hZG1pbkBzaGFyZWtoYW4uY29tIn0.W5AhgyFVDQME0ET-MoKGl8g3EDphqw0Mq0TxwXRktYm4r3qinnTC9rRs4rHVUuBeQgcq1qxS95s4BxK3qWqhow' \
--data '{
    "name": "advisory-permission"
}`'

post ---

curl --location 'http://10.12.37.18:9459/infinity/data/SK.Test1/ResearchStockList' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbmZpbml0eS1TeXN0ZW0tQWRtaW4iLCJleHAiOjE3NTIyNTQwODAsImlzcyI6IjEwLjEyLjM3LjE4Iiwicm9sZXMiOlsic3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiLCJhZHZpc29yeS1tYW5hZ2VtZW50LXJvbGUiLCJJbmZpbml0eS1TeXN0ZW0tQWRtaW4tUm9sZSIsImRpeS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIkhSRW1wbG95ZWVEYXRhSFJPcENyZWF0ZVJvbGUiLCJmcmFuY2hpc2Utc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJkaXktc2NoZW1hLXJlYWQtcm9sZSIsInN5c3RlbS1hdXRoLXJvbGUiLCJzeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImhyZGF0YS1jcmVhdGUtcm9sZSIsImZyYW5jaGlzZS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIm1mcHJvamVjdC1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImRpeS1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImJ1eWJhY2stc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJtZnByb2plY3Qtc3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiXSwidXNlcl9pZCI6Ijk2ODA5NTc2NTQ0MDAiLCJsb2dpbl9pZCI6ImluZmluaXR5LnN5c3RlbS5hZG1pbkBzaGFyZWtoYW4uY29tIn0.W5AhgyFVDQME0ET-MoKGl8g3EDphqw0Mq0TxwXRktYm4r3qinnTC9rRs4rHVUuBeQgcq1qxS95s4BxK3qWqhow' \
--data '{
    "name": "advisory-permission"
}`'

getbyid -- {{id0}} -- key field

curl --location --globoff 'http://10.12.37.18:9459/infinity/data/SK.Test1/ResearchStockList/{{id0}}' \
--header 'Authorization: Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbmZpbml0eS1TeXN0ZW0tQWRtaW4iLCJleHAiOjE3NTIyNTQwODAsImlzcyI6IjEwLjEyLjM3LjE4Iiwicm9sZXMiOlsic3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiLCJhZHZpc29yeS1tYW5hZ2VtZW50LXJvbGUiLCJJbmZpbml0eS1TeXN0ZW0tQWRtaW4tUm9sZSIsImRpeS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIkhSRW1wbG95ZWVEYXRhSFJPcENyZWF0ZVJvbGUiLCJmcmFuY2hpc2Utc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJkaXktc2NoZW1hLXJlYWQtcm9sZSIsInN5c3RlbS1hdXRoLXJvbGUiLCJzeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImhyZGF0YS1jcmVhdGUtcm9sZSIsImZyYW5jaGlzZS1zeXN0ZW0tc2NoZW1hLXJlYWQtcm9sZSIsIm1mcHJvamVjdC1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImRpeS1zeXN0ZW0tbmFtZXNwYWNlLXJlYWQtcm9sZSIsImJ1eWJhY2stc3lzdGVtLW5hbWVzcGFjZS1yZWFkLXJvbGUiLCJtZnByb2plY3Qtc3lzdGVtLXNjaGVtYS1yZWFkLXJvbGUiXSwidXNlcl9pZCI6Ijk2ODA5NTc2NTQ0MDAiLCJsb2dpbl9pZCI6ImluZmluaXR5LnN5c3RlbS5hZG1pbkBzaGFyZWtoYW4uY29tIn0.W5AhgyFVDQME0ET-MoKGl8g3EDphqw0Mq0TxwXRktYm4r3qinnTC9rRs4rHVUuBeQgcq1qxS95s4BxK3qWqhow'



schema response --- 


{
    "base": {
        "type0": "Schema",
        "id0": "SK.Test1^ResearchStockList",
        "apiVersion0": 0,
        "dataState0": "Active",
        "summary0": [
            "SK.Test1",
            "ResearchStockList",
            "Referrable"
        ],
        "createdOn0": "1752246606368",
        "createdBy0": "Ashish Nandanwar",
        "createdById0": "35096679554619",
        "lastChange0": {
            "version0": 3,
            "lastActiveVersion0": 3,
            "change0": "Update",
            "on0": "1752247225514",
            "by0": "Ashish Nandanwar",
            "byId0": "35096679554619"
        },
        "teamsId0": "35524251762401",
        "label": "Research Stock List",
        "schemaState": "45571687432392",
        "namespace": "SK.Test1",
        "name": "ResearchStockList",
        "schemaType": "Referrable",
        "hasIndependentForm": true,
        "fields": {
            "isin": {
                "keyField": true,
                "dataType": "String",
                "pattern": "alphaNumeric",
                "length": 12,
                "label": "ISIN",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "required": true,
                "uiOnly": false,
                "id0": "isin",
                "editability": "Immutable",
                "name": "isin",
                "pkOrder0": "45571901986558",
                "order": 1
            },
            "symbol": {
                "uiOnly": false,
                "id0": "symbol",
                "editability": "Mutable",
                "dataType": "String",
                "name": "symbol",
                "index": "Text",
                "label": "Symbol",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "required": false,
                "order": 2
            },
            "bloomCode": {
                "uiOnly": false,
                "id0": "bloomCode",
                "editability": "Mutable",
                "dataType": "String",
                "name": "bloomCode",
                "label": "Bloom Code",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "order": 3
            },
            "companyName": {
                "uiOnly": false,
                "id0": "companyName",
                "editability": "Mutable",
                "dataType": "String",
                "name": "companyName",
                "index": "Text",
                "label": "Company Name",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "required": true,
                "order": 4
            },
            "targetPrice": {
                "uiOnly": false,
                "id0": "targetPrice",
                "editability": "Mutable",
                "dataType": "Number",
                "name": "targetPrice",
                "label": "Target Price",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "order": 5
            },
            "upside": {
                "uiOnly": false,
                "id0": "upside",
                "editability": "Mutable",
                "dataType": "Number",
                "name": "upside",
                "signed": true,
                "label": "Upside",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "order": 6
            },
            "sector": {
                "uiOnly": false,
                "id0": "sector",
                "editability": "Mutable",
                "dataType": "String",
                "name": "sector",
                "index": "Text",
                "label": "Sector",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "required": true,
                "order": 7
            },
            "mktCap": {
                "uiOnly": false,
                "id0": "mktCap",
                "editability": "Mutable",
                "dataType": "Number",
                "name": "mktCap",
                "label": "Mkt Cap",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "order": 8
            },
            "recommendation": {
                "uiOnly": false,
                "id0": "recommendation",
                "editability": "Mutable",
                "dataType": "String",
                "name": "recommendation",
                "index": "Text",
                "label": "Recommendation",
                "systemGenerated": false,
                "type0": "SK.Schemata^Field",
                "required": true,
                "order": 9
            }
        }
    },
    "versions": {},
    "rejectedDelta": {}
}
