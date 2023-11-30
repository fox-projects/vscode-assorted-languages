#!/usr/bin/env awk

/^ab#$#/gimy {
# <-    punctuation.definition.regex.begin.awk
#      ^ punctuation.definition.regex.end.awk
#       ^^^^ keyword.other.awk
#^^^^^^^^^^^ string.regexp
}

# comment
# comment
# comment
function a_function(a_function_argument, another_argument) { # comment
	a ? asf : asd # comment
	a_variable = 1 + 2 - 3 * 5 ^ 5 / 4
	a_variable = 1 + 2 - 3 * 5 ^ 5
	a_variable = a_variable / 4
	a /= humm
	a_function_call = a_function(a_variable)
	trinary = ( a == b ) ? c : d
	(1,2,3) in arr
	a[2] = a_variable
	a[1]
	sub (/primary=/, "", primary_name, /asd/, 1/2, 3/4);
} # comment


BEGIN {
    var1 = -18-8
    var2 = log(7)
    var2 /= 3
    a_function(/aa/)

	fillrate = 100 * (1 - empty[i] / (NR-1))
}

/abc+\/[123]/ {
	re = /asd+[123]/
	matchExpression = "literal" ~ /regexp+[123]/
	divisionExpression = 2/4
}

$0 ~ /abc[123]/ {
    print "This line is normally highlighted", "asdas", 3*4 18-2, 4 / 2
    print "var1 / var2 =", var1 / var2
    print "This line shouldn't be white"
}

/^#/ { print (n ? "\n" : "")$0 }
MyVar = "The \"quick brown fox\" jumped over the lazy dogs."
gsub(/"/, "", MyVar)

/[-.]/ {

}

/[.-]/ {

}

{ line[NR] = $0 }  # remember each input line

//

END {

}
