# The emoji slider

The aim of this build is to have a fun way to give a rating in a User Experience Score flow.

This was copied from Monzo's User Experience Score that was designed this way

## Implementation

The standard `Material` slider is used. As the state is update on `onChanged`, the Text widget has a value from the `emojiScores` map.