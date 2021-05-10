# Security 

Anchore Enterprise supports user login to the User Interface through identities from external identity providers that support Security Assertion Markup Language (SAML). Anchore
does not store any user credentials. However, usernames and anchore permissions are stored. The identity provider validates the user's access while an external provider validates the username and all first time user login information.

The Anchore Enterprise deployment must be configured to utilize the SAML SSO.


- It is required to Enable Oauth to ensure that Anchore can issue bearer tokens for subsequent API usage by the UI to the system APIs.

- Hashed passwords are recommended. 

- From the user's browser, reach the Identity Provider's login URL.

- Access the metadata XML endpoint in the Identity Provider. 

Configuration of SAML SSO is done using API/UI operations but requires configuration both in the user's Identity Provider and within Anchore.

The Identity Provider must:

- Support HTTP Redirect binding
- Support signed assertions and signed documents
- Allow unsigned client requests from Anchore
- Allow unencrypted requests and responses 

Click the [link](https://docs.anchore.com/current/docs/overview/sso/) for more Anchore security information.