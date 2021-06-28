| directory ispellPath fullIspellPath |
directory := FileDirectory on: (SmalltalkCI getEnv: 'GITHUB_WORKSPACE').
ispellPath := [directory
    readOnlyFileNamed: 'where-is-ispell.txt'
    do: [:file | file contents withoutTrailingBlanks]]
        on: FileDoesNotExistException
        do: [].
ispellPath isEmptyOrNil ifTrue: [^ self].

self flag: #note. "ispellPath is relative unix path but we need an absolute Windows path, thus no simple FileDirectory >> #/ here."
fullIspellPath := ((ispellPath findTokens: UnixFileDirectory pathNameDelimiter) inject: directory into: #/) fullName.
FileStream stdout nextPutAll: ('Setting ispell binary path to "{1}".' format: {fullIspellPath}); cr.
IspellSpellingInterface binaryPath: fullIspellPath.
