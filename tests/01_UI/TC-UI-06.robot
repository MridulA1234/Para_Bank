*** Settings ***
Resource    ../../resources/pages/account_create.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-06 Verify Account Creation Success Message
    [Documentation]    Verify that the account creation success message is displayed
    [Tags]    UI

    Ensure User Is Logged In
    Create Checking Account
    Verify Account Creation Success Message
