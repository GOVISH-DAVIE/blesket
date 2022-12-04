import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabContainer extends StatefulWidget {
  const TabContainer({super.key});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              width: (MediaQuery.of(context).size.width / (2.1)) / 1.5,
              child: TabBar(
                labelColor: Colors.black,
                indicatorColor: themeGreen,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(text: 'Shopping list'),
                  Tab(
                    text: 'Deals',
                  ),
                  Tab(
                    text: 'Coupons',
                  ),
                ],
              ),
            ),
            // Divider(),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: Image.asset('assets/images/1.png'),
                        title: const Text(
                          'Nutripro Family Porridge Wimbi Mix',
                        ),
                        subtitle: const Text('Aisle 23'),
                        trailing: const Text(
                          'Ksh 255.00',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18),
                        child: Divider(),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 28.0, top: 10, bottom: 10),
                        child: Text(
                          'Deals near you',
                          style: TextStyle(
                              color: themeGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 100,
                          width: 70,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/1.png'))),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      color: Colors.red.withOpacity(.2)),
                                  child: const Text(
                                    '12%',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // child: Image.asset('assets/images/1.png')
                        ),
                        title: const Text(
                          'Nutripro Family Porridge Wimbi Mix',
                        ),
                        subtitle: const Text('Aisle 23'),
                        trailing: const Text(
                          'Ksh 255.00',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18),
                        child: Divider(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 94,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: themeGrey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 22,
                                      width: 84,
                                      decoration: BoxDecoration(
                                          color: themeGreekBlue.withOpacity(.4),
                                          border: Border.all(
                                            color: themeBlue,
                                            width: 1,
                                          )),
                                      child: Center(
                                        child: Text(
                                          '#976F-011E',
                                          style: TextStyle(
                                              color: themeBlue, fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text('12% off all groceries'),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0, top: 4),
                                    child: Text('Offer Valid until 11/11/2022'),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Container(
                                    height: 40,
                                    width: 94,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: themeGrey)),
                                    child: const Center(child: Text('Redeem'))),
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
