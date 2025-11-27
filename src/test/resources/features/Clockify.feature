Feature: clockify

  @GetAllWorkspaces
  Scenario: Get all my workspaces
    Given base url https://api.clockify.me/api
    And endpoint /v1/workspaces
    And header X-api-key = ODhiYWFiMzItNWNkZC00NWYzLWIxMmItZDcyNTQzYWU4N2Mw
    When execute method GET
    Then the status code should be 200
    * print response
    * define idWorkspace = $[0].id

  @GetWorkspaceInfo @testGabo
  Scenario: Get workspace info
    Given call Clockify.feature@GetAllWorkspaces
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{idWorkspace}}
    And header X-api-key = ODhiYWFiMzItNWNkZC00NWYzLWIxMmItZDcyNTQzYWU4N2Mw
    When execute method GET
    Then the status code should be 200
    And response should be $.name = CrowCurso
    * print response