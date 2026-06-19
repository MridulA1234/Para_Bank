*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/login_locators.robot

*** Keywords ***
Login User
    Input Text    ${login_username}    john
    Input Text    ${login_password}    demo
    Click Button    ${login_button}