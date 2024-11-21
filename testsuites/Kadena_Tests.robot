*** Settings ***
Resource                                   ../variables/KadenaVariable.robot
Resource                                   ../locators/LoginLocators.robot
Resource                                   ../locators/HomeLocators.robot
Resource                                   ../resources/Common.robot
Resource                                   ../resources/KadenaApp.robot
Test Setup                                 Common.Open Test Browser            ${BROWSER_NAME}
Test Teardown                              Common.Close Test Browser

# robot -d results -v BROWSER_NAME:Edge testsuites

*** Test Cases ***
Test Scenario 1: Login with invalid password
    [Documentation]                        Login with invalid credentials
    [Tags]                                 TS-SIT-001    
    ...                                    M0MAIN-SIT-001
    GIVEN I go to Login page
    AND I enter                            ${VALID_ORDERING_EMAIL}    ${EMAIL}
    AND I enter                            ${INVALID_PASSWORD}        ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    THEN A message should display          ${INVALID_ERROR_MESSAGE}

Test Scenario 2: Login with invalid email
    [Documentation]                        Login with invalid credentials
    [Tags]                                 TS-SIT-001    
    ...                                    M0MAIN-SIT-001
    GIVEN I go to Login page
    AND I enter                            ${INVALID_EMAIL}           ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}          ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    THEN A message should display          ${INVALID_ERROR_MESSAGE}

Test Scenario 3: Login with access to Forecasting
    [Documentation]                        Login with access to Forecasting
    [Tags]                                 TS-SIT-001
    ...                                    M0MAIN-SIT-002
    ...                                    fcast
    GIVEN I go to Login page
    AND I enter                            ${VALID_FORECASTING_EMAIL}  ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}           ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    AND A message should display           Welcome
    AND The link should not be clickable   ${ORDERING_LINK}
    AND The link should not be clickable   ${PROCUREMENT_LINK}
    AND The link should not be clickable   ${VENDOR_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${FORECAST_LINK}
    THEN I should be redirected to the     Forecasting

Test Scenario 4: Login with access to Supply Planning modules
    [Documentation]                        Login with access to Supply Planning
    [Tags]                                 TS-SIT-001
    ...                                    M0MAIN-SIT-002
    GIVEN I go to Login page
    AND I enter                            ${VALID_FORECASTING_EMAIL}  ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}           ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    AND A message should display           Welcome
    AND The link should not be clickable   ${ORDERING_LINK}
    AND The link should not be clickable   ${PROCUREMENT_LINK}
    AND The link should not be clickable   ${VENDOR_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${SUPPLY_LINK}
    THEN I should be redirected to the     Supply Planning