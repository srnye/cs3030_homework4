#!/bin/awk -f
BEGIN{
	FS=","
}
{
	if($5 == "Female" && $6 == "Canada"){
		if($4 == "" ){
			$4 = "waldo@weber.edu"
			}
		print $2", "$3", "$4;
}
}

END{
}
