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
    WHEN I get the load time                    ${FORECASTPAGE_URL}    
    ...                                         5                             
    ...                                         ${tableau_element}