#!/bin/bash

find . -type d \( -path ./dependencies/ \) -prune \
	-iname *.h -o -iname *.c -o -iname *.cpp -o -iname *.hpp \
	| xargs clang-format -style=file -i -fallback-style=none

git diff > clang_format.patch

# Delete if 0 size
if [ ! -s clang_format.patch ]
then
	rm clang_format.patch
fi

exit 0
