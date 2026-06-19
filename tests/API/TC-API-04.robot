*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC-API-04 Verify Credit Transaction History
    [Documentation]    Verify transaction history for destination account
    [Tags]    api

    ${response}=    Get Account Transactions    ${ACCOUNT_ID_2}

    Verify Response Code    ${response}    200

    Log To Console    ${response.text}

    Should Contain    ${response.text}    Credit
