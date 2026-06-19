*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/login_locators.robot

*** Keywords ***
Login User
    Input Text    ${login_username}    Mridul
    Input Text    ${login_password}    manav
    Click Button    ${login_button}