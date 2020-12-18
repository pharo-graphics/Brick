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
				self repository: 'github://feenkcom/pharo-beacon/repository' for: spec ];
			
			baseline: 'BlocCore' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocText' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];

			baseline: 'BlocPacAsyncElement' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacFocusFinder' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacInfinite' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacTasker' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];

			baseline: 'BrickCore' with: [
				self thisRepositoryFor: spec ];

			baseline: 'SpartaCore' with: [
				self repository: 'github://feenkcom/Sparta/src' for: spec ];
			baseline: 'SpartaSkia' with: [
				self repository: 'github://feenkcom/Sparta/src' for: spec ].

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
