import 'package:cvideo_employer_mobile/src/app_components/app_components.dart';
import 'package:cvideo_employer_mobile/src/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        
        if (state is AuthenticationSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.SCR003_SCREEN, (route) => false);
        }

        if (state is AuthenticationFailure) {
          Navigator.of(context).pushNamed(AppRoutes.SCR001_SCREEN);
        }
      },
      child: Container(
        color: AppColors.primaryColor,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  "assets/screens/scr001/splash_screen_bg.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.primaryColor,
                valueColor:
                    AlwaysStoppedAnimation(AppColors.secondaryLightColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
