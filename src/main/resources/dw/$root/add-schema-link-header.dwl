%dw 2.0
import resolveUri from java!com::arm::openapi::common::CommonFunctions
output application/java
var outboundHeaders = vars[Mule::p("common-components.flows.main.flow-variable.outbound-headers")]
var baseUri = vars[Mule::p("common-components.flows.main.flow-variable.base-uri")]
---
outboundHeaders
++
{
    Link: "<" ++ resolveUri(baseUri, "/\$schema/\$root") ++ ">; rel=describedBy; type=application/schema+json"
}
