converter
byteStringToUTF16: bytes

	^bytes asString convertFromWithConverter: (TextConverter newForEncoding: 'utf-16').
