# Things to know
In this documentation, what will be covered are only the basic knowledge of `Flutter`. This is to help any developer who are assisting the development team to build/maintain this project.

`F.A.Q`<br>
Why do you need to know the basic?<br>
This is help you better understand the different components that this project is utilizing.

## Widget
All you need to know about widget in Flutter.

### Stateful and Stateless Widget
`Stateful Widget`<br>
is mutable hence it is able to redraw itself within its lifetime and its state can be change while the application is running.

`Stateless Widget`<br>
isn't able to change its state on runtime hence it can't redraw itself on while the application is running.

### Kinds of Widget
Standard widgets<br>
- Container
- GridView
- ListView
- Stack(Overlaying)
- Column(Top -> Bottom)
- Row(Left -> Right)

Material widgets<br>
- Card
- ListTile

Referene: https://flutter.dev/docs/development/ui/layout#common-layout-widgets

### Constraints
Reference: https://flutter.dev/docs/development/ui/layout/constraints


## Navigation
---
`Page`
<br>
an immutable object used to set the navigator’s history stack.

`Router` 
<br>
configures the list of pages to be displayed by the Navigator. Usually this list of pages changes based on the underlying platform, or on the state of the app changing.

`RouteInformationParser`
<br>
takes the RouteInformation from RouteInformationProvider and parses it into a user-defined data type.
   
`RouterDelegate`
<br>
defines app-specific behavior of how the Router learns about changes in app state and how it responds to them. Its job is to listen to the `RouteInformationParser` and the app state and build the Navigator with the current list of Pages.


`BackButtonDispatcher`
<br>
reports back button presses to the Router.

### Routing
`markForPush` — displays the route with an animated transition

`markForAdd` — displays the route without an animated transition

`markForPop` — removes the route with an animated transition and completes it with a result. “Completing" in this context means that the result object is passed to the onPopPage callback on AppRouterDelegate.

`markForComplete` — removes the route without a transition and completes it with a result

`markForRemove` — removes the route with no animated transition and without completing.