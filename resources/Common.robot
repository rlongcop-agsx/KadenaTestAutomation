*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem

*** Variables ***

*** Keywords ***
Open Test Browser
    [Arguments]        ${name}
    Set Selenium Timeout       10s

    Empty Directory            testsuites/screenshots
    Set Screenshot Directory   testsuites/screenshots

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${name}Options()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    Create WebDriver    ${name}    options=${options}

    Maximize Browser Window

Close Test Browser
    Wait Until Keyword Succeeds    10    1s    Capture Page Screenshot
    Close All Browsers