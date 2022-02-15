%dw 2.0
output application/json encoding="UTF-8"

var errorType = vars.error.errorType.identifier

---
{
	errorCode: errorType match {
		case "BAD_REQUEST" -> 400
		case "NOT_FOUND" -> 404
		case "METHOD_NOT_ALLOWED" -> 405
		case "NOT_ACCEPTABLE" -> 406
		case "UNSUPPORTED_MEDIA_TYPE" -> 415
		else -> 500
	},
  	errorDescription: errorType match {
		case "BAD_REQUEST" -> "Bad Request"
		case "NOT_FOUND" -> "Not Found"
		case "METHOD_NOT_ALLOWED" -> "Method Not Allowed"
		case "NOT_ACCEPTABLE" -> "Not Acceptable"
		case "UNSUPPORTED_MEDIA_TYPE" -> "Unsupported Media Type"
		else -> "Undefined APIKit Error"
	},
  	origErrorCode: errorType match {
		case "BAD_REQUEST" -> 400
		case "NOT_FOUND" -> 404
		case "METHOD_NOT_ALLOWED" -> 405
		case "NOT_ACCEPTABLE" -> 406
		case "UNSUPPORTED_MEDIA_TYPE" -> 415
		else -> 500
	},
	origErrorDescription: vars.error.detailedDescription,
  	errorComponent: vars.error.exception.info.Element,
  	uuid: vars.uuid
}