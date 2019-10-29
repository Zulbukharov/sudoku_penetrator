#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
COUNTER=1
cat hello
echo
while read p; do
	OUT=$(./main $p | tr  '\n' ' ' | tr '$' ' ' | sed -e "s/ //g")
	if grep -q $OUT "correct.out"; then
		echo -e "[`whoami`]${GREEN}[PASSED]${NC}[${COUNTER}]"
	else
		echo -e "[`whoami`]${RED}[FAILED]${NC}[${COUNTER}][${OUT}]"
	fi
	COUNTER=$((COUNTER + 1))
done < ./test_cases/easy_tests
echo
echo 