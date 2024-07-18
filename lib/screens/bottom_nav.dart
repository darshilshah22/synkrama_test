import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:synkrama_test/constants/image_constants.dart';
import 'package:synkrama_test/screens/dashboard.dart';
import 'package:synkrama_test/theme/sizes.dart';

import '../constants/color_constants.dart';
import 'order.dart';
import 'profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: const [
              Dashboard(),
              Order(),
              Profile(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(BSizes.borderRadiusAppbar),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  height: BSizes.appBarHeight,
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  margin: const EdgeInsets.only(
                      left: BSizes.md, right: BSizes.md, bottom: BSizes.sm),
                  decoration: BoxDecoration(
                    color: ColorConstants.secondaryColor,
                    borderRadius: BorderRadius.circular(BSizes.borderRadiusAppbar),
                    gradient: LinearGradient(
                      colors: [
                        ColorConstants.bgColor1.withOpacity(0.9),
                        ColorConstants.bgColor1.withOpacity(0.6),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                  ),
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    indicatorColor: ColorConstants.primaryColor,
                    indicator: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstants.primaryColor
                    ),
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    padding: EdgeInsets.zero,
                    tabs: <Widget>[
                      Tab(
                        child: SvgPicture.asset(
                          Images.home,
                          colorFilter: ColorFilter.mode(
                            currentIndex == 0 ? Colors.black : Colors.white,
                            BlendMode.srcIn,
                          ),
                          height: 28,
                        ),
                      ),
                      Tab(
                        child: SvgPicture.asset(
                          Images.cart,
                          colorFilter: ColorFilter.mode(
                            currentIndex == 1 ? Colors.black : Colors.white,
                            BlendMode.srcIn,
                          ),
                          height: 28,
                        ),
                      ),
                      Tab(
                        child: SvgPicture.asset(
                          Images.user,
                          colorFilter: ColorFilter.mode(
                            currentIndex == 2 ? Colors.black : Colors.white,
                            BlendMode.srcIn,
                          ),
                          height: 28,
                        ),
                      ),
                    ],
                    controller: _tabController,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
