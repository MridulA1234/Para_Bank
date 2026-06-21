*** Settings ***
Library    RequestsLibrary
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment

*** Variables ***
${API_BASE}    https://parabank.parasoft.com/parabank/services/bank

*** Test Cases ***
TC-NEG-06 Login API with Invalid Credentials
    [Documentation]    Call login API with wrong credentials — expect a non-200 response
    [Tags]    negative    API

    Create Session    parabank    ${API_BASE}    verify=${False}
    ${response}=    GET On Session    parabank    /login/baduser_xyz/wrongpass123
    ...    expected_status=any
    Log To Console    Response status: ${response.status_code}
    Should Not Be Equal As Integers    ${response.status_code}    200
