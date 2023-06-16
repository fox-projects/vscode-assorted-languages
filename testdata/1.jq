# Given an array of values as input, generate a stream of values of the
# maximal elements as determined by f.
# Notes:
# 1. If the input is [] then the output stream is empty.
# 2. If f evaluates to null for all the input elements,
#    then the output stream will be the stream of all the input items.

def maximal_by(f):
  (map(f) | max) as $mx
  | .[] | select(f == $mx);


(.columnHeaders | map(.name)) as $headers
  | .rows
  | map(. as $row
    | $headers
    | with_entries({"key": .value,
                    "value": $row[.key]}) )


# Requires: jq 1.5

# objectify/1 expects an array of atomic values as inputs, and packages
# these into an object with keys specified by the "headers" array and
# values obtained by trimming string values, replacing empty strings
# by null, and converting strings to numbers if possible.
def objectify(headers):
  def tonumberq: tonumber? // .;
  def trimq: if type == "string" then sub("^ +";"") | sub(" +$";"") else . end;
  def tonullq: if . == "" then null else . end;
  . as $in
  | reduce range(0; headers|length) as $i
    ({}; .[headers[$i]] = ($in[$i] | trimq | tonumberq | tonullq) );

def csv2jsonHelper:
  .[0] as $headers
  | reduce (.[1:][] | select(length > 0) ) as $row
    ([]; . + [ $row|objectify($headers) ]);

csv2jsonHelper
