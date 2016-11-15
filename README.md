# Brick

Brick is a widget library on top of [Bloc](https://github.com/pharo-graphics/Bloc) for [Pharo](http://pharo.org/).

Main maintainers : [Glenn Cavarlé](https://github.com/GlennCavarle) & [Aliaksei Syrel](https://github.com/syrel)


# Installation


## All-in-one "developer" versions 
[Brick](https://github.com/pharo-graphics/Bloc) + [Bloc](https://github.com/pharo-graphics/Bloc) + [Iceberg](https://github.com/npasserini/iceberg)

```smalltalk
Metacello new
    baseline: 'Brick';
    repository: 'github://pharo-graphics/Brick/src';
    load:#git:core
```

```smalltalk
Metacello new
    baseline: 'Brick';
    repository: 'github://pharo-graphics/Brick/src';
    load:#git:development
```
## All-in-one "user" versions 
[Brick](https://github.com/pharo-graphics/Bloc) + [Bloc](https://github.com/pharo-graphics/Bloc)

```smalltalk
Metacello new
    baseline: 'Brick';
    repository: 'github://pharo-graphics/Brick/src';
    load:#core
```

```smalltalk
Metacello new
    baseline: 'Brick';
    repository: 'github://pharo-graphics/Brick/src';
    load:#development
```

