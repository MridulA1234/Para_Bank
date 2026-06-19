*** Settings ***
Library    RequestsLibrary
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment

*** Variables ***
${API_BASE}    https://parabank.parasoft.com/parabank/services/bank

*** Test Cases ***
TC-NEG-05 Invalid Account ID via API
    [Documentation]    Call GET /accounts/000000 with a fake account ID — expect a 4xx response
    [Tags]    negative    API
    [Setup]    NONE
    [Teardown]    NONE
    ${auth}=    Create List    john    demo
    Create Session    parabank    ${API_BASE}    auth=${auth}    verify=${False}
    ${response}=    GET On Session    parabank    /accounts/000000
    ...    expected_status=any
    Log To Console    Response status: ${response.status_code}
    Should Not Be Equal As Integers    ${response.status_code}    200
