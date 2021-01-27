# Things to know
In this documentation, what will be covered are only the basic knowledge of `Flutter`. This is to help any developer who are assisting the development team to build/maintain this project.

`F.A.Q`<br>
Why do you need to know the basic?<br>
This is help you better understand the different components that this project is utilizing.

### Navigation
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
