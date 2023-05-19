import 'package:dev_pace_test/logic/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListState>(
      builder: (_, state, __) => Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => state.addItem(),
              child: const Icon(Icons.plus_one),
            ),
            SizedBox(
              height: 5.h,
            ),
            FloatingActionButton(
              onPressed: () => state.removeItem(),
              child: const Icon(Icons.exposure_minus_1),
            ),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: 1.sh - MediaQuery.of(context).viewPadding.vertical,
                maxHeight: double.infinity),
            child: Column(
              mainAxisAlignment: state.data.isNotEmpty
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (state.data.isNotEmpty) const SizedBox(),
                Container(
                  margin: EdgeInsets.all(15.w),
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
                if (state.data.isNotEmpty)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(),
                      GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 4.5, crossAxisCount: 2),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 5.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                alignment: Alignment.center,
                                width: 0.4.sw,
                                height: 30.h,
                                child: Text('Item${index + 1}'),
                              ))
                    ],
                  )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
