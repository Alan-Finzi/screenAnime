import 'package:flutter/material.dart';
import 'package:team_gamers_2_0/pages/home_page.dart';
import 'package:team_gamers_2_0/pages/sample_page.dart';
import 'package:team_gamers_2_0/pages/user_page.dart';

///////////////////////////////////////////////////////
//// DON'T DELETE AND ADIT COMMENTS OF THIS PAGE  /////
//// Enter the routes in their respective module  /////
///////////////////////////////////////////////////////
class ApplicationRoutes {
	static Map<String, WidgetBuilder> getApplicationRoutes(){
		return <String, WidgetBuilder> {
			//#home
			UserLoginPage.routeName         : (BuildContext context) => UserLoginPage(),
			SampleScreen.routeName         : (BuildContext context) => SampleScreen(),
			HomePage.routeName         : (BuildContext context) => HomePage(),
		};
	}
}



//////////////////////////////////////
//////////////////////////////////////
///  MUST BE IMPLEMENT NEXT CLASS  ///
//////////////////////////////////////

//call this class with
//PaymunRoutes.paymunNavigator(context: context, routeName: HomePage.routeName);
class PaymunRoutes{
	static void navigator({required BuildContext context, required String routeName}){
		Navigator.of(context).push(_createRoute(destinationPage: _navigationData[routeName]),);
	}

	static Route _createRoute({dynamic destinationPage}) {
		return PageRouteBuilder(
			pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
			transitionsBuilder: (context, animation, secondaryAnimation, child) { return child;},
		);
	}

	static Map<String, dynamic> _navigationData = {

		//#home
		UserLoginPage.routeName : UserLoginPage(),
		SampleScreen.routeName  : SampleScreen(),
		HomePage.routeName      : HomePage(),


	};
}
