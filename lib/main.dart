import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

//Step 15 - Run the app and see if you can see the screen update with the first story. Delete this.

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}
StoryBrain storyBrain= StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                onPressed: () {
                  //Choice 1 made by user.
                  setState(() {
                    storyBrain.nextStory(1);
                  });
                  //Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                },
                color: Colors.red,
                child: Text(
                  // Step 13 - Use the storyBrain to get the text for choice 1.
                  storyBrain.getChoice1(),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              //Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
              // Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: FlatButton(
                  onPressed: () {
                    //Choice 2 made by user.
                    setState(() {
                      storyBrain.nextStory(2);
                    });

                    // Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                  },
                  color: Colors.blue,
                  child: Text(
                    //Step 14 - Use the storyBrain to get the text for choice 2.
                    storyBrain.getChoice2(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

// Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
