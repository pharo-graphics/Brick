Class {
	#name : #BaselineOfBrickWidgets,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickWidgets
}

{ #category : #baseline }
BaselineOfBrickWidgets >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			"baseline: 'PharoBootstrap' with: [
				spec
					repository: '';
					loads: 'KernelGroup' ];"

			baseline: 'BlocCore' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocLayout' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocText' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];

			baseline: 'BlocPacInfinite' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacResizable' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacScrollable' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacScripter' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];

			baseline: 'BrickCore' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickEditor' with: [
				spec repository: 'github://feenkcom/Brick/src' ].
		spec 
			package: #'Brick' with: [
				spec requires: #(
					"#'PharoBootstrap' "
					#'BlocCore'
					#'BlocLayout'
					#'BlocText'
					
					#'BlocPacInfinite'
					#'BlocPacResizable'
					#'BlocPacScrollable'
					
					#'BrickCore'
					#'BrickEditor'). ];
			package: #'Brick-DevTool' with: [
				spec requires: #(#'Brick' #'BlocPacScripter'). ] ].
]
