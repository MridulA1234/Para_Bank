*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource    ../../locators/negative_locators.robot

*** Keywords ***
Login With Invalid Credentials
    Input Text    ${login_username}    invalidUser
    Input Text    ${login_password}    wrongpassword
    Click Element    ${login_button}

Verify Login Error Is Shown
    Wait Until Page Contains    could not be verified    10s
    Log To Console    Login error verified — invalid credentials rejected

Submit Blank Transfer Amount
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains    Transfer Funds    10s
    Wait Until Page Contains Element    ${transfer_from_dropdown}    10s
    Wait Until Page Contains Element    ${transfer_to_dropdown}    10s
    Wait Until Keyword Succeeds    10s    1s    Verify From Dropdown Has Options
    Select From List By Index    ${transfer_from_dropdown}    0
    Select From List By Index    ${transfer_to_dropdown}    0

    Click Element    ${transfer_button}

Submit Transfer With Negative Amount
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains    Transfer Funds    10s
    Wait Until Page Contains Element    ${transfer_from_dropdown}    10s
    Wait Until Page Contains Element    ${transfer_to_dropdown}    10s
    Wait Until Keyword Succeeds    10s    1s    Verify From Dropdown Has Options
    Input Text    ${transfer_amount_input}    -100
    Select From List By Index    ${transfer_from_dropdown}    0
    Select From List By Index    ${transfer_to_dropdown}    0
    Click Element    ${transfer_button}
    Log To Console    Submitted transfer with negative amount -100

Submit Transfer With Amount Greater Than Balance
    Click Element    ${transfer_funds_link}
    Wait Until Page Contains    Transfer Funds    10s
    Wait Until Page Contains Element    ${transfer_from_dropdown}    10s
    Wait Until Page Contains Element    ${transfer_to_dropdown}    10s
    Wait Until Keyword Succeeds    10s    1s    Verify From Dropdown Has Options
    Input Text    ${transfer_amount_input}    999999
    Select From List By Index    ${transfer_from_dropdown}    0
    Select From List By Index    ${transfer_to_dropdown}    0
    Click Element    ${transfer_button}
    Log To Console    Submitted transfer with amount 999999 (way above balance)

Verify Transfer Error Is Shown
    Sleep    2s
    Page Should Contain    Error!
    Log To Console    Transfer correctly rejected — Transfer Complete did not appear

Verify Transfer Is Shown
    Sleep    2s
    Page Should not Contain    Error!
    Log To Console    Transfered correctly — Transfer appear

Verify From Dropdown Has Options
    ${items}=    Get List Items    ${transfer_from_dropdown}
    Log To Console    From dropdown options: ${items}
    Should Not Be Empty    ${items}
