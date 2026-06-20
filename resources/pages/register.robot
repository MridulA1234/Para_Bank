*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/register_locators.robot

*** Keywords ***
Register User
    ${url}=    Get Location
    Log To Console    Current URL: ${url}
    Wait Until Element Is Visible    ${register_link}    10s
    Click Element    ${register_link}

    Input Text    ${first_name}    Mridul
    Input Text    ${last_name}     Agarwal
    Input Text    ${address}    6/335,SFS,Agarwal Farm
    Input Text    ${city}    Jaipur
    Input Text    ${state}    Rajasthan
    Input Text    ${zipcode}    302020
    Input Text    ${phone}    8740810000
    Input Text    ${ssn}    123
    Input Text    ${username}    Mridul12
    Input Text    ${password}    manav
    Input Text    ${confirm_password}    manav
    Click Element    ${register_button}
    Sleep    2s

    Wait Until Page Contains    Your account was created successfully. You are now logged in.
    Log To Console    User registered successfully