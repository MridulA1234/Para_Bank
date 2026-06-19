*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Create Session To API

*** Test Cases ***

TC-API-01 Validate Account Exists via API
    [Documentation]    Validate Account Exists via API
    [Tags]    api

    ${response}=    Get Customer Accounts    ${CUSTOMER_ID}

    Verify Response Code    ${response}    200

    Log To Console    ${response.text}

    Should Contain    ${response.text}    ${ACCOUNT_ID}
