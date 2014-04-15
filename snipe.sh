# -- Credits --
# This script was created by Vivek Seth (https://github.com/vivekseth) as an 
# easier way to use Course Sniper.
#
# Course Sniper is created by Vaibhav Verma (http://vverma.net/), inspired by 
# Abe Stanway (http://abe.is/), maintained by Aedan Dispenza (http://github.com/adispen), 
#
# Domain (http://sniper.rutgers.io/) provided by Sam Goldfield.
 
# -- Usage --
# takes 3 paramaters
# 1. email
# 2. subject
# 3. course
# 4. section

# -- Examples --
# $ sh ./snipe.sh <email> <subject> <cource> <section>
# $ sh ./snipe.sh vivekseth.m@gmail.com 198 352 01

email="${1/@/%40}"

output="$(curl \
'http://sniper.rutgers.io/' \
	-H 'Cookie: __utma=90326872.287140126.1396998782.1396998782.1396998782.1; __utmb=90326872.1.10.1396998782; __utmc=90326872; __utmz=90326872.1396998782.1.1.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided)' \
	-H 'Origin: http://sniper.rutgers.io' \
	-H 'Accept-Encoding: gzip,deflate,sdch' \
	-H 'Accept-Language: en-US,en;q=0.8' \
	-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36' \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
	-H 'Cache-Control: max-age=0' \
	-H 'Referer: http://sniper.rutgers.io/' \
	-H 'Connection: keep-alive' \
	--data "email=$email&subject=%28$2%29&course_number=$3&section=$4"\
	--compressed)"
success_line=$(echo "$output" | grep 'Got it!')

echo $success_line

if [ -n "$success_line" ] #check if string is null
then
  echo '-- Success!'
else
  echo '-- failure :('
fi