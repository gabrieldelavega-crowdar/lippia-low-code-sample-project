Feature: client

  Background:
    And base url https://api.clockify.me/api
    And header X-api-key = ODhiYWFiMzItNWNkZC00NWYzLWIxMmItZDcyNTQzYWU4N2Mw


 @AddClient
  Scenario: Add new Client
    Given call Workspace.feature@GetAllWorkspaces
    And endpoint /v1/workspaces/{{idWorkspace}}/clients
    And header Content-Type = application/json
    And body jsons/bodies/addNewClient.json
    And set value "clienteAutomation2" of key name in body jsons/bodies/addNewClient.json
    When execute method POST
    Then the status code should be 201
    * define idClient = $.id

   @DeleteClient @testGabo
   Scenario: delete client
     Given call Client.feature@AddClient
     And endpoint /v1/workspaces/{{idWorkspace}}/clients/{{idClient}}
     And execute method DELETE
     Then the status code should be 200
     * print response

