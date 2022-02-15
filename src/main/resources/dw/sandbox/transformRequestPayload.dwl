%dw 2.0
output application/json

var request = if(sizeOf(attributes.uriParams)==0)
({'key':  attributes.relativePath replace "/" with "-" ++ vars.key ,
	'value': payload ++ {"id": vars.key}}) else ({'key': attributes.relativePath replace "/" with "-",
	'value': payload ++ {"id": vars.key}})
---
request
