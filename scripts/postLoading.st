| ispellPath |
FileStream stdout nextPutAll: 'FileDirectory default: ' , FileDirectory default asString; cr; flag: #debug.
FileStream stdout nextPutAll: 'FileDirectory default entries: ' , FileDirectory default entries asString; cr; flag: #debug.
ispellPath := [FileDirectory default
    readOnlyFileNamed: 'where-is-ispell.txt'
    do: [:file | file contents]]
        on: FileDoesNotExistException
        do: [].
FileStream stdout nextPutAll: 'ispellPath: ' , ispellPath asString; cr; flag: #debug.
ispellPath isEmptyOrNil ifTrue: [^ self].

FileStream stdout nextPutAll: ('Setting ispell binary path to "{1}".' format: {ispellPath}); cr.
IspellSpellingInterface binaryPath: ispellPath.
