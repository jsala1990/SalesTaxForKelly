array = ["chocolate","food"]
array2 = ["pills","medical"]
array3 = ["book"]


acceptable = {
  "food" => array,
  "medical" => array2,
  "books" => array3
}

acceptable2 = {
  "food" => array,
  "medical" => array2,
  "books" => array3,
  "que" => array
}

puts acceptable == acceptable2
