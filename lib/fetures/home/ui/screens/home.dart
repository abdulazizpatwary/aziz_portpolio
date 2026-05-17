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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.screenGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
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

  Widget dataBody() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 46),
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    children: [
                      AnimatedTextKit(
                        stopPauseOnTap: false,
                        repeatForever: true,

                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Abdul Aziz Patwary',
                            textStyle: TextStyle(
                              fontSize: isMobile(context) ? 40 : 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            colors: AppColors.textGradient,
                          ),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {},
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
              if (!isMobile(context))
                Image.asset(
                  AssetsPath.profileImageWithOutBackgroundUrl,
                  width: 285,
                  height: 260,
                  fit: BoxFit.contain,
                ),
            ],
          ),
        ),
        //SizedBox(height: 10,),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: isMobile(context) ? 0 : 50),
          decoration: BoxDecoration(
            color: const Color(0XFF111827),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  if (!isMobile(context))
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Text(
                        "Projects",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightGreyColor,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                        softWrap: true,
                      ),
                    ),
                  Expanded(
                    child: Container(
                      //color: AppColors.lightGreyColor,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors:AppColors.darkBlueGradient,begin: Alignment.topLeft,end:Alignment.bottomRight )
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          SocialIcon(
                            path: AssetsPath.cvWebUrl,
                            url: AppConstants.cvUrl,
                            isMobile: isMobile(context),
                          ),
                          SizedBox(width: 15),
                          SocialIcon(
                            path: AssetsPath.callWebpUrl,
                            url: AppConstants.callUrl,
                            isMobile: isMobile(context),
                          ),
                          SizedBox(width: 15),
                          SocialIcon(
                            path: AssetsPath.gmailWebpUrl,
                            url: AppConstants.email,
                            isMobile: isMobile(context),
                            isEmail:true,

                          ),
                          SizedBox(width: 15),
                          SocialIcon(
                            path: AssetsPath.githubWebpUrl,
                            url: AppConstants.githubUrl,
                            isMobile: isMobile(context),
                          ),
                          SizedBox(width: 15),
                          SocialIcon(
                            path: AssetsPath.linkedInWebpUrlWebp,
                            url: AppConstants.linkedinUrl,
                            isMobile: isMobile(context),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
          padding: EdgeInsets.all(isMobile(context) ? 16 : 24),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: isMobile(context) ? 0 : 55),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    textAlign: TextAlign.start,
                    'ABOUT ME',
                    textStyle: TextStyle(
                      fontSize: isMobile(context) ? 18 : 20,
                        color: Colors.blue.shade300,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                    colors: AppColors.textGradient,
                  ),
                ],
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
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: isMobile(context) ? 0 : 55,
          ),
          decoration: BoxDecoration(
            color: const Color(0XFF1E293B),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
           padding: EdgeInsets.all(isMobile(context) ? 16 : 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    "SKILL SET",
                    textStyle: TextStyle(
                      fontSize: isMobile(context) ? 20 : 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: AppColors.textGradient,
                  ),
                ],
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
              SizedBox(height: 8,),

                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 900),
                  child: Text(
                    "Flutter and Android (Java) mobile app development with focus on scalable and user-friendly applications. Experienced in REST API integration and Firebase services including Authentication and Firestore. Skilled in state management using GetX, BLoC, and Provider (basic). Familiar with MVC and MVVM architecture patterns and clean code practices. Proficient in Dart, Java, SQLite, and Git/GitHub for version control and project management. Strong focus on performance optimization, UI/UX implementation, and problem-solving.",
                    style: TextStyle(
                      fontSize: isMobile(context) ? 13 : 15,
                      color:const Color(0xFFD1D5DB),
                      height: 1.7,
                      letterSpacing: 0.2
                    ),
                  ),
                ),

              SizedBox(height: 16,),
              SkillSectionItemWidget(
                isMobile: isMobile(context),
                isTablet: isTablet(context),
              ),
            ],
          ),
        ),
        SizedBox(height: 120,),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: isMobile(context) ? 20 : 55),
          decoration: BoxDecoration(
            color: const Color(0XFF1E293B),
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
                Text("Let's Get in Touch!",
                style: TextStyle(
                  fontSize: isMobile(context) ? 18 : 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 16,),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 900),
                  child: RichText(text: TextSpan(
                    style: TextStyle(
                      fontSize: isMobile(context) ? 13 : 15,
                      color: Colors.grey.shade300,
                      height: 1.5,

                    ),
                    text: "I’m always excited to connect with new people, collaborate on interesting ideas, and discuss mobile development and programming. Feel free to reach out if you have a project idea, opportunity, or just want to talk tech.You can contact me through the social links above or directly via email at ",
                    children: [
                      TextSpan(
                        text: "adnanazizmahin@gmail.com",
                        style: TextStyle(color: Colors.white)
                      )
                    ]
                  ),
                  ),
                ),
                SizedBox(height: 16,),
                Text('© 2026. All rights reserved.',style: TextStyle(
                  fontSize: isMobile(context) ? 13 : 16,
                  color: Colors.grey,
                  height: 1,
                ),),
                SizedBox(height: 16,)
              ],
            ),
          ),
        ),
        SizedBox(height: 32,),
      ],
    );
  }
}
