%dw 2.0
output application/ld+json with json
---
readUrl("classpath://types/\$root.jsonld", "application/json")
