*** Settings ***
Resource    ../../resources/pages/account_create.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-04 Create Checking Account Successfully
    [Documentation]    Test the checking account creation process on the banking application
    [Tags]    UI

    Ensure User Is Logged In
    Create Checking Account
