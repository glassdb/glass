*change-notification
_defineClassNamed: aClassName with: aBlock
  | originalClass classOrganizer cls failedMethodCompilations |
  originalClass := System myUserProfile symbolList
    objectNamed: aClassName asSymbol.
  originalClass ~~ nil
    ifTrue: [ 
      "pre-create the classOrganizer, so that original subclasses are preserved."
      classOrganizer := ClassOrganizer cachedOrganizer ].
  cls := aBlock value.
  cls == nil
    ifTrue: [ ^ nil ].
  failedMethodCompilations := {}.
  originalClass ~~ nil
    ifTrue: [ 
      SystemChangeNotifier uniqueInstance
        doSilently: [ 
          failedMethodCompilations
            addAll:
              (cls
                copyMCMethodsFrom: originalClass
                dictionaries: GsSession currentSession symbolList).
          [ 
          "force redefinition of existing subclasses"
          MCPlatformSupport
            redefineSubclassesOf: originalClass
            using: classOrganizer ]
            on: GsFailedMethodCompilationDuringCopyMethodToNewClass
            do: [ :ex | 
              failedMethodCompilations addAll: ex failedMethodCompilations.
              ex resume: false ].
          MCPlatformSupport migrateInstancesWithSubclassesOf: cls ].
      cls category = originalClass category
        ifTrue: [ 
          SystemChangeNotifier uniqueInstance
            announce:
              (ClassModifiedAnnouncement itemClass: cls oldCategory: originalClass category) ]
        ifFalse: [ 
          SystemChangeNotifier uniqueInstance
            announce:
              (ClassMovedAnnouncement itemClass: cls oldCategory: originalClass category) ] ]
    ifFalse: [ 
      SystemChangeNotifier uniqueInstance
        announce: (ClassAddedAnnouncement itemClass: cls) ].
  SystemChangeNotifier uniqueInstance
    doSilently: [ Class _resolveUndeclaredSymbolsForClass: cls ].
  failedMethodCompilations notEmpty
    ifTrue: [ 
      (GsFailedMethodCompilationDuringCopyMethodToNewClass
        signal: 'failed compilations'
        with: failedMethodCompilations)
        ifTrue: [ 
          | errorStream |
          errorStream := WriteStream on: String new.
          errorStream
            nextPutAll:
                'Not all methods for the class: ' , cls name printString
                    , ' were successfully recompled.';
            cr.
          failedMethodCompilations
            do: [ :ar | 
              | details def |
              details := ar at: 1.
              def := ar at: 2.
              errorStream
                tab;
                nextPutAll: def summary , ': ';
                cr;
                nextPutAll: details;
                cr ].
          self error: errorStream contents ] ].
  ^ cls
