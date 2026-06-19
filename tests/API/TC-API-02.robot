*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC-API-02 Verify Specific Account Details
    [Documentation]    Verify GET account details API
    [Tags]    api

    ${response}=    Get Account Details    ${ACCOUNT_ID}

    Verify Response Code    ${response}    200

    Log To Console    ${response.text}

    Should Contain    ${response.text}    id
    Should Contain    ${response.text}    customerId
    Should Contain    ${response.text}    type
    Should Contain    ${response.text}    balance
