*** Settings ***
Resource    ../../resources/pages/negative.robot
Resource    ../../resources/pages/login.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-NEG-04 Transfer Amount Greater Than Balance
    [Documentation]    Enter 999999 as amount
    [Tags]    negative
    Ensure User Is Logged In
    Submit Transfer With Amount Greater Than Balance
    Verify Transfer Is Shown
