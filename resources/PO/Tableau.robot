*** Settings ***
Library        SeleniumLibrary
Library        String
Library        Collections

*** Keywords ***
Validate Load Time
    [Arguments]          ${element}
    ${start_time}=       Evaluate    time.time()    modules=time
    Wait Until Element Is Visible    ${element}
    ${end_time}=         Evaluate    time.time()    modules=time
    ${load_time}=        Evaluate    ${end_time} - ${start_time}
    Log                  Load time: ${load_time} seconds
    RETURN               ${load_time}

