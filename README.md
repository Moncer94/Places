
Places Test App 

The purpose of the app is to display a list of cities.
The main functionality is to navigate to the Wikipedia app from the places app and show a specific city using the deeplink that handles the redirection the Wikipedia app.

1- Requirements

iOS 16.0+ 
Xcode 15.0+
Swift 5.0+

2- Approach

The architecture being used is MVVM as it goes perfectly with the SwiftUI framework.
Swift concurrency is used for the Network layer implementation with URLSession for running the request to retrieve Data and JSONDecoder for the URLResponse decoding.

No third-party libraries were used in this app.

3- Features Implemented

-A screen that shows a list of cities retrieved from the endpoint provided in the assignment "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
-When the user taps on a specific cell for a city, the Wikipedia app is opened in the Places tab and displays the location of that specific city.
-When the user wants to Go to another location, he can tap the "Go to your location" button, a bottom-sheet will be presented, where the user have to fill latitude and longitude and the taps on the "Go!" button, he will then be redirected to the Wikipedia app.

4- Challenges Faced

Debugging the Wikipedia app was quite challenging especially that it was written with Objective-c and swift.
Adding Objective-c code was the most challenging part, the code was added so that the deep-link can include parameters called lat and long in its URL.


￼

5- Testing

Unit tests and mocks were added to the most important screens and functionalities using the XCTest framework.

6- Conclusion

Overall the test was good, the swiftUI app to show the places was the easiest part as the it was straightforward, though the Wikipedia app was challenging as it was a huge app, so debugging and understanding  Objective-c code was time consuming. I tried to write the code in a clean and organised way so I hope you guys like it. I appreciate any kind of feedback as it makes me better, so for the reviewers, please feel free to contact me any time, my email is ahmed.moncer94@gmail.com. 
 
