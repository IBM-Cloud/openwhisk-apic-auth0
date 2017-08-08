# Expose Auth0-enabled OpenWhisk actions with API Connect

WORK IN PROGRESS

## Overview

Built using the IBM Bluemix, the project uses:
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

1. Under Drafts, select APIs

1. Select Import API from a file or URL

1. Point to api/petstore-api_1.0.0.yaml

1. Click Import

1. Select Properties

1. Fill in the Auth0 ID and OpenWhisk credentials

1. Save

1. Select "Generate a default product"

1. Click Create product

1. Wait a minute or so

1. Access the GET /pets endpoint

   ```
   curl -v -H "Content-Type: application/json" https://api.us.apiconnect.ibmcloud.com/<org>-<space>/sb/petstore/v1/pets
   ```

1. It fails with `JWT validation failed`

1. Obtain a Auth0 access token from Auth0 UI or using curl

   ```
   curl --request POST   --url https://<your_auth0_id>.auth0.com/oauth/token   --header 'content-type: application/json'   --data '{"client_id":"<your_client_id>","client_secret":"<your_client_secret>","audience":"https://<your_auth0_id>.apiconnect.com","grant_type":"client_credentials"}'
   ```

1. Access the GET /pets endpoint with the token

   ```
   curl -v -H "Authorization: Bearer <access_token>" -H "Content-Type: application/json" https://api.us.apiconnect.ibmcloud.com/<org>-<space>/sb/petstore/v1/pets
   ```

1. It returns pets

   ```
   {"pets":[{"id":90720,"name":"brownie"},{"id":456,"name":"doggie"},{"id":1968,"name":"Brady"},{"id":654646,"name":"doggie"}]}
   ```

1. Access the POST /pets endpoint with the token

   ```
   curl -v -X POST --data '{"name": "titus"}' -H "Authorization: Bearer <access_token>" -H "Content-Type: application/json" https://api.us.apiconnect.ibmcloud.com/<org>-<space>/sb/petstore/v1/pets
   ```

1. It adds a new pet

   ```
   {"id":1502210136538,"name":"titus"}
   ```

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
