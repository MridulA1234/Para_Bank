*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/transfer_funds_locators.robot

*** Keywords ***


Transfer Funds
    [Documentation]    Transfer funds between accounts
    [Arguments]    ${amount}
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains    Transfer Funds    10s
    Input Text    ${tranfer_amount_input}    ${amount}

    Wait Until Page Contains Element    id=fromAccountId    10s
    Wait Until Page Contains Element    id=toAccountId      10s

    Wait Until Keyword Succeeds    10s    1s
    ...    Get From Account Dropdown Options

    Wait Until Keyword Succeeds    10s    1s
    ...    Get To Account Dropdown Options

    Select From List By Index    id=fromAccountId    0
    ${from_account}=    Get Selected List Value    id=fromAccountId
    Set Suite Variable    ${FROM_ACCOUNT}    ${from_account}

    Select From List By Index    id=toAccountId    1
    ${to_account}=    Get Selected List Value    id=toAccountId
    Set Suite Variable    ${TO_ACCOUNT}    ${to_account}

    Click Element    ${transfer_button}

    Log To Console    From Accounts: ${from_account}
    Log To Console    To Accounts: ${to_account}

Transfer Success Confirmation
    [Documentation]    Verify that the transfer success message is displayed
    Wait Until Page Contains    Transfer Complete!    10s
    Page Should Contain    ${FROM_ACCOUNT}
    Page Should Contain    ${TO_ACCOUNT}

Get From Account Dropdown Options
    ${from_items}=    Get List Items    id=fromAccountId
    Log To Console    Available Accounts: ${from_items}
    Should Not Be Empty    ${from_items}

Get To Account Dropdown Options
    ${to_items}=    Get List Items    id=toAccountId
    Log To Console    Available Accounts: ${to_items}
    Should Not Be Empty    ${to_items}

