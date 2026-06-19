*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/account_create.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-E2E-02 Open Savings Account and Verify via API
    [Documentation]    Create savings account through UI and check account type in API.
    [Tags]    e2e

    Ensure User Is Logged In
    Create Savings Account
    Verify Account Creation Success Message

    Create Session To API

    ${response}=    Get Account Details    ${SAVINGS_ACCOUNT_NUMBER}
    Should Be Equal As Strings    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}
    Should Be Equal As Strings    ${body['type']}    SAVINGS
    Should Be Equal As Integers    ${body['id']}    ${SAVINGS_ACCOUNT_NUMBER}
