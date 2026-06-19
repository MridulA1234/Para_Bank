*** Settings ***
Resource    ../../resources/pages/transfer_funds.robot
Resource    ../../resources/pages/account_create.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-05 Transfer Funds Between Accounts
    [Documentation]    Test the fund transfer process between accounts on the banking application
    [Tags]    UI

    Ensure User Is Logged In
    Create Savings Account
    Transfer Funds    100.00
    Wait Until Page Contains    Transfer Complete!    10s
