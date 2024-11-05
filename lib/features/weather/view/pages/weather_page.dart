import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:machine_test_karthik/features/todo/view/pages/todopage.dart';
import 'package:machine_test_karthik/features/weather/controller/weather_controller.dart';
import 'package:machine_test_karthik/features/weather/view/widgets/search_field_widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  static const routePath = "/homepage";

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchFieldWidget(
              hintText: "Search Place",
              onSubmitted: ref
                  .read(weatherControllerProvider.notifier)
                  .searchWeatherData,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 140,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: -25,
                      child: Text(
                        'o',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const Text(
                    'Palakkad',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const Text(
                    'Cloudy',
                    style: TextStyle(
                      color: Color.fromARGB(255, 202, 202, 202),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TodoPage()),
          );
        },
        child: const Text("Todo"),
      ),
    );
  }
}
