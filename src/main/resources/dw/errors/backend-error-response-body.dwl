%dw 2.0
output application/json encoding="UTF-8"

---

// if condition is taking the error response from an API within the Platform's infrastructure
// else if condition is taking the error response from a third party API or a custom Arm Mule 3 exception
// else condition is the default case

if (vars.error.exception.errorMessage.typedValue? 
	and vars.error.exception.errorMessage.typedValue is Object
){
	errorCode: vars.error.exception.errorMessage.typedValue.errorCode,
  	errorDescription: vars.error.exception.errorMessage.typedValue.errorDescription,
  	origErrorCode: vars.error.exception.errorMessage.typedValue.origErrorCode,
	origErrorDescription: vars.error.exception.errorMessage.typedValue.origErrorDescription,
  	errorComponent: message.message.exceptionPayload.info.Element,
  	uuid: vars.error.exception.errorMessage.typedValue.uuid
}
else
    if (vars.error.exception.errorMessage.typedAttributes?) {
        errorCode: vars.error.exception.errorMessage.typedAttributes.statusCode,
        errorDescription: vars.error.exception.errorMessage.typedAttributes.reasonPhrase,
        origErrorCode: vars.error.exception.errorMessage.typedAttributes.statusCode,
        origErrorDescription: vars.error.detailedDescription,
        errorComponent: message.message.exceptionPayload.info.Element,
        uuid: vars.uuid
    }
    else {
        errorCode: 500,
        errorDescription: "Undefined Backend Error",
        origErrorCode: 500,
        origErrorDescription: vars.error.detailedDescription,
        errorComponent: message.message.exceptionPayload.info.Element, //vars.error.exception.info.Element,
        uuid: vars.uuid
	}