%dw 2.0
output application/json encoding="UTF-8"

---
{
	errorCode: 500,
	errorDescription: "Expression Error",
  	origErrorCode: 422,
  	origErrorDescription: vars.error.detailedDescription,
  	errorComponent: message.message.exceptionPayload.info.Element, //vars.error.exception.info.Element
  	uuid: vars.uuid
}