import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rms_mgmt/exchange.dart';

class FormScreen extends StatelessWidget {
  final BankSchemaController controller = Get.find();

  FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = controller.fieldKeys;
    final labels = controller.fieldLabels;

    return Scaffold(
      appBar: AppBar(
        title:
            Text(controller.isEditMode.value ? "Edit Entry" : "Create Entry"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Form Fields in 2-column layout
            Expanded(
              child: ListView.builder(
                itemCount: (keys.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final firstKey = keys[index * 2];
                  final secondKey = (index * 2 + 1 < keys.length)
                      ? keys[index * 2 + 1]
                      : null;

                  return Row(
                    children: [
                      // First Field
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.formControllers[firstKey],
                            decoration: InputDecoration(
                              labelText: labels[keys.indexOf(firstKey)],
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),

                      // Second Field (if exists)
                      if (secondKey != null)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller:
                                  controller.formControllers[secondKey],
                              decoration: InputDecoration(
                                labelText: labels[keys.indexOf(secondKey)],
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        )
                      else
                        const Spacer(), // Fill space if only one field in this row
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.back(); // Cancel
                  },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.submitForm();
                    Get.back(); // Back to table screen
                  },
                  child: const Text("Submit"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
