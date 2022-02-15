%dw 2.0
output application/json encoding="UTF-8"

//	Unable to throw com.arm.open.api.* custom exceptions in Mule 4
//	so instead would need the user to throw custom Arm exceptions via Raise Error component (e.g. type = ARM:CONFLICT)

var customErrorType = vars.error.errorType.identifier
---
{
	errorCode: customErrorType match {
		case "BAD_REQUEST" -> 400
		case "UNAUTHORISED" -> 401
		case "NOT_PERMITTED" -> 403
		case "NOT_FOUND" -> 404
		case "CONFLICT" -> 409
		else -> 500
	},
	errorDescription: customErrorType match {
		case "BAD_REQUEST" -> "Bad Request"
		case "UNAUTHORISED" -> "Unauthorised"
		case "NOT_PERMITTED" -> "Not Permitted"
		case "NOT_FOUND" -> "Not Found"
		case "CONFLICT" -> "Conflict"
		else -> "Undefined ARM Custom Error"
	},
  	origErrorCode: customErrorType match {
		case "BAD_REQUEST" -> 400
		case "UNAUTHORISED" -> 401
		case "NOT_PERMITTED" -> 403
		case "NOT_FOUND" -> 404
		case "CONFLICT" -> 409
		else -> 500
	},
  	origErrorDescription: vars.error.detailedDescription,
  	errorComponent: message.message.exceptionPayload.info.Element, //vars.error.exception.info.Element,
  	uuid: vars.uuid
}