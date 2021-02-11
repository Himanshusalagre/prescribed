import 'package:wlcm/screens/doctor_info_page.dart';
import 'package:wlcm/widgets/rounded_square_box.dart';
import 'package:flutter/material.dart';
import 'package:wlcm/constant.dart';
import 'package:wlcm/doctor_list.dart';

var doctors = doctorList;

final BoxDecoration categoriesBoxDecoration = BoxDecoration(
  color: Colors.white,
  border: Border(
    top: BorderSide.none,
    bottom: BorderSide.none,
    left: BorderSide.none,
    right: BorderSide.none,
  ),
  // border: Border.all(color: Colors.black, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 3.0,
      spreadRadius: 2.0,
    ),
  ],
);

final BoxDecoration iconBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 4.0,
      spreadRadius: 2.0,
    )
  ],
);

class SearchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    // path.relativeArcToPoint(Offset.zero);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SearchDoctor extends StatefulWidget {
  @override
  _SearchDoctorState createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cover_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // BACK BUTTON
            Positioned(
              top: 54.0,
              left: 18.0,
              child: GestureDetector(
                onTap: () {},
                child: RoundedSquareBox(
                  pillDimension: 48,
                  childDecoration: iconBoxDecoration,
                  childContent: Container(
                    padding: EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage('assets/icons/caduceus.png'),
                      color: kDarkBlueColor,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
            // SEARCH BAR
            Positioned(
              top: 54,
              left: 84,
              child: Container(
                padding: EdgeInsets.only(left: 12),
                height: 48,
                decoration: iconBoxDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.search_rounded,
                        color: kDarkBlueColor,
                        size: 24.0,
                      ),
                    ),
                    SizedBox(width: 6),
                    Container(
                      child: SizedBox(
                        width: 180,
                        child: TextField(
                          autofocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 120,
              left: 18, // (36 + 24 + 12 + 18 )= 90 + 18
              child: Container(
                child: Text(
                  'Let\'s find the right doctor :)',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: kDarkBlueColor,
                  ),
                ),
              ),
            ),

            // MAIN BODY
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Categories', style: kTitleTextstyle),
                          Spacer(),
                          Text(
                            'See all',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      Container(child: CategoriesScroller()),

                      // DISPLAY DOCTOR LIST
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: doctors.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InfoTile(
                                name: doctors[index]['name'],
                                subText: doctors[index]['specialisation'],
                                hasAvatarImage: true,
                                avatarImage: AssetImage(
                                  doctors[index]['image'],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} //end of screen

// vertical category scroller
class CategoriesScroller extends StatelessWidget {
  CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    // final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/heartcare.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/dentalcare.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/opthalmologist.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/entcare.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
              RoundedSquareBox(
                pillDimension: 72,
                childContent: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset('assets/icons/orthopedic.png'),
                ),
                childDecoration: categoriesBoxDecoration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  InfoTile({
    this.avatarImage,
    this.name,
    this.subText,
    @required this.hasAvatarImage,
  });
  final String name;
  final String subText;
  final double borderRadius = 18;
  final AssetImage avatarImage;
  final bool hasAvatarImage;

  final AssetImage defaultImage =
      AssetImage('assets/images/doctor_avatar_3.jpg');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DoctorInfoPage();
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey[100],
              blurRadius: 3.0,
              spreadRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
        ),
        // width: ,
        child: Row(
          children: [
            Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
                // color: Colors.white,
                image: DecorationImage(
                  image: hasAvatarImage ? avatarImage : defaultImage,
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: kTitleTextColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subText,
                  style: TextStyle(
                    color: kBodyTextColor,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse_rounded,
                      size: 14.0,
                    ),
                    SizedBox(width: 3),
                    Text(
                      '10.00AM',
                      style: TextStyle(
                        color: kBodyTextColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
