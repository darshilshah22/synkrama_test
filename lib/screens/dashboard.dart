import 'package:flutter/material.dart';
import 'package:synkrama_test/constants/color_constants.dart';
import 'package:synkrama_test/constants/constants.dart';
import 'package:synkrama_test/theme/custom_themes/text_theme.dart';
import 'package:synkrama_test/theme/sizes.dart';

import '../widgets/common_widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        isPop: false,
        title: "Dashboard",
        // actions: [
        //   buildIcon(
        //     context,
        //     icon: Icons.notifications,
        //   ),
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHorizontalList(),
              const SizedBox(
                height: BSizes.spaceBtwSections,
              ),
              buildVerticalList(),
              const SizedBox(
                height: BSizes.spaceBtwSections,
              ),
              buildGridList(),
              const SizedBox(
                height: BSizes.appBarHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHorizontalList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: BSizes.defaultSpace, top: BSizes.defaultSpace),
          child: Text(
            "Horizontal List",
            style: BTextTheme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          height: BSizes.getScreenHeight(context) * 0.15,
          margin: const EdgeInsets.only(top: BSizes.defaultSpace),
          child: ListView.builder(
            itemCount: imagesList.length,
            shrinkWrap: true,
            padding:
                const EdgeInsets.symmetric(horizontal: BSizes.defaultSpace),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: BSizes.getScreenHeight(context) * 0.15,
                width: BSizes.getScreenHeight(context) * 0.15,
                margin: EdgeInsets.only(right: index == 9 ? 0 : BSizes.md),
                decoration: BoxDecoration(
                    color: ColorConstants.bgColor2,
                    borderRadius: BorderRadius.circular(BSizes.defaultSpace),
                    image:
                        DecorationImage(image: AssetImage(imagesList[index]))),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildVerticalList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: BSizes.defaultSpace, top: BSizes.defaultSpace),
          child: Text(
            "Vertical List",
            style: BTextTheme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: BSizes.defaultSpace),
          child: ListView.builder(
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding:
                const EdgeInsets.symmetric(horizontal: BSizes.defaultSpace),
            itemBuilder: (context, index) {
              return Container(
                height: BSizes.getScreenHeight(context) * 0.4,
                margin: EdgeInsets.only(bottom: index == 4 ? 0 : BSizes.md),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(BSizes.defaultSpace),
                  color: ColorConstants.bgColor2,
                  image: DecorationImage(
                      image: AssetImage(
                        imagesList[index],
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildGridList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: BSizes.defaultSpace, top: BSizes.defaultSpace),
          child: Text(
            "Grid List",
            style: BTextTheme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: BSizes.defaultSpace),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: BSizes.md,
                childAspectRatio: 1),
            itemCount: imagesList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding:
                const EdgeInsets.symmetric(horizontal: BSizes.defaultSpace),
            itemBuilder: (context, index) {
              return Container(
                height: BSizes.getScreenHeight(context) * 0.4,
                margin: const EdgeInsets.only(bottom: BSizes.md),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(BSizes.defaultSpace),
                  color: ColorConstants.bgColor2,
                  image: DecorationImage(
                      image: AssetImage(
                        imagesList[index],
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
