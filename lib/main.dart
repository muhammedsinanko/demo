import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(NewClass());
  Get.put(HomeController());
  runApp(const GetMaterialApp(
    home: HomePage(),
  ));
}

class HomeController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}

class NewClass extends GetxController {
  RxInt count = 0.obs;
  void incrementValue() {
    count++;
  }
}

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Obx(
          () => Column(
            children: [
              Text(
                'Count: ${Get.find<NewClass>().count}',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                'Count: ${controller.count}',
                style: const TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.find<NewClass>().incrementValue();
                  },
                  child: const Text("Click"))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(SecondPage());
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    var count = 0.obs;
    return Center(
      child: Obx(
        () => Column(
          children: [
            Text(count.toString()),
            ElevatedButton(
                onPressed: () {
                  count++;
                  Get.snackbar("Hi", "ww");
                  Get.defaultDialog(title: "alert");
                },
                child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
