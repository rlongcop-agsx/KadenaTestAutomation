*** Settings ***
Documentation                              This is the main test suite of the Kadena project
Resource                                   ../variables/KadenaVariable.robot
Resource                                   ../variables/KadenaCredentials.robot
Resource                                   ../locators/LoginLocators.robot
Resource                                   ../locators/HomeLocators.robot
Resource                                   ../resources/Common.robot
Resource                                   ../resources/KadenaApp.robot
Test Setup                                 Common.Open Test Browser            ${BROWSER_NAME}
Test Teardown                              Common.Close Test Browser
Library                                    

*** Variables ***
${login_btn}=        name=login
${tableau_element}=        css=div.tableau-wrapper


*** Test Cases ***
Test Case 11: Forecasting Tableau load time
    [Documentation]                        Validate immediate forecasting tableau load time
    [Tags]                                 Forecasting    
    ...                                    Tableau
    GIVEN I logged in with valid credentials    ${VALID_FORECASTING_EMAIL}    ${EMAIL}    
    ...                                         ${VALID_PASSWORD}             ${PASSWORD}
    AND I click the button                      ${LOGIN_BUTTON}
    AND I get the load time                     ${FORECAST_LINK}    
    ...                                         100
    ...                                         ${tableau_element}
    ...                                         ${LOGINPAGE_URL}
    ...                                         Forecasting