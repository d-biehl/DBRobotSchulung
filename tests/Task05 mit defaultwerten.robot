*** Variables ***
${DEFAULT_EMAIL}    test@blöah.de

*** Keywords ***
Personendaten Eingeben
    [Arguments]    ${anrede}    ${vorname}    ${name}    ${geburtsdatum}    
    ...    ${strasse}    ${nr}         ${plz}    ${ort}   
    ...     ${telefonnummer_für_rückfragen}=${EMPTY}    ${email}=${DEFAULT_EMAIL}
    
    Log    ${anrede} ${vorname} ${name}    
    Log    Geburtsdatum: ${geburtsdatum}
    Log    Anschrift:
    Log    ${strasse} ${nr}
    Log    ${plz} ${ort}
    Log    Tel: ${telefonnummer_für_rückfragen} 
    Log    E-Mail: ${email}

*** Test Cases ***
Personendaten prüfen
    Personendaten Eingeben    Herr    Daniel    Tester    1.1.1999    
    ...    Teststr.    4    11111    Testdorf   email=daniel@test.de

    