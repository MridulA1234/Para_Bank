*** Settings ***
Resource    ../../resources/pages/account_create.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-03 Create Savings Account Successfully
    [Documentation]    Test the savings account creation process on the banking application
    [Tags]    UI

    Ensure User Is Logged In
    Create Savings Account
