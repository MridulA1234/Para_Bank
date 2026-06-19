*** Settings ***
Library    SeleniumLibrary
Library    ../../config/environment.py
Resource   ../pages/login.robot
Resource    ../pages/register.robot

*** Variables ***
${BROWSER}    chrome
${ENV}    qa

*** Keywords ***
Load Environment
    Load Env    ${ENV}
    ${url}=  Get Env    baseurl
#    ${phone_no}=  Get Env    ph_no

    Set Global Variable    ${BASE_URL}  ${url}
#    Set Global Variable    ${USER_EMAIL}  ${phone_no}
    Log    Loaded BASE_URL=${BASE_URL}

Open Application
    [Documentation]  Opens the application
    Should Not Be Empty    ${BASE_URL}    Base URL must not be empty. Please set it in config/env.yaml
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window
    Sleep    5s

Close Application
    [Documentation]  Closing the application
    Close All Browsers

Ensure User Is Logged In
    Login User

    ${login_success}=    Run Keyword And Return Status
    ...    Wait Until Page Contains
    ...    Accounts Overview
    ...    10s

    IF    not ${login_success}
        Go To    ${BASE_URL}
        Register User
    END

