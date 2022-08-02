import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mod_do_an/config/colors.dart';
import 'package:mod_do_an/ui/home/widget/courses_grid.dart';
import 'package:mod_do_an/ui/home/widget/planing_grid.dart';

import '../../component/side_menu/side_menu.dart';

class AnalyticScreen extends StatelessWidget {
  const AnalyticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://scontent-hkt1-1.xx.fbcdn.net/v/t39.30808-6/296911900_1232846784136988_8929172463522209673_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5cd70e&_nc_ohc=aZUKXMJQHmcAX8nUX5S&_nc_ht=scontent-hkt1-1.xx&oh=00_AT-ZM5rq-MuNgRDsY_Ahr8AKN-uZlbEycS6DYjS6FurlUA&oe=62EEC7B8"),
            ),
          )
        ],
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: const TextSpan(
                  text: "Hello ",
                  style: TextStyle(color: AppColors.kDarkBlue, fontSize: 20),
                  children: [
                    TextSpan(
                      text: "Nam",
                      style: TextStyle(
                          color: AppColors.kDarkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ", welcome !",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CourseGrid(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Service",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: AppColors.kDarkBlue),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const PlaningGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
