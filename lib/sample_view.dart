import 'package:flutter/material.dart';
import 'package:flutter_ios_configruation/native/configuration.dart';
import 'package:flutter_ios_configruation/pigeon.dart';

class SampleView extends StatefulWidget {
  const SampleView({Key? key}) : super(key: key);
  @override
  State<SampleView> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  List<Book?> bookItems = [];
  String version = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchVersion();
  }

  Future<void> fetchVersion() async {
    version = await ConfigurationApi().fetchCurrent() ?? '';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(version),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result = await BookApi().search('a');
        setState(() {
          bookItems = result;
        });
        await ConfigurationApi().updateVersion(Version(major: 1, minor: 0, patch: 15));
        fetchVersion();
      }),
      body: ListView.builder(
        itemCount: bookItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            bookItems[index]?.title ?? '',
            style: Theme.of(context).textTheme.headline3,
          );
        },
      ),
    );
  }
}
