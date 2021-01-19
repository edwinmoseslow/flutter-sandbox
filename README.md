# flutter-sandbox

## Navigation 
Types of navigation:<br>
- Direct Navigation with `MaterialPageRoute`
- Static Navigation with `Route Map`
- Dynamic Navigation with `Generated Routes`

### Direct Navigation with MaterialPageRoute
How to Navigate :
```
Navigator.push(
  context, 
  MaterialPageRoute(
  builder: (BuildContext context) => Page()
  )
);
```
How to remove Page/View/Screen from Navigation stack :
```
Navigator.pop();
```

### Static Navigation with Route Map
How a route map will look like :
```
return MaterialApp(
  title: 'Demo',
  theme: ThemeData.dark(),
  initialRoute: Page.route,
  ////////////////////////////////////////////////////////
  // Route Map                                          //
  ////////////////////////////////////////////////////////
  routes: {
    LoginPage.route: (context) => LoginPage(),
    DashboardPage.route: (context) => DashboardPage(),
    AddPage.route: (context) => AddPage(),
    UpdatePage.route: (context) => UpdatePage()
  }
  ////////////////////////////////////////////////////////
  // Route Map                                          //
  ////////////////////////////////////////////////////////
); 
```
How Navigation works :
```
Navigator.pushNamed(context, LoginPage.route);
```
Disadvantage :
```
Unable to pass a value inside of a route.
```
### Dynamic Navigation with onGeneratedRoute
```
onGenerateRoute: (settings) {
  switch (settings.name) {
    case LoginPage.route:
      return MaterialPageRoute(builder: (_) => LoginPage());
      break;
    case DashboardPage.route:
      return MaterialPageRoute(builder: (_) => DashboardPage());
      break;
    case AddPage.route:
      return MaterialPageRoute(builder: (_) => AddPage());
      break;
    case UpdatePage.route:
      return MaterialPageRoute(builder: (_) => UpdatePage());
      break;
    default:
      return MaterialPageRoute(builder: (_) => LoginPage());
  }
}
```
How to Navigate to another Page and pass a parameter/value :
```
onPressed: () {
  Navigator.pushNamed(
    context,
    LoginPage.route,
    arguments: {
      "message": "Hello World!"
    }
  )
}
```
Changes required if an argument is added to route :
```
case LoginPage.route:
  return MaterialPageRoute(builder: (_) => LoginPage(
    settings.arguments
  ));
  break;
```
Login Page should capture the argument :
```
class LoginPage extends StatelessWidget {
  static const String route = "login-page";
  final Map<String, String> arguments;

  LobbyScreen(this.arguments);

  @override
  Widget build(BuildContext context) {
    ...
    Text(
      arguments["message"],
      style: GoogleFonts.sawarabiGothic(fontSize: 34.0),
      textAlign: TextAlign.center,
    )
    ...
  }
}
```
Advantage :
```
Able to pass a value inside a route.
```
Disadvantage :
```
Losing all types hence there is a need to type check against the type later on.
```
