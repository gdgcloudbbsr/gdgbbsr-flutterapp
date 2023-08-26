import 'package:flutter/material.dart';
import 'package:gdgbbsr/providers/api_calls.dart';
import 'package:gdgbbsr/screens/home.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: double.infinity,
        width: 300,
        child: FutureBuilder(
          future: GdgApi.getAllSites(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.grey[900],
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              );
            } else {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.grey[900],
                child: ListView.builder(
                  itemCount: snapshot.data?['data'].length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(
                        Icons.web,
                        color: Colors.white,
                      ),
                      title: Text(
                        snapshot.data?["data"][index]["title"],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              pageName: snapshot.data?["data"][index]["name"],
                              pageTitle: snapshot.data?["data"][index]["title"],
                              pageLink: snapshot.data?["data"][index]["link"],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
