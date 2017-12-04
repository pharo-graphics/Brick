example
uiModel
	"Interaction between model and UI of the editor"

	^ self stepping: {
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

	}