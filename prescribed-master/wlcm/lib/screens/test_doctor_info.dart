import 'package:wlcm/constant.dart';
import 'package:wlcm/widgets/map_snippet.dart';
import 'package:wlcm/widgets/read_more_text.dart';
import 'package:wlcm/widgets/rounded_square_box.dart';
import 'package:flutter/material.dart';

class TestDoctorInfo extends StatefulWidget {
  @override
  _TestDoctorInfoState createState() => _TestDoctorInfoState();
}

class _TestDoctorInfoState extends State<TestDoctorInfo> {
  final greenTitleText = TextStyle(
    fontFamily: 'Comfortaa',
    fontSize: 16,
    color: kDarkGreen,
    fontWeight: FontWeight.bold,
  );

  final BoxDecoration iconBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 1.0,
        spreadRadius: 1.0,
      )
    ],
  );
  final BoxDecoration iconBoxDecoration2 = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 1.0,
        spreadRadius: 1.0,
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 32,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBgWhite,
              // border: Border.all(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RoundedSquareBox(
                    pillDimension: 48,
                    childDecoration: iconBoxDecoration,
                    childContent: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: kDarkGreen,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // INTRO SECTION
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.5,
                            blurRadius: 3.0,
                            offset: Offset(3, 2),
                          ),
                        ],
                      ),
                      height: 144,
                      width: 108,
                      child: ClipRRect(
                        // this border and parent border has difference of 3
                        // because if done same, tiny parent body is visible in red
                        //try it out
                        borderRadius: BorderRadius.all(Radius.circular(21)),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/blm_doctor.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 24.0, top: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr Shreya Shah',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 16,
                              color: kDarkGreen,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            child: Text(
                              'Heart Surgeon Specialist',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            child: Text(
                              'MBBS | MS.Cardio | AIMS',
                              style: TextStyle(
                                color: kTextLightColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundedSquareBox(
                                pillDimension: 28,
                                childDecoration: iconBoxDecoration2,
                                childContent: Container(
                                  child: Icon(
                                    Icons.call_rounded,
                                    size: 22,
                                    color: kDarkGreen,
                                  ),
                                ),
                              ),
                              Text('913774565'),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundedSquareBox(
                                pillDimension: 28,
                                childDecoration: iconBoxDecoration2,
                                childContent: Container(
                                  child: Icon(
                                    Icons.house_rounded,
                                    size: 22,
                                    color: kDarkGreen,
                                  ),
                                ),
                              ),
                              Text('913774565'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // MAIN BODY SECTIONS
                SizedBox(height: 24),
                GestureDetector(
                  onTap: () {},
                  child: Opacity(
                    opacity: 0.85,
                    child: Container(
                      width: 322,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Center(
                        child: Text(
                          'Book Appointment',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(
                    top: 18,
                    bottom: 18,
                    left: 16,
                    right: 8,
                  ),
                  width: 322,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1.5,
                        blurRadius: 3.0,
                        offset: Offset(2, -1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Biography',
                        style: greenTitleText,
                      ),
                      SizedBox(height: 8),
                      ReadMoreText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        trimLines: 2,
                        colorClickableText: kRecovercolor,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '... read more',
                        trimExpandedText: ' show less',
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Location',
                        style: greenTitleText,
                      ),

                      SizedBox(height: 8),
                      // GOOGLE MAP SNIPPET
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(21)),
                        child: Container(
                          height: 246,
                          width: 288,
                          child: MapSnippet(),
                        ),
                      ),

                      //BOOK APPOITNMENT BUTTON
                      SizedBox(height: 24),
                      Text(
                        'About',
                        style: greenTitleText,
                      ),
                      SizedBox(height: 8),
                      ReadMoreText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        trimLines: 2,
                        colorClickableText: kRecovercolor,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '... read more',
                        trimExpandedText: ' show less',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
