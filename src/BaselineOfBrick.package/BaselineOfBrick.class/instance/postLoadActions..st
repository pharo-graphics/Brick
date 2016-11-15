post load
postLoadActions: aSpecLoader
	| group protocol columnIndex |
	group := (aSpecLoader spec required difference: aSpecLoader spec packages keys) asArray first asSymbol.
	columnIndex := group indexOf: $:.

	"default installation without Iceberg"
	columnIndex <= 0 ifTrue: [ ^self ].
	protocol := group first: columnIndex - 1.

	"installation + iceberg"
	protocol = #git
		ifTrue: [ ^ self postLoadGit: aSpecLoader].
		
	Error signal: 'Unknown load protocol ' , group
