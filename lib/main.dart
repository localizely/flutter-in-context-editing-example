import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/localizely_localizations.dart';
import 'package:localizely_sdk/localizely_sdk.dart';

void main() {
  runApp(
    const LocalizelyInContextEditing(
      enabled: true, // set to false to disable In-Context Editing
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      localizationsDelegates: LocalizelyLocalizations.localizationsDelegates,
      supportedLocales: LocalizelyLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pageHomeTitle),
      ),
      body: Center(
        child: Container(
          width: 300,
          margin: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 36,
                ),
                child: const Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 84,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context)!.commonNotYetImplemented,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.pageHomeButtonStart,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
