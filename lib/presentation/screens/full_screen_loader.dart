import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final List<String> messages = [
      "Downloading your special movies...",
      "Fetching the latest blockbusters...",
      "Loading cinematic treasures...",
      "Preparing your movie experience...",
      "Gathering the best films for you...",
      "Compiling your movie collection...",
      "Bringing the cinema to your screen...",
      "Loading your personalized movie list...",
      "Fetching the latest releases...",
      "Downloading your favorite films...",
      "Loading your movie recommendations...",
      "Preparing your movie library...",
      "Compiling the best movies just for you...",
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];    
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Downloading movies...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2.0),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshopt) {
              if (!snapshopt.hasData) {
                return const Text('Loading...');
              }

              return Text(snapshopt.data ?? '');
            }
          )
        ]
      ),
    );
  }
}