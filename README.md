# Brick

Brick is a widget library on top of [Bloc](https://github.com/pharo-graphics/Bloc) for [Pharo](http://pharo.org/).

Main maintainers : [Glenn Cavarlé](https://github.com/GlennCavarle) & [Aliaksei Syrel](https://github.com/syrel)


# Installation

## All-in-one versions 
[Brick](https://github.com/pharo-graphics/Bloc) + [Bloc](https://github.com/pharo-graphics/Bloc)

The following installs #core version of Brick and Bloc **without** tests, development tools and experimental features

```smalltalk
Metacello new
    baseline: 'Brick';
    repository: 'github://pharo-graphics/Brick/src';
    load: #core
```

The following installs #development version of Brick and Bloc **including** tests, development tools and experimental features

```smalltalk
Metacello new
    baseline: 'Brick';
    repository: 'github://pharo-graphics/Brick/src';
    load: #development
```

