%dw 2.0
output application/json encoding="UTF-8"

---
{
	errorCode: 500,
  	errorDescription: "Validation Error",
  	origErrorCode: 400,
  	origErrorDescription: vars.error.detailedDescription,
  	errorComponent: message.message.exceptionPayload.info.Element, //vars.error.exception.info.Element or vars.error.failingComponent
  	uuid: vars.uuid
}