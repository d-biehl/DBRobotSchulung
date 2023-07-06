*** Test Cases ***
Einfache Schleife
    FOR  ${i}  IN  Katze    Hund    Maus
        Log    ${i}
    END
    
Multiple loop variables
    [Setup]    Create TestData
    Log  Do Something

*** Keywords ***
Create TestData
    FOR    ${index}    ${english}    ${finnish}    IN
    ...    1           cat           kissa
    ...    2           dog           koira
    ...    3           horse         hevonen
        Create Translation     ${index}: ${english} = ${finnish}
    END

Create Translation
    [Arguments]    ${arg1}
    Log    ${arg1}

