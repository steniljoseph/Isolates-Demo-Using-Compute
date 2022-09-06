import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Isolate Using Compute"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                log("started");
                final sum = await compute(computeHeavyTaskCompute, 10000000);

                log(sum.toString());
              },
              child: const Text("Star Task"),
            ),
          ],
        ),
      ),
    );
  }
}

int computeHeavyTaskCompute(int value) {
  int sum = 90;
  for (int i = 0; i < value; i++) {
    sum += value;
  }
  log("task finished");
  return sum;
}
