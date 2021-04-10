# Brick

Brick is a widget library on top of [Bloc](https://github.com/pharo-graphics/Bloc).

:warning:
This repository contains the code for Brick that may be included in the future in Pharo.
It retrofits a part of the development made at https://github.com/feenkcom/Brick. This version will focus on core features and stability. We are currently identifying the core we want for Pharo.


## Installation

The following script installs Brick (including Bloc and BlocPac) in [Pharo 9](https://pharo.org/download):

```smalltalk
Metacello new
        baseline: 'NewBrick';
        repository: 'github://pharo-graphics/Brick/src';
        load.
```

Alternatively, you can do it by terminal (MacOS, linux... and should work as well in Windows with MINGW64). 
Create a directory and execute `<this_repo>/scripts/build.sh`, which first downloads the Pharo image and VM and then loads the project.


## License and Contributing

This code is licensed under the [MIT license](./LICENSE.md).
