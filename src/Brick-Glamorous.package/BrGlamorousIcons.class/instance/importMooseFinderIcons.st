as yet unclassified
importMooseFinderIcons
	"self importMooseFinderIcons"
	| wantedIcons |
	MooseIcons resetIcons.
	wantedIcons := #().
	self importIcons: wantedIcons fromFolder: 'icons' inClass: self class category: '*moose-finder'