import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/app/app_colors.dart';
import 'package:flutter_portfolio/app/app_constants.dart';
import 'package:flutter_portfolio/app/assets_path.dart';
import 'package:flutter_portfolio/fetures/home/ui/widgets/item_widget.dart';
import 'package:flutter_portfolio/fetures/home/ui/widgets/skill_section_widget.dart';
import 'package:flutter_portfolio/fetures/home/ui/widgets/social_icon.dart';
import 'package:flutter_portfolio/fetures/home/ui/widgets/technology_section_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 600;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isMobile(context)
          ? mobileDrawer()
          : isTablet(context)
          ? mobileDrawer()
          : null,

      appBar: isMobile(context)
          ? AppBar(
              backgroundColor: Color(0XFF1E293B),
              //title: const Text("Portfolio",style: TextStyle(color:Colors.white),),
            )
          : AppBar(
              backgroundColor: Color(0XFF1E293B),
              elevation: 0,
              toolbarHeight: 70,

              title: isDesktop(context) ? builditleSeectionDesktop() : null,

              actions: [
                SocialIcon(
                  path: AssetsPath.githubWebpUrl,
                  url: AppConstants.githubUrl,
                  isMobile: false,
                ),
                const SizedBox(width: 10),
                SocialIcon(
                  path: AssetsPath.linkedInWebpUrlWebp,
                  url: AppConstants.linkedinUrl,
                  isMobile: false,
                ),
                const SizedBox(width: 20),
                SocialIcon(
                  path: AssetsPath.gmailWebpUrl,
                  url: AppConstants.email,
                  isMobile: isMobile(context),
                  isEmail: true,
                ),
                const SizedBox(width: 20),
                SocialIcon(
                  path: AssetsPath.cvWebUrl,
                  url: AppConstants.cvUrl,
                  isMobile: isMobile(context),
                ),
                const SizedBox(width: 20),
                SocialIcon(
                  path: AssetsPath.callWebpUrl,
                  url: AppConstants.callUrl,
                  isMobile: isMobile(context),
                ),
                const SizedBox(width: 20),
              ],
            ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          //color: Colors.black
          gradient: LinearGradient(
            colors: [Color(0xFF071018), Colors.black, Color(0xFF071018)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              ///SizedBox(height: 80),
              ScreenTypeLayout.builder(
                mobile: (context) => dataBody(),
                tablet: (context) => dataBody(),
                desktop: (context) => dataBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget builditleSeectionDesktop() {
    return Row(
      children: [
        navItem(
          title: "Portfolio",
          onTap: () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
            );
          },
        ),
        navItem(title: "Services", onTap: () => scrollToSection(servicesKey)),
        navItem(title: "About", onTap: () => scrollToSection(aboutKey)),
        navItem(title: "Skills", onTap: () => scrollToSection(skillsKey)),
        navItem(title: "Projects", onTap: () => scrollToSection(projectsKey)),
        navItem(
          title: "Resume",
          onTap: () {
            _launchUrl(AppConstants.cvUrl);
          },
        ),
      ],
    );
  }

  Widget mobileDrawer() {
    return Drawer(
      backgroundColor: const Color(0XFF111827),

      child: Column(
        children: [
          SafeArea(
            child: Container(
              //width: double.infinity,
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                drawerItem(
                  title: "Portfolio",
                  onTap: () {
                    Navigator.pop(context);

                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
                  },
                ),

                drawerItem(
                  title: "Services",
                  onTap: () {
                    Navigator.pop(context);
                    scrollToSection(servicesKey);
                  },
                ),

                drawerItem(
                  title: "About",
                  onTap: () {
                    Navigator.pop(context);
                    scrollToSection(aboutKey);
                  },
                ),

                drawerItem(
                  title: "Skills",
                  onTap: () {
                    Navigator.pop(context);
                    scrollToSection(skillsKey);
                  },
                ),

                drawerItem(
                  title: "Projects",
                  onTap: () {
                    Navigator.pop(context);
                    scrollToSection(projectsKey);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Connect With Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,

              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1E293B),
                  ),
                  child: SocialIcon(
                    path: AssetsPath.githubWebpUrl,
                    url: AppConstants.githubUrl,
                    isMobile: false,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1E293B),
                  ),
                  child: SocialIcon(
                    path: AssetsPath.linkedInWebpUrlWebp,
                    url: AppConstants.linkedinUrl,
                    isMobile: false,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1E293B),
                  ),
                  child: SocialIcon(
                    path: AssetsPath.gmailWebpUrl,
                    url: AppConstants.email,
                    isMobile: isMobile(context),
                    isEmail: true,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1E293B),
                  ),
                  child: SocialIcon(
                    path: AssetsPath.cvWebUrl,
                    url: AppConstants.cvUrl,
                    isMobile: isMobile(context),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF1E293B),
                  ),
                  child: SocialIcon(
                    path: AssetsPath.callWebpUrl,
                    url: AppConstants.callUrl,
                    isMobile: isMobile(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget drawerItem({required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white54)),
      onTap: onTap,
    );
  }

  Widget dataBody() {
    return Column(
      children: [
        SizedBox(
          height: isDesktop(context) ? 600 : 600,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: double.infinity, color: Colors.black),
              Positioned(
                top: -20,
                child: Transform.rotate(
                  angle: -0.25,
                  child: Container(
                    width: isMobile(context)?140:280,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 0.9,
                        colors: [
                          Colors.blueAccent.withValues(alpha: 0.6),
                          Colors.lightBlueAccent.withValues(alpha: 0.2),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withValues(alpha: 0.4),
                          blurRadius: 150,
                          spreadRadius: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 46),
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AssetsPath.profileImageWithOutBackgroundUrl,
                          width: 285,
                          height: 260,
                          fit: BoxFit.contain,
                        ),
                      ),
                      AnimatedTextKit(
                        stopPauseOnTap: false,
                        repeatForever: true,

                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Abdul Aziz Patwary',
                            textStyle: TextStyle(
                              fontSize: isMobile(context) ? 32 : 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            colors: AppColors.textGradient,
                          ),
                        ],
                        isRepeatingAnimation: true,
                        //onTap: () {},
                      ),
                      SizedBox(height: 20),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Flutter Developer building modern mobile applications',
                            textAlign: TextAlign.center,
                            cursor: '|',
                            textStyle: TextStyle(
                              fontSize: isMobile(context) ? 16 : 20,
                              color: Colors.white,
                            ),
                            speed: Duration(microseconds: 30),
                          ),
                        ],
                        totalRepeatCount: 1,
                        pause: Duration(microseconds: 200),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                      if (isMobile(context)) SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: isDesktop(context) ? 80 : 60),
        Container(
          key: projectsKey,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: isMobile(context) ? 0 : 50),
          decoration: BoxDecoration(
            //color: const Color(0XFF111827),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.blue.shade600, Colors.cyanAccent],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          " Latest Projects",
                          style: TextStyle(
                            fontSize: isMobile(context) ? 14 : 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Transforming Ideas into Exceptional',
                        style: TextStyle(
                          fontSize: isMobile(context) ? 20 : 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: isDesktop(context) ? 350 : 300,
                        child: Text(
                          'A collection if Flutter projects focused on clean UI, performance, and Real world problem solving.',
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              ItemsWidget(
                isMobile: isMobile(context),
                isTablet: isTablet(context),
              ),
            ],
          ),
        ),
        SizedBox(height: 48),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      "Worked on",
                      textStyle: TextStyle(
                        fontSize: isMobile(context) ? 20 : 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: AppColors.textGradient,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Text(
                    'Technologies & Services I Work With',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile(context) ? 20 : 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              key: servicesKey,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: isMobile(context) ? 0 : 50,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: TechnologyServicesItemWidget(
                isMobile: isMobile(context),
                isTablet: isTablet(context),
              ),
            ),
          ],
        ),
        SizedBox(height: 80),
        Container(
          key: aboutKey,
          padding: EdgeInsets.all(isMobile(context) ? 16 : 24),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: isMobile(context) ? 0 : 55),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Colors.blue.shade600, Colors.cyanAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Text(
                  'ABOUT ME',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: isMobile(context) ? 18 : 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              SizedBox(height: 12),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 900),
                child: Text(
                  "I am a Mobile Application Developer and a Computer Science and Engineering graduate. I specialize in Flutter development with a foundational understanding of Android (Java), focusing on building clean, scalable, and user-friendly mobile applications. I have worked on real-world projects such as eCommerce applications, Firebase-based apps, and API-integrated mobile solutions. These experiences have helped me gain practical knowledge of mobile app development, state management, and performance optimization. I am a passionate learner who continuously explores new technologies and improves my skills to build efficient and high-quality mobile applications. I am currently seeking opportunities to contribute and grow as a professional Flutter Developer.",
                  style: TextStyle(
                    fontSize: isMobile(context) ? 13 : 15,
                    color: const Color(0xFFD1D5DB),
                    fontWeight: FontWeight.w300,
                    height: 1.7,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 80),
        Container(
          key: skillsKey,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: isMobile(context) ? 0 : 55),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF020617), Color(0xFF0B1120)],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          padding: EdgeInsets.all(isMobile(context) ? 16 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [Colors.blue.shade600, Colors.cyanAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds),
                child: Text(
                  "SKILL SET",
                  style: TextStyle(
                    fontSize: isMobile(context) ? 16 : 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 8),
              Text(
                'Technical Skills & Expertise',
                style: TextStyle(
                  fontSize: isMobile(context) ? 18 : 24,
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 900),
                child: Text(
                  "Flutter and Android (Java) mobile app development with focus on scalable and user-friendly applications. Experienced in REST API integration and Firebase services including Authentication and Firestore. Skilled in state management using GetX, BLoC, and Provider (basic). Familiar with MVC and MVVM architecture patterns and clean code practices. Proficient in Dart, Java, SQLite, and Git/GitHub for version control and project management. Strong focus on performance optimization, UI/UX implementation, and problem-solving.",
                  style: TextStyle(
                    fontSize: isMobile(context) ? 13 : 15,
                    color: const Color(0xFFD1D5DB),
                    height: 1.7,
                    letterSpacing: 0.2,
                  ),
                ),
              ),

              SizedBox(height: 16),
              SkillSectionItemWidget(
                isMobile: isMobile(context),
                isTablet: isTablet(context),
              ),
            ],
          ),
        ),
        SizedBox(height: 120),
        Container(
          key: contactKey,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: isMobile(context) ? 20 : 55),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF020617), Color(0xFF0B1120)],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: isMobile(context) ? 20 : 32,
            ),
            child: Column(
              children: [
                Text(
                  "Let's Get in Touch!",
                  style: TextStyle(
                    fontSize: isMobile(context) ? 18 : 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 900),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: isMobile(context) ? 13 : 15,
                        color: Colors.grey.shade300,
                        height: 1.5,
                      ),
                      text:
                          "I’m always excited to connect with new people, collaborate on interesting ideas, and discuss mobile development and programming. Feel free to reach out if you have a project idea, opportunity, or just want to talk tech.You can contact me through the social links above or directly via email at ",
                      children: [
                        TextSpan(
                          text: "adnanazizmahin@gmail.com",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '© 2026. All rights reserved.',
                  style: TextStyle(
                    fontSize: isMobile(context) ? 13 : 16,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
