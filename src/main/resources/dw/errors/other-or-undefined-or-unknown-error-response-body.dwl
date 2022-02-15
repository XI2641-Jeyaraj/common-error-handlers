%dw 2.0
output application/json encoding="UTF-8"

---
{
	errorCode: 500,
  	errorDescription: "Internal Server Error",
  	origErrorCode: 500,
  	origErrorDescription: vars.error.detailedDescription, // vars.error.exception.cause.detailMessage or vars.error.exception.errorMessage.typedValue or vars.error.detailedDescription
  	errorComponent: message.message.exceptionPayload.info.Element,
  	uuid: vars.uuid
}
