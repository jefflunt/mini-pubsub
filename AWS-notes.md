AWS solution - Sender only
--------------------------
Parts to make this work:
- API gateway + authentication
- IAM role
  - Permissions to invoke elements of the API
- Lambda endpoint
  - Python function
- DynamoDB for document storage
  - Table to store it in
  - Proper message format
  - Storage and retrieval

Process flow:
- API Gateway endpoint, with access controlled via IAM (though it's not totally
  obvious to me how all the details go together - there's a lot of AWS config to
  learn here)
  - Lambda function triggered by endpoint
    - DynamoDB to store JSON originally sent to endpoint

... so while a lot of the complication (authentication / authorization, HTTP
servers, etc. are all taken care of, and that's a huge burden off, I think there
is a place for something like mini-pubsub, which by is very name, is designed to
be very small, simple, and easily deployable just about anywhere. In a lot of
ways mini-pubsub is like an IRC bot or a Slack bot, but without requiring those
integrations (i.e. knowledge of those systems or their protocols). mini-pubsub
also tries to be a very minimalist protocal, using only plaintext, which is easy
to understand and debug. It's a standalone thing. Maybe there's something of
value there, and maybe there isn't, but it's probably worth trying out, and
maybe leaving it as an open relay kind of thing to keep it simple, while letting
the more complicated and full-featured solutions handle the scaling, the
security, and everything else that requires (at least for now) a lot more
infrastructure and/or learning.

