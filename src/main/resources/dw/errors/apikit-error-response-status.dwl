%dw 2.0
output application/java

var errorType = vars.error.errorType.identifier

---	
errorType match {
	case "BAD_REQUEST" -> 400
	case "NOT_FOUND" -> 404
	case "METHOD_NOT_ALLOWED" -> 405
    case "NOT_ACCEPTABLE" -> 406
    case "UNSUPPORTED_MEDIA_TYPE" -> 415
	else -> 500
}