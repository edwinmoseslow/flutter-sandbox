# flutter-sandbox

## Basic
`_` - underscore before a keyword represent that it is private as flutter does not have keywords such as public/private/protected.

### Asynchronous Programming in Dart
`Async` - means that this function is asynchronous and you might need to wait a bit to get its result. <br>
`Await` - literally means - wait here until this function is finished and you will get its return value. <br>
`Future` -  is a type that ‘comes from the future’ and returns value from your asynchronous function. It can complete with success(.then) or with an error(.catchError). <br>
`.Then((value){…})` - is a callback that’s called when future completes successfully(with a value). <br>

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

### Navigator 2.0
Page - an immutable object, used to set navigator's history stack<br>
Router - configures the list of pages to be displayed by the Navigator, changes based of underlying platform or state of app.<br>
RouteInformationParser - gets `RouteInformation` from `RouteInformationProvider` and Parses it into user-defined data type.<br>
RouterDelegate - define `Router` behavior of how it learns about change via app state and how to respond to them. Bascailly to listen to `RouteInfromationParser` and app state while building the `Navigator` with the current list of `Pages`.<br>
BackButtonDispatcher - reports back button presses to the `Router`.

## HTTP Call(GET/POST/PUT/DELETE) - REST API
View -> BloC -> Repository -> Data <br>
`NEVER TO PUSH YOUR API KEY - save it using secrets` 

### Handling API Response & Exceptions
```
class ApiResponse<T> {
  Status status;
  T data;
  String message;
  
  ApiReponse.loading(this.message) :status = Status.LOADING;
  ApiReponse.completed(this.data) :status = Status.COMPLETED;
  ApiReponse.error(this.message) :status = Status.ERROR;
  
  @override
  String toString() {
    return "Status : $status \n Message: $message \n Data : $data";
  }
  
  enum Status { LOADING, COMPLETE, ERROR }
}
```

### BloC - Busincess Logic Compnents
fetching data :
```
getData() async {
  dataList.add(ApiResponse.loading('Fetching Data'));
  try {
    List<Data> data = await _dataRepository.getData();
    dataList.add(ApiResponse.completed(data));
  } catch (e) {
    dataList.add(ApiResponse.error(e.toString()));
    print(e);
  }
}
```

### API Base Helper Class
```
Handle get response
Handle return response
```

