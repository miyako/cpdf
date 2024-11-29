//%attributes = {}
#DECLARE($params : Object)

If ($params=Null:C1517)
	
/*
async calls must be performed in a worker or form
*/
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $cpdf : cs:C1710.cpdf
	$cpdf:=cs:C1710.cpdf.new(cs:C1710._cpdf_Controller)
	
	$pdf:=File:C1566("/DATA/brochure.pdf")
	$pdf:=OB Class:C1730($pdf).new($pdf.platformPath; fk platform path:K87:2)
	$out:=Folder:C1567(fk desktop folder:K87:19).file("brochure.json")
	$out2:=Folder:C1567(fk desktop folder:K87:19).file("brochure.pdf")
	$cpdf.perform([\
		[$pdf; "-output-json"; "-output-json-parse-content-streams"; "-o"; $out]; \
		["-j"; $out; "-o"; $out2]\
		])
	
End if 