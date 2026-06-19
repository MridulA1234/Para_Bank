*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/account_create_locators.robot

*** Keywords ***
Create Savings Account
    [Documentation]    Create a savings account with the provided details
    Click Element    ${open_new_account_link}

    Wait Until Page Contains    Open New Account    10s
    Wait Until Element Is Visible    id=type    10s
    Wait Until Element Is Visible    id=fromAccountId    10s

    Wait Until Keyword Succeeds    10s    1s
    ...    Verify Source Account Dropdown Loaded

    Select From List By Label    id=type  SAVINGS
    Select From List By Index    id=fromAccountId    0

    Click Element    ${open_new_account_button}

    Wait Until Element Is Visible    xpath=//a[@id="newAccountId"]    10s

    ${account_number}=    Get Text    xpath=//a[@id="newAccountId"]
    Set Suite Variable    ${SAVINGS_ACCOUNT_NUMBER}    ${account_number}
    Log To Console    New account number: ${account_number}

Create Checking Account
    [Documentation]    Create a checking account with the provided details
    Click Element    ${OPEN_NEW_ACCOUNT_LINK}

    Wait Until Page Contains    Open New Account    10s
    Wait Until Element Is Visible    id=type    10s
    Wait Until Element Is Visible    id=fromAccountId    10s

    Wait Until Keyword Succeeds    10s    1s
    ...    Verify Source Account Dropdown Loaded

    Select From List By Label    id=type  CHECKING
    Select From List By Index    id=fromAccountId    0

    Click Element    ${open_new_account_button}

    Wait Until Element Is Visible    xpath=//a[@id="newAccountId"]    10s

    ${account_number}=    Get Text    xpath=//a[@id="newAccountId"]
    Set Suite Variable    ${CHECKING_ACCOUNT_NUMBER}    ${account_number}
    Log To Console    New account number: ${account_number}


Verify Source Account Dropdown Loaded
    ${items}=    Get List Items    id=fromAccountId
    Log To Console    Available Accounts: ${items}
    Should Not Be Empty    ${items}

Verify Account Creation Success Message
    [Documentation]    Verify that the account creation success message is displayed
    Wait Until Page Contains    Congratulations, your account is now open.    10s
