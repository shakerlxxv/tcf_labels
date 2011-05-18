Feature: File Upload

  So that I can work with my list of customers
  As a small business owner
  I want to load my Excel file to the server

  @wip
  Scenario: File upload successfully
    Given an Excel File "Test1"
    When I go to the home page
    Then I should see "Upload Data File"
