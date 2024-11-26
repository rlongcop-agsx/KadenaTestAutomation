*** Settings ***
Library        SeleniumLibrary
Library        String
Library        Collections
Library        SikuliLibrary

*** Variables ***
${IMAGE_PATH}=        testsuites/image/Forecasting.png

*** Keywords ***
Validate Load Time
    [Arguments]        ${text}
    ${start_time}=       Evaluate    time.time()    modules=time
    
    Wait Until Element Is Visible    css=div.tableau-wrapper > *
    

    Capture Page Screenshot

    ${end_time}=         Evaluate    time.time()    modules=time
    ${load_time}=        Evaluate    ${end_time} - ${start_time}
    Log                  Load time: ${load_time} seconds
    RETURN               ${load_time}

