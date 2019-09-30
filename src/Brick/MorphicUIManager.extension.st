Extension { #name : #MorphicUIManager }

{ #category : #'*Brick' }
MorphicUIManager >> gtDebugProcess: process context: context label: title fullView: bool notification: notificationString [
	"Open a notifier in response to an error, halt, or notify. A notifier view
	just shows a short view of the sender stack and provides a menu that
	lets the user open a full debugger."

	| debugSession |

	debugSession := process newDebugSessionNamed: title startedAt: context.
	
	debugSession logStackToFileIfNeeded.
	debugSession isAboutUIProcess ifTrue: [ 
		DefaultExecutionEnvironment beActiveDuring: [self spawnNewProcess]].
		
	self defer:	[ 
			"schedule debugger in deferred UI message to address
			redraw problems after opening a debugger e.g. from
			the testrunner."
		[ GtMoldableDebuggerElement openInspectorOn: debugSession.
		] on: Error do: [ :ex | 	debugSession signalDebuggerError: ex] 
	].

	process suspend.

]

{ #category : #'*Brick' }
MorphicUIManager >> spawnNewProcess [
	| activeProcess |
	
	"In case the current process is attached to a Bloc universe, stop pulsation to allow the new UI process to step.
	This assumes that the current process is the UI process and will be interrupted. "
	activeProcess := Processor activeProcess.
	BlParallelUniverse all
		detect: [ :eachUniverse |
			| isUIProcess |
			isUIProcess := false.
			eachUniverse hostClass
				uiProcessDo: [ :eachUIProcess | isUIProcess := eachUIProcess == activeProcess ].
			isUIProcess ]
		ifFound: [ :aUniverse | 
			aUniverse requestStopPulsation ]
		ifNone: [  ].
	
	UIProcess := [
		[WorldMorph doOneCycle.  Processor yield.  false] whileFalse: [].
	] newProcess priority: Processor userSchedulingPriority.
	UIProcess name: 'Morphic UI Process'.
	UIProcess resume

]
