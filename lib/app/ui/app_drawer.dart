import 'package:flutter/material.dart';
import 'package:killed_by_google/app/services/theme.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // SizedBox(
          //   height: 300,
          //   width: double.infinity,
          //   child: Center(child: Image.asset('assets/images/googlelogo.png')),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
            child: RichText(
              textScaleFactor: 2,
              text: TextSpan(
                children: [
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
                  TextSpan(
                    text: ' Graveyard',
                    style: TextStyle(
                        fontFamily: 'Product Sans',
                        color: Theme.of(context).textTheme.bodyText1.color),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Consumer<AppTheme>(
            builder: (context, provider, child) => SwitchListTile.adaptive(
              title: Text('Dark Theme'),
              value: provider.isDark,
              onChanged: (value) => provider.themeSwitcher = value,
            ),
          ),
          Divider(),
          ExpansionTile(
            title: Text('Category'),
            children: [
              CheckboxListTile(
                  title: Text('Service'), value: false, onChanged: (value) {}),
              CheckboxListTile(
                  title: Text('App'), value: false, onChanged: (value) {}),
              CheckboxListTile(
                  title: Text('Hardware'), value: false, onChanged: (value) {}),
            ],
          ),
        ],
      ),
    );
  }
}
