import 'package:flutter/material.dart';
import 'package:killed_by_google/app/repositories/data.dart';
import 'package:killed_by_google/app/repositories/test.dart';
import 'package:killed_by_google/app/services/graveyard_model.dart';
import 'package:killed_by_google/app/services/theme.dart';
import 'package:killed_by_google/app/ui/app_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        title: RichText(
          softWrap: true,
          textScaleFactor: 1.5,
          text: TextSpan(
            text: 'Killed by ',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1?.color,
              fontFamily: 'Product Sans',
            ),
            children: const [
              TextSpan(
                text: 'G',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.blue,
                  // fontSize: 18,
                ),
              ),
              TextSpan(
                text: 'o',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.red,
                ),
              ),
              TextSpan(
                text: 'o',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.yellow,
                ),
              ),
              TextSpan(
                text: 'g',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.blue,
                ),
              ),
              TextSpan(
                text: 'l',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.green,
                ),
              ),
              TextSpan(
                text: 'e',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: const GraveyardList(),
    );
  }
}

class GraveyardList extends StatefulWidget {
  const GraveyardList({Key? key}) : super(key: key);

  @override
  State<GraveyardList> createState() => _GraveyardListState();
}

class _GraveyardListState extends State<GraveyardList> {
  late Future<List<Graveyard>> _future;
  @override
  void initState() {
    super.initState();
    _future = context.read<Data>().dataList();
    fake();
  }

  var isLoading = true;
  Future<void> fake() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isLoading = false;
    });
  }

  final _colorsWithOpacity = [
    Colors.blue.withOpacity(0.1),
    Colors.red.withOpacity(0.1),
    Colors.yellow.withOpacity(0.1),
    Colors.blue.withOpacity(0.1),
    Colors.green.withOpacity(0.1),
    Colors.red.withOpacity(0.1),
  ];
  final _colors = [
    Colors.blue[100],
    Colors.red[100],
    Colors.yellow[100],
    Colors.blue[100],
    Colors.green[100],
    Colors.red[100],
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>().isDark;
    return FutureBuilder<List<Graveyard>>(
      future: _future,
      initialData: offlineData,
      builder: (context, snapshot) {
        return Column(
          children: [
            if (isLoading) const LinearProgressIndicator(),
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];
                  return Card(
                    color: theme
                        ? _colorsWithOpacity[index % _colors.length]
                        : _colors[index % _colors.length],
                    child: _BuildListTile(data: data),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BuildListTile extends StatelessWidget {
  const _BuildListTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Graveyard data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      title: Text(data.name!),
      subtitle: Text(data.description!),
    );
  }
}
