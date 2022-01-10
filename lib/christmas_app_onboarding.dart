import 'package:flutter/material.dart';
import 'package:flutter_design_practice/original_design_reference.dart';
import 'package:google_fonts/google_fonts.dart';

const orange = Color(0xFFF56838);
const white = Color(0xFFF3ECE9);

class ChristmasAppOnBoarding extends StatefulWidget {
  const ChristmasAppOnBoarding({Key? key}) : super(key: key);

  @override
  State<ChristmasAppOnBoarding> createState() => _ChristmasAppOnBoardingState();
}

class _ChristmasAppOnBoardingState extends State<ChristmasAppOnBoarding> {
  late final pageController = PageController();
  var currentPage = 0;
  bool ignoreBodyScroll = false;
  bool ignoreImageScroll = false;

  Color get textColor {
    return currentPage % 2 == 0 ? Colors.black : Colors.white;
  }

  Color get pageIndicatorActiveColor {
    return currentPage % 2 == 0 ? Colors.blue : Colors.white;
  }

  Color get pageIndicatorInactiveColor {
    return currentPage % 2 == 0 ? Colors.grey.shade400 : Colors.white38;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme(
      headline1: GoogleFonts.petrona(
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: GoogleFonts.montserrat(
        fontSize: 14,
        color: Colors.white70,
      ),
    );

    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(textTheme: textTheme),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          color: currentPage % 2 == 0 ? white : orange,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: OriginalDesignButton(
                    url:
                        'https://dribbble.com/shots/17113492-Christmas-Gift-App',
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (page) => setState(() {
                    currentPage = page;
                  }),
                  children: [
                    _PageTemplate(
                      title: 'Pick the best gift',
                      text: 'Make your colleague happy, quickly and easily!',
                      image: 'image_1.png',
                      textColor: textColor,
                    ),
                    _PageTemplate(
                      title: 'Wishlist, interests & preferences',
                      text:
                          'Finding a gift is easier when you know the person\'s '
                          'desires.',
                      image: 'image_2.png',
                      textColor: textColor,
                    ),
                    _PageTemplate(
                      title: 'Order a festive mood in the app',
                      text: 'Order flowers, balls, cake, host of the holiday',
                      image: 'image_3.png',
                      textColor: textColor,
                    ),
                  ],
                ),
              ),
              if (currentPage < 2)
                Column(
                  children: [
                    Center(
                      child: _PageIndicator(
                        totalPages: 3,
                        currentPage: currentPage,
                        activeColor: pageIndicatorActiveColor,
                        inactiveColor: pageIndicatorInactiveColor,
                      ),
                    ),
                    NavigationRow(
                      textColor: textColor,
                      onTapNext: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ],
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: _CustomButton(
                      color: textColor,
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: Text(
                          'Let\'s go!',
                          style: textTheme.bodyText1?.copyWith(
                            color: textColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageTemplate extends StatelessWidget {
  final String title;
  final String text;
  final String image;
  final Color textColor;

  const _PageTemplate({
    required this.title,
    required this.text,
    required this.image,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyColor = textColor.withOpacity(0.8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Image.asset(
                'assets/christmas_app_onboarding/$image',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.headline1?.copyWith(
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  text,
                  style: textTheme.bodyText1?.copyWith(color: bodyColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationRow extends StatelessWidget {
  final Color textColor;
  final VoidCallback onTapNext;

  const NavigationRow({
    Key? key,
    required this.textColor,
    required this.onTapNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      child: Row(
        children: [
          Text(
            'Swipe',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: textColor),
          ),
          const Spacer(),
          _CustomButton(
            child: Icon(Icons.east, color: textColor),
            color: textColor,
            onTap: onTapNext,
          ),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final Widget child;

  const _CustomButton({
    Key? key,
    required this.color,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: child,
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final Color activeColor;
  final Color inactiveColor;

  const _PageIndicator({
    Key? key,
    required this.totalPages,
    required this.currentPage,
    required this.activeColor,
    required this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < totalPages; i++)
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: inactiveColor,
                  ),
                ),
            ],
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment: activeDotAlignment,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: activeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Alignment get activeDotAlignment {
    switch (currentPage) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return Alignment.center;
      case 2:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }
}
