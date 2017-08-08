# Expose Auth0-enabled OpenWhisk actions with API Connect

WORK IN PROGRESS

## Overview

Built using the IBM Bluemix, the application uses:
* IBM Bluemix OpenWhisk to implement the backend API
* API Connect to expose the API
* [Auth0](https://auth0.com/) to secure the API

No runtime to deploy, no server to manage :)

## Application Requirements

* IBM Bluemix account. [Sign up][bluemix_signup_url] for Bluemix, or use an existing account.
* Auth0 account. [Sign up](https://auth0.com/) for a free account.

## Deploying the application to Bluemix

1. Clone or fork the repository https://github.com/IBM-Bluemix/openwhisk-apic-auth0

1. Checkout the code

1. Ensure your [OpenWhisk command line interface](https://console.ng.bluemix.net/openwhisk/cli) is property configured with:

   ```
   wsk list
   ```

   This shows the packages, actions, triggers and rules currently deployed in your OpenWhisk namespace.

1. Deploy the actions to OpenWhisk

   ```
   ./deploy.sh --install
   ```

1. Create an API Connect service in Bluemix

1. Import the API definition

1. Fill in the Auth0 ID and OpenWhisk credentials

1. Publish the API definition into a new product

1. Access the GET /pets endpoint -> it fails

1. Obtain a Auth0 access token

1. Access the GET /pets endpoint with the token -> it works

1. Access the POST /pets endpoint with the token -> it works

## Code Structure

| File | Description |
| ---- | ----------- |
|[**api/petstore-api_1.0.0.yaml**](api/petstore-api_1.0.0.yaml)| API definition for API Connect. |
|[**deploy.sh**](deploy.sh)|Helper script to install, uninstall, update the OpenWhisk actions used by the application.|

## License

See [License.txt](License.txt) for license information.

---

This project is a sample application created for the purpose of demonstrating a serverless app with OpenWhisk. The program is provided as-is with no warranties of any kind, express or implied.

[bluemix_signup_url]: https://console.ng.bluemix.net/?cm_mmc=GitHubReadMe
