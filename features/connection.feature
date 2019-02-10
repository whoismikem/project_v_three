Feature: Setup web-service client to be used as a testing harness

  Scenario: It can make a HTTP connection and return a response
    Given I have a new instance of client
    When I execute the connection
    Then I get a response back

  @connection_session
  Scenario: Connection has a configurable pseudo session where basic connection related settings can be maintained
    Given I have a new instance of client
    When I configure the connection session
    Then the session is configured

  @session_default_config
  Scenario: Connection session can set default session configuration which can be applied at any time
    Given I have a new instance of client
    When I set default session configuration of my choosing
    Then the configuration is stored
    And I am able to apply it at any time
