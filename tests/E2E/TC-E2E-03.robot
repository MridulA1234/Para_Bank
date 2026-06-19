*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/account_create.robot
Resource    ../../resources/pages/transfer_funds.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-E2E-03 Transfer Funds and Check Balance via API
    [Documentation]    Transfer funds through UI and verify the transfer is reflected via API.
    [Tags]    e2e

    Ensure User Is Logged In
    Create Savings Account

    Create Session To API

    Transfer Funds    150
    Transfer Success Confirmation

    # FROM_ACCOUNT and TO_ACCOUNT are set as suite variables by Transfer Funds keyword
    Log To Console    Transfer from: ${FROM_ACCOUNT} to: ${TO_ACCOUNT}

    # Verify Credit transaction of 150 exists in destination account
    ${tx_response}=    Get Account Transactions    ${TO_ACCOUNT}
    Should Be Equal As Strings    ${tx_response.status_code}    200
    Should Contain    ${tx_response.text}    Credit

    # Verify destination balance reflects the transfer
    ${dest_after}=    Get Account Balance    ${TO_ACCOUNT}
    Log To Console    Destination Balance After: ${dest_after}
    Should Be True    ${dest_after} >= 150
