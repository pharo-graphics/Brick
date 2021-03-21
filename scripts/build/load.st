"load latest version"
EpMonitor current disable.
Metacello new
  baseline: 'Brick';
  repository: 'github://feenkcom/Brick/src';
  load.
EpMonitor current enable.
Smalltalk snapshot: true andQuit: false.
