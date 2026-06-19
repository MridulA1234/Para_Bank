*** Settings ***
Resource    ../../resources/pages/transfer_funds.robot
Resource    ../../resources/pages/account_create.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-07 Verify Transfer Success Message
    [Documentation]    Verify that the transfer success message is displayed after transferring funds
    [Tags]    UI

    Ensure User Is Logged In
    Create Checking Account
    Transfer Funds    100.00
    Transfer Success Confirmation
