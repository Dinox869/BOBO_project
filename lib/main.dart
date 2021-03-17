import 'package:bobo_ui/authentication.dart';
import 'package:bobo_ui/components/companies_register.dart.dart';
import 'package:bobo_ui/modules/club_module.dart';
import 'package:bobo_ui/root_page.dart';
import 'package:bobo_ui/taxi/lib/screens/home.dart';
import 'package:bobo_ui/taxi/lib/states/app_state.dart';
import 'package:bobo_ui/ui/company_ui.dart';
import 'package:bobo_ui/ui/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp
    (
      MultiProvider(
                        providers: [
                                     ChangeNotifierProvider.value(value: AppState(),)
                                   ],
                         child: MyApp(),


      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bobo App',
      theme: ThemeData(
        primaryColor: Color(0xFF707070),
      ),
      home: MultiProvider(
            providers: [
              ChangeNotifierProvider<ClubModule>(builder: (context)=> ClubModule(),),
            ],


          child: RootPage()
          ),
      routes: <String, WidgetBuilder> {
        '/taxi':(BuildContext context) => MyHomePage(title: 'BOBO Taxi'),
        '/club': (BuildContext context) => ClubsPage(),
        '/event': (BuildContext context) => EventsPage(),
        '/company': (BuildContext context) => CompanyUi(),
        '/logout': (BuildContext context) => RootPage(),
        '/tickets': (BuildContext context) => TicketPage(),
        '/payment': (BuildContext context) => PaymentPage(),
        '/reservation': (BuildContext context) => ReservationPage(),
        '/settings': (BuildContext context) => SettingsPage(),
      },
    );
  }
}

class ClubsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("ClubsPage")
        ,
      ),
    );
  }
}
class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RegisterCompany();
  }
}
class CrewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("crew"),),      
    );
  }
}
class TaxiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("taxi"),),      
    );
  }
}
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("payment"),),      
    );
  }
}
class ReservationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("reservation"),),      
    );
  }
}
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("settings"),),      
    );
  }
}