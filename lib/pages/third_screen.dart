import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:suitmedia_km/Controllers/secondscreen_controller.dart';
import 'package:suitmedia_km/Controllers/thirdscreen_controller.dart';

class ThirdScreen extends StatelessWidget {
  static const routeName = "/third_screen";
  final thirdC = Get.put(ThirdScreenController());
  final secondC = Get.put(SecondScreenController());
  RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "ThirdScreen",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: GetBuilder<ThirdScreenController>(
          builder: (controller) {
            return SmartRefresher(
              controller: _refreshController,
              header: const ClassicHeader(),
              enablePullUp: true,
              enablePullDown: false,
              onLoading: () {
                thirdC.nextPage();
                _refreshController.refreshCompleted();
              },
              child: FutureBuilder(
                future: thirdC.fetchAllUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('none');
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                      return Text('');
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text(
                          '${snapshot.error}',
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.black26,
                            ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              String selected =
                                  '${snapshot.data[index]['first_name'] + " " + snapshot.data[index]['last_name']}';
                              return ListTile(
                                title: Text(snapshot.data[index]['first_name'] +
                                    " " +
                                    snapshot.data[index]['last_name']),
                                leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        snapshot.data[index]['avatar'])),
                                subtitle: Text(snapshot.data[index]['email']),
                                onTap: () {
                                  secondC.changeSelectedUser(selected);
                                  Get.back();
                                },
                              );
                            },
                          ),
                        );
                      }
                  }
                },
              ),
            );
          },
        ));
  }
}
