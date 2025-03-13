![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/cpdf)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/cpdf/total)

### Licensing

* the source code of this component is licensed under the [MIT license](https://github.com/miyako/cpdf/blob/master/LICENSE).
* see [coherentpdf.com](https://www.coherentpdf.com/index.html) for the licensing of **Coherent PDF**.

# cpdf

## dependencies.json

 ```json
{
	"dependencies": {
		"cpdf": {
			"github": "miyako/cpdf",
			"version": "latest"
		}
	}
}
```

## Usage

```4d
#DECLARE($params : Object)

If ($params=Null)
	
	/*
		async calls must be performed in a worker or form
	*/
	
	CALL WORKER(1; Current method name; {})
	
Else 
	
	var $cpdf : cs.cpdf.cpdf
	$cpdf:=cs.cpdf.cpdf.new(cs._cpdf_Controller)
	
	$pdf:=File("/DATA/brochure.pdf")
	$pdf:=OB Class($pdf).new($pdf.platformPath; fk platform path)
	$out:=Folder(fk desktop folder).file("brochure.json")
	$out2:=Folder(fk desktop folder).file("brochure.pdf")
	$cpdf.perform([\
	[$pdf; "-output-json"; "-output-json-parse-content-streams"; "-o"; $out]; \
	["-j"; $out; "-o"; $out2]\
	])
	
End if 
```
