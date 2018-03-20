res=$1
length=${#1}
RED='\033[0;31m'
GREEN='\033[0;32m'
function all_good {
	printf "\n${GREEN}Program compiled correctly.\n"
}
function compiled_wrong
{
	printf "\n${RED}Program compiled unsuccessfull. Check out above errors.\n"

}
if [ $length -gt 4 ];then
	property=${res::-4}
	good_result=$property".out"
	g++ -std=c++11 $1 -o $good_result
	./$good_result
	if [ $? = 0 ];then
	{
		all_good

	}
	else
	{
		compiled_wrong
	}
	fi
else
	echo -e "\n${RED}Chain's length is too small. Try another one\n"
	exit 1
fi
