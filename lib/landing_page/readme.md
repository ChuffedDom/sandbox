# Basic Landing Page

Building MVPs, prototypes, and proof of concepts, are all gravy as a tool or single feature app but they need a landing page.

The reason for this is to provide the value proposition, the problem that it solves, and analytics that will inform how engaged users are.

## Overview

For this demo I will have a splash image for the fold, that on top has the value proposition and a call to action of an email sign up.

Below the fold, will be 3 benefits or values that are the foundation to the solution.

## How its built

### Fold cover image

A folder is named `assets` and an image called `foldImage.png` is placed inside. Then added to `pubspec.yaml` (uncomment the lines) is the declaration of the asset directory.

```
  assets:
    - assets/
```

The `landing page` file is setup as normal with a stateful widget, that returns `Scaffold` and to create the fold build a `Container`.

The `Container` has size set to the full height and width of the screen device using `MediaQuery`.

```
height: MediaQuery.of(context).size.height,
width: MediaQuery.of(context).size.width,
```

The image can now be applied through the `decoration` field, and `BoxDecoration`, `DecorationImage`, and `AssetImage` with a fit of `BoxFit.cover`.

```
decoration: BoxDecoration(
    image: DecorationImage(
        image: AssetImage("foldImage.png"),
        fit: BoxFit.cover,
        ),
    ),
```
#### Clarity with a layer and opacity

For text to be legible, a layer will be place on top of the image with opacity so white text can show up. In the `DecorationImage` field `colorFilter` a black layer with opacity is set

```
ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
```

### Fold context

The 