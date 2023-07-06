*** Keywords ***
Berechne Summe
    [Arguments]    ${erster}    ${zweiter}
    ${result}    Evaluate    ${erster} + ${zweiter}
    RETURN  ${result}


*** Test Cases ***
first
    ${ergebnis}    Berechne Summe    1.1    2.4
    Should Be Equal As Numbers    ${ergebnis}    3
     