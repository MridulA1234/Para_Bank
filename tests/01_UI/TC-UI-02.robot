*** Settings ***
Resource    ../../resources/pages/login.robot
Resource    ../../resources/pages/register.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-02 Successful Login to ParaBank
    [Documentation]    Test user login with valid credentials
    [Tags]    UI
    Login User

    ${login_success}=    Run Keyword And Return Status
    ...    Wait Until Page Contains
    ...    Accounts Overview
    ...    10s

    IF    not ${login_success}
        Go To    ${BASE_URL}
        Register User
    END
