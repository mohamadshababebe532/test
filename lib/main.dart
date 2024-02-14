 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
 
import 'package:senzascent/presentiton/view_model/home/home_view_model.dart';
import 'package:senzascent/presentiton/views/Accounter/cubit/accounter_cubit.dart';
import 'package:senzascent/presentiton/views/home/home_screen.dart';
import 'package:senzascent/presentiton/views/splash/splash_screen.dart';
 
import 'core/theme/app_theme.dart';
// Future<void> backgroundNotification(RemoteMessage message) async {
//   if(message.data.isNotEmpty){
//  await NotificationMethod.showNotification(id:0, title: message.notification!.title, body: message.notification!.body);
//   // if( message.notification!.title=='New Holiday Request'){
     

//   // }
//   }

//   print('kk' + message.notification!.title!);
// }

// final navigatorKey = GlobalKey<NavigatorState>();
  void main()  {
runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  

  @override
  Widget build(BuildContext context) {

    
      
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeViewModel()),
         
        ],
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AccounterCubit()..getresource(),
              ),
         
            ],
            child: MaterialApp(
              
              debugShowCheckedModeBanner: false,
              theme: appTheme,
              title: 'holool_app App',
              home: SplashScreen(),
           
            ),
          );
        });
  }
}
