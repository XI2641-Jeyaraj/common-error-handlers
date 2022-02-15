%dw 2.0
output application/java

//	Unable to throw com.arm.open.api.* custom exceptions in Mule 4
//	so instead would need the user to throw custom Arm exceptions via Raise Error component (e.g. type = ARM:CONFLICT)

var customErrorType = vars.error.errorType.identifier
---
customErrorType match {
	case "BAD_REQUEST" -> 400
	case "UNAUTHORISED" -> 401
	case "NOT_PERMITTED" -> 403
	case "NOT_FOUND" -> 404
	case "CONFLICT" -> 409
	else -> 500
}