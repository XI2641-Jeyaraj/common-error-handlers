%dw 2.0
output application/json
var response= if(payload.items != null)
 ({'items': payload.items.*value, 'total': payload.numberOfItems}) else (payload)
---
response
	
