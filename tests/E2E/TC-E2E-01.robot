*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/account_create.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-E2E-01 Create Account and Verify via API
    [Documentation]    Verify that account created via UI is successfully available in the API response.
    [Tags]    e2e

    Ensure User Is Logged In
    Create Checking Account
    Verify Account Creation Success Message

    Create Session To API

    ${response}=    Get Account Details    ${CHECKING_ACCOUNT_NUMBER}
    Should Be Equal As Strings    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}
    Log To Console    ${body}
    Should Be Equal As Integers    ${body['id']}    ${CHECKING_ACCOUNT_NUMBER}
