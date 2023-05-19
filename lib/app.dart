import 'package:dev_pace_test/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'logic/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => MultiProvider(
              providers: providers,
              child: MaterialApp.router(
                useInheritedMediaQuery: true,
                routerConfig: router,
                debugShowCheckedModeBanner: false,
              ),
            ));
  }
}
