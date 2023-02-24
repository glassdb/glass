*ob-tools
derivedInspectorNodes
  ^ super derivedInspectorNodes
    add:
        (OTDerivedInspectorNode on: self label: 'int' block: [ :obj | obj asInteger ]);
    yourself