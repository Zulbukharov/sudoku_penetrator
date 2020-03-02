#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
COUNTER=1
cat ./ascii/hello
echo
while read p; do
	OUT=$(./main $p | tr  '\n' ' ' | tr '$' ' ' | sed -e "s/ //g")
	if grep -q $OUT "correct_easy_tests.out"; then
		echo -e "[`whoami`]${GREEN}[PASSED]${NC}[${COUNTER}]"
	else
		echo -e "[`whoami`]${RED}[FAILED]${NC}[${COUNTER}][${p}]"
	fi
	COUNTER=$((COUNTER + 1))
done < ./test_cases/easy_tests
cat ./ascii/skeleton
echo
echo "HARD? HAHA :D"
COUNTER=1
while read p; do
	OUT=$(./main $p | tr  '\n' ' ' | tr '$' ' ' | sed -e "s/ //g")
	if grep -q $OUT "correct_hard_tests.out"; then
		echo -e "[`whoami`]${GREEN}[PASSED]${NC}[${COUNTER}]"
	else
		echo -e "[`whoami`]${RED}[FAILED]${NC}[${COUNTER}][${p}]"
	fi
	COUNTER=$((COUNTER + 1))
done < ./test_cases/hard_tests
echo
echo "Multiple or no solution"
COUNTER=1
while read p; do
	OUT=$(./main $p | tr  '\n' ' ' | tr '$' ' ' | sed -e "s/ //g")
	# echo "$OUT"
	if [ "$OUT" = "Error" ]; then
		echo -e "[`whoami`]${GREEN}[PASSED]${NC}[${COUNTER}]"
	else
		echo -e "[`whoami`]${RED}[FAILED]${NC}[${COUNTER}][${p}]"
	fi
	COUNTER=$((COUNTER + 1))
done < ./test_cases/no_solution
