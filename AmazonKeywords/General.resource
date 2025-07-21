*** Settings ***
Library           String

*** Keywords ***
Trim String Price
    [Arguments]    ${String}
    ${String} =  Remove String    ${String}    ...
    ${String} =  Remove String    ${String}    ,
    ${String}=   Replace String    ${String}    \n    ${SPACE}
    ${String} =  Remove String    ${String}    ${SPACE}
    [Return]  ${String}

Trim String Name
    [Arguments]    ${String}
    ${String} =  Remove String    ${String}    ...
    [Return]  ${String}
