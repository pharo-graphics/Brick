example
uiModel
	"Rope tree demo"

	^ self of: ({
		'container := BrTextEditorScgDemo cointainer.
view := BrTextEditorScgDemo view.
view contentElement: container.

model := BrTextEditorScgDemo model.
ui := BrTextEditorScgDemo ui.
container addChildren: { model . ui }.
view.'.
	'
BrTextEditorScgDemo link: ui to: model.
view.'.

	'
BrTextEditorScgDemo requestFrom: ui to: model in: container.
view.'.
	'
BrTextEditorScgDemo announceFrom: model to: ui in: container.
view'

	} inject: OrderedCollection new into: [ :aCollection :anAddition |
		aCollection
			ifEmpty: [ aCollection add: anAddition ]
			ifNotEmpty: [ aCollection add: (aCollection last, String cr, anAddition) ].
		aCollection
	])