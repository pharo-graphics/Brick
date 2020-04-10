# Brick

Brick is a widget library on top of [Bloc](https://github.com/feenkcom/Bloc) for [Pharo](http://pharo.org/).

# Installation

## All-in-one versions 
[Brick](https://github.com/feenkcom/Bloc) + [Bloc](https://github.com/feenkcom/Bloc)

The following script install the latest version of Brick + Bloc

```smalltalk
[
    EpMonitor current disable.
    Metacello new
        baseline: 'Brick';
        repository: 'github://feenkcom/Brick/src';
        load
] ensure: [ EpMonitor current enable ]
```
