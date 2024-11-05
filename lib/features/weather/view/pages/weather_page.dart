import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:machine_test_karthik/features/todo/view/pages/todo_page.dart';
import 'package:machine_test_karthik/features/weather/controller/weather_controller.dart';
import 'package:machine_test_karthik/features/weather/view/widgets/search_field_widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  static const routePath = "/homepage";

  @override
  Widget build(BuildContext context, ref) {
    final weatherData = ref.watch(weatherControllerProvider);

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
          FutureBuilder(
              future: weatherData.weatherData,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'Cannot load weather data. Try again',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData && weatherData.weatherData != null) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            weatherData.weatherData == null
                                ? '-'
                                : snapshot.data!.current!.tempC.toString(),
                            style: const TextStyle(
                              fontSize: 140,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const Positioned(
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
                        child: Text(
                          weatherData.weatherData == null
                              ? 'Current Location\n(${weatherData.currentLocation?.latitude ?? 0}, ${weatherData.currentLocation?.longitude ?? 0})'
                              : snapshot.data!.location!.name.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (weatherData.weatherData != null)
                        Transform.translate(
                          offset: const Offset(0, -20),
                          child: Text(
                            snapshot.data!.current!.condition!.text.toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 202, 202, 202),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
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
