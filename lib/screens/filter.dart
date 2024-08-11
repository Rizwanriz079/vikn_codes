import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/filter.dart';


class FiltersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FiltersController controller = Get.put(FiltersController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Filters',style: TextStyle(color: Colors.white),),
        actions: [
          TextButton(
            onPressed: () {
              // Handle filter action
            },
            child: Text(
              'Filter',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "This Month" Text and Date Pickers
            Center(
              child: Column(
                children: [
                  DropdownButton<String>(
                    dropdownColor: Colors.black,
                    value: 'This Month',
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    items: <String>['This Month', 'Last Month', 'Custom']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    underline: SizedBox(),
                  ),
                  SizedBox(height: 10), // Spacing between "This Month" and Date Pickers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle start date selection
                        },
                        icon: Icon(Icons.calendar_today, color: Colors.white),
                        label: Text('12/09/2023', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[900],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle end date selection
                        },
                        icon: Icon(Icons.calendar_today, color: Colors.white),
                        label: Text('12/09/2023', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[900],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Status Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToggleButton(controller: controller, status: 'Pending'),
                ToggleButton(controller: controller, status: 'Invoiced'),
                ToggleButton(controller: controller, status: 'Cancelled'),
              ],
            ),
            SizedBox(height: 16),
            // Customer Selector
            DropdownButtonFormField<String>(
              dropdownColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[900],
                labelText: 'Customer',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              items: controller.customers.map((String customer) {
                return DropdownMenuItem<String>(
                  value: customer,
                  child: Text(
                    customer,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                controller.updateCustomer(value ?? '');
              },
            ),
            SizedBox(height: 16),
            // Selected Customer Chip
            Obx(() {
              if (controller.selectedCustomer.isNotEmpty) {
                return Chip(
                  label: Text(
                    controller.selectedCustomer.value,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.grey[800],
                  deleteIconColor: Colors.blue,
                  onDeleted: controller.removeCustomer,
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Custom Toggle Button Widget
class ToggleButton extends StatelessWidget {
  final FiltersController controller;
  final String status;

  ToggleButton({required this.controller, required this.status});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(
      onPressed: () => controller.updateStatus(status),
      child: Text(status),
      style: ElevatedButton.styleFrom(
        backgroundColor: controller.selectedStatus.value == status
            ? Colors.blue
            : Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(100, 40),
      ),
    ));
  }
}