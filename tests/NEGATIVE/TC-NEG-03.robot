*** Settings ***
Resource    ../../resources/pages/negative.robot
Resource    ../../resources/pages/login.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-NEG-03 Transfer Negative Amount
    [Documentation]    Enter -100 as transfer amount — app should reject it with an error
    ...    NOTE: This test is expected to FAIL — ParaBank processes the transfer
    ...    without showing any error (logged as DEF-001)
    [Tags]    negative    UI    known-bug
    Ensure User Is Logged In
    Submit Transfer With Negative Amount
    Verify Transfer Is Shown
