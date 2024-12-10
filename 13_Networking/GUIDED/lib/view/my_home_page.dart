import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pertemuan_13/view_model/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;
  final CounterController controller = Get.put(CounterController());

  //int _counter = 0; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Obx(
      () =>
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              controller.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/detail');
              },
              child: Text ('ke halaman detail'))
          ],
        ),
      ),
    ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: controller.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),

          FloatingActionButton(
            onPressed: controller.getSnackbar,
            tooltip: 'Get Snackbar',
            child: const Icon(Icons.message),
          ),

          FloatingActionButton(
            onPressed: controller.getbuttonSheet,
            tooltip: 'Get Bottom Sheet',
            child: const Icon(Icons.bolt_outlined),
          ),
        ],
      ),
    );
  }
}
