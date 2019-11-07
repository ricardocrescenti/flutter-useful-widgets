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