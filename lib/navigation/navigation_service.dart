import 'package:flutter/material.dart';
import 'package:medlike/navigation/router.gr.dart';

class NavigationService{
  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService(){
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String _rn){
    return navigationKey.currentState!.pushReplacementNamed(_rn);
  }
  Future<dynamic> navigateTo(String _rn){
    print(('###############$_rn'));
    return navigationKey.currentState!.pushNamedAndRemoveUntil(_rn, (route) => false);
    return navigationKey.currentState!.pushNamed(_rn);
  }
  Future<dynamic> navigateToRoute(MaterialPageRoute _rn){
    return navigationKey.currentState!.push(_rn);
  }

  goback(){
    return navigationKey.currentState!.pop();

  }
}