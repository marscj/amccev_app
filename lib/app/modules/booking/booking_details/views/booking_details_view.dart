import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_details_controller.dart';

class BookingDetailsView extends GetView<BookingDetailsController> {
  const BookingDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookingDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookingDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
