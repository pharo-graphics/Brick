event firing
notifyItemsChanged: anInterval
	"Ensure that items changed notifications always happen in the UI thread"
	BlUniverse default animationManager
		addAnimation: (BrTextEditorPostAction new action: [ super notifyItemsChanged: anInterval ])