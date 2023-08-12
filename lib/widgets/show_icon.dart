import 'package:flutter/material.dart';
import 'package:open_weather_provider/constants/constants.dart';

Widget showIcon(String icon) {
  return FadeInImage.assetNetwork(
    placeholder: 'assets/images/loading.gif',
    image: 'http://$kIconHost/img/wn/$icon@4x.png',
    width: 96,
    height: 96,
  );
}
