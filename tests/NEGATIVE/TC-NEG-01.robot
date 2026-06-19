*** Settings ***
Resource    ../../resources/pages/negative.robot
Resource    ../../resources/pages/login.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-NEG-01 Login with Non Existent User
    [Documentation]    Verify that logging in with a username that doesnt exist shows an error
    [Tags]    negative    UI
    Login With Invalid Credentials
    Verify Login Error Is Shown
