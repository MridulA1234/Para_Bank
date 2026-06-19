*** Settings ***
Resource    ../../resources/pages/negative.robot
Resource    ../../resources/pages/login.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-NEG-02 Blank Transfer Amount
    [Documentation]    Submit the transfer form without entering an amount and check for validation
    [Tags]    negative    UI
    Ensure User Is Logged In
    Submit Blank Transfer Amount
    Verify Transfer Error Is Shown
