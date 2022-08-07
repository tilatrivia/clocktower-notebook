import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  void _launchUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw "Could not open url $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Clocktower Notebook",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const Text("Version 1.0",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              const Text("Created by Truman Kautzman",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              GestureDetector(
                child: const Text("tilatrivia.com",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    height: 1.5,
                  ),
                ),
                onTap: () => _launchUrl("https://tilatrivia.com")
              ),
              GestureDetector(
                  child: const Text("Source on Github",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      height: 1.5,
                    ),
                  ),
                  onTap: () => _launchUrl("https://github.com/tilatrivia/clocktower-notebook")
              ),
              const SizedBox(
                height: 50,
              ),
              const Text("Blood on the Clocktower",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const Text("Created by Steven Medway and the Pandemonium Institute",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              GestureDetector(
                  child: const Text("bloodontheclocktower.com",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      height: 1.5,
                    ),
                  ),
                  onTap: () => _launchUrl("https://bloodontheclocktower.com")
              ),
            ],
          ),
        )
    );
  }
}