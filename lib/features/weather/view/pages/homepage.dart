import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:machine_test_karthik/features/todo/view/pages/todopage.dart';
import 'package:machine_test_karthik/features/weather/model/weather_model.dart';
import 'package:machine_test_karthik/features/weather/services/get_weather.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use hooks to manage state
    final weatherInfo =
        useState<String?>(null); // Holds fetched weather information
    final isLoading = useState<bool>(false); // Loading state
    // determinePosition();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchBar(
              hintText: "Search Place",
              onSubmitted: (value) async {
                isLoading.value = true; // Start loading
                weatherInfo.value = null; // Clear previous weather info

                try {
                  Welcome weather = await GetWeather().getWeather(value);
                  weatherInfo.value = 'Location: ${weather.location?.name}\n'
                      'Temperature: ${weather.current?.tempC}°C \n'
                      'Condition: ${weather.current?.condition?.text}';
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                } finally {
                  isLoading.value = false; // Stop loading
                }
              },
            ),
          ),
          if (isLoading.value)
            const CircularProgressIndicator() // Show loading indicator
          else if (weatherInfo.value != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                weatherInfo.value!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 240, 229, 229),
                  fontSize: 24,
                ),
              ),
            ),
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

// Custom Search Bar Widget remains unchanged
class SearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onSubmitted;

  const SearchBar({
    super.key,
    required this.hintText,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[800],
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
