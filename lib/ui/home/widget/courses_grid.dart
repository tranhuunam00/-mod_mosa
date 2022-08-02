import 'package:flutter/material.dart';
import 'package:mod_do_an/ui/home/data/data.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: course.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 7, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              course[index].onTap ?? course[index].onTap(context);
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(course[index].backImage),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          course[index].text,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          course[index].lessons,
                          style: const TextStyle(color: Colors.black),
                        ),
                        CircularPercentIndicator(
                          radius: 30,
                          lineWidth: 8,
                          animation: true,
                          animationDuration: 1500,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: course[index].percent / 100,
                          progressColor: Colors.black,
                          center: Text(
                            "${course[index].percent}%",
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(course[index].imageUrl),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
