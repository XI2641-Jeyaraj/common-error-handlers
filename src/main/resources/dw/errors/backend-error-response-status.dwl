%dw 2.0
output application/java
---

// if condition is taking the error code from an API within the Platform's infrastructure
// else if condition is taking the error code from a third party API or a custom Arm Mule 3 exception
// else condition is the default case

if (vars.error.exception.errorMessage.typedValue? 
	and vars.error.exception.errorMessage.typedValue is Object
)
	vars.error.exception.errorMessage.typedValue.errorCode
else
	if (vars.error.exception.errorMessage.typedAttributes?)
		vars.error.exception.errorMessage.typedAttributes.statusCode
	else
		500