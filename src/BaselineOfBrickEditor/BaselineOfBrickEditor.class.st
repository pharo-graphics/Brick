Class {
	#name : #BaselineOfBrickEditor,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickEditor
}

{ #category : #baseline }
BaselineOfBrickEditor >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			"baseline: 'PharoBootstrap' with: [ spec loads: #('KernelGroup' 'CompilerGroup' 'MultilingualGroup') ];
			baseline: 'Morphic' with: [ spec loads: 'System-Clipboard' ];
			baseline: 'MorphicCore' with: [ spec loads: 'Text-Core' ];
			baseline: 'Traits' with: [ spec loads: 'AST-Core-Traits' ];"

			baseline: 'Beacon' with: [
				spec repository: 'github://feenkcom/pharo-beacon/repository' ];
			
			baseline: 'BlocCore' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocText' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];

			baseline: 'BlocPacAsyncElement' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacFocusFinder' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacInfinite' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacTasker' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];

			baseline: 'BrickCore' with: [
				spec repository: 'github://feenkcom/Brick/src' ];

			baseline: 'SpartaCore' with: [
				spec repository: 'github://feenkcom/Sparta/src' ];
			baseline: 'SpartaSkia' with: [
				spec repository: 'github://feenkcom/Sparta/src' ].

		spec 
			package: #'Brick-Editor' with: [
				spec requires: #(
					"#'PharoBootstrap'
					#'Morphic'"
					
					#'BlocCore'
					#'BlocText'
					
					#'BlocPacAsyncElement'
					#'BlocPacFocusFinder'
					#'BlocPacInfinite'
					#'BlocPacTasker'
					
					#'BrickCore'
					
					#'SpartaCore'
					#'SpartaSkia') ];
			package: #'Brick-Editor-Extensions' with: [
				spec requires: #(#'BlocCore' #'Brick-Editor') ]. ].
]
