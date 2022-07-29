import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: BookingController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('BookingView'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'BookingView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
