as yet unclassified
exampleWinWithInnerSpace
|p space isp|
space := BlSpace new .
isp := BrInnerSpace new.
isp space: space.

p := BrWindow in: isp.
p extent: 200@200; windowPosition:100@100.
space show.
p show