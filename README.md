# useful_widgets

This package makes it easy to build apps by providing a list of simple and useful widgets.

```dart
import 'package:useful_widgets/useful_widgets.dart';
```

List of Widgets available in this package

- FutureWidget
- RefreshWidget
- SearchWidget

Below I will explain how each widget is used

## FutureWidget

Simple widget to load `Future` requests, showing a loading screen and, if accour error, show error screen.

```dart
FutureWidget<String>(
    future: (context) => myFutureRequest,
    retry: (context) => retryMyFutureRequest(),
    builder: (context, result) => Text(result),
);
```
| Sucess   |     Error     |
|----------|:-------------:|
| <img src="https://raw.githubusercontent.com/ricardocrescenti/flutter-useful-widgets/master/example/images/future_widget_sucess.gif"  height = "400" alt="PieChart"> |  <img src="https://raw.githubusercontent.com/ricardocrescenti/flutter-useful-widgets/master/example/images/future_widget_error.gif"  height = "400" alt="PieChart"> |

The 'Retry' button only is showed if `retry` parameter is informed.

Example: [Weather Forecast](https://github.com/ricardocrescenti/flutter-weather-forecast)

## RefreshWidget

Simple widget to implement pull refresh in yours `ListView`.

```dart
RefreshWidget<List<String>>(
    future: (context) => myFutureItems,
    builder: (context, result) => ListView.separated(
      itemCount: result.length,
      itemBuilder: (context, index) => Text(result[index]),
      separatorBuilder: (context, index) => Divider(),
    ),
);
```

| Refresh   |
|----------|
| <img src="https://raw.githubusercontent.com/ricardocrescenti/flutter-useful-widgets/master/example/images/refresh_widget.gif"  height = "400" alt="PieChart"> |

Example: [Weather Forecast](https://github.com/ricardocrescenti/flutter-weather-forecast)

## SearchWidget

This widget help you to create a simple Search page, you need create a class and extend `SearchWidget`.

```dart
class CitySearchWidget extends SearchWidget<List<CityModel>> {
    CitySearchWidget();

    @override
    Widget buildResult(BuildContext context, List<CityModel> result) {
        return ListView.separated(
            itemCount: result.length,
            itemBuilder: (context, index) => buildItemView(context, result[index]),
            separatorBuilder: (context, index) => Divider(),
        );
    }

    @override
    bool canSearch(BuildContext context, String query) {
        return query.length > 3;
    }

    @override
    Future<List<CityModel>> search(String query) {
        return Module.of<AppModule>().service<OpenWeatherApi>().searchCities(query);
    }

    buildItem(BuildContext context, CityModel city) {
        return ListTile(
            leading: Image.network('http://openweathermap.org/img/wn/${city.weather[0].icon}@2x.png'),
            title: buildItemTitle(city),
            onTap: () {
                Module.of<AppModule>().service<AppService>().updateCurrentCity(context, city.id);
                close(context);
            },
        );
    }

    buildItemTitle(CityModel city) {
        return Row(
            children: <Widget>[
            Image.network('http://openweathermap.org/images/flags/${city.sys.country.toLowerCase()}.png'),
            Padding(padding: EdgeInsets.all(2),),
            Text(city.name),
            Padding(padding: EdgeInsets.all(2),),
            ],
        );
    }
}
```

| Search   |
|----------|
| <img src="https://raw.githubusercontent.com/ricardocrescenti/flutter-useful-widgets/master/example/images/search_widget.gif"  height = "400" alt="PieChart"> |

Example: [Weather Forecast](https://github.com/ricardocrescenti/flutter-weather-forecast)

# Customize package locations

First let's create the custom internationalization that will extend the default package location. You should override `customValues` and enter only the messages you want to change.

```dart
import 'package:useful_widgets/useful_widgets.dart';

class CustomLocalization extends UsefulWidgetsLocalizations {
  CustomLocalization(Locale locale) : super(locale);
  
  @override
  Map<dynamic, Map<dynamic, String>> get customValues => {
    'en': {
      WidgetMessages.message1: 'Custom first message',
      WidgetMessages.message2: 'Custom second message',
    },
    'es': {
      WidgetMessages.message1: 'Primer mensaje personalizado',
      WidgetMessages.message2: 'Segundo mensaje personalizado',
    },
    'pt': {
      WidgetMessages.message1: 'Primeira mensagem personalizada',
      WidgetMessages.message2: 'Segunda mensagem personalizada',
    }
  };
}
```

And finally, inform the delegate in `localizationsDelegates` of your apps `MaterialApp`.

```dart
MaterialApp(
  localizationsDelegates: [
    UsefulWidgetsLocalizationsDelegate((locale) => CustomLocalization(locale)),
  ],
)
```