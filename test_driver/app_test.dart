import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("show meal", () {

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("tabbing tab", () async {
      await driver.waitFor(find.byValueKey("home"));
      await driver.waitFor(find.byValueKey("breakfast"));
      await driver.waitFor(find.byValueKey("dessert"));
      await driver.waitFor(find.byValueKey("favorite"));
    });

    test("show list breakfast grid", () async {
      await driver.waitFor(find.byValueKey("home"));
      await driver.waitFor(find.byValueKey("breakfast"));
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(find.byValueKey("breakfastgrid"));
      await Future.delayed(Duration(seconds: 1));
      await driver.scroll(find.byValueKey("breakfastgrid"), 0, 200, Duration(milliseconds: 500));
      await driver.scroll(find.byValueKey("breakfastgrid"), 0, -600, Duration(milliseconds: 500));
      await driver.scroll(find.byValueKey("breakfastgrid"), 0, 800, Duration(milliseconds: 500));
    });

  });
}