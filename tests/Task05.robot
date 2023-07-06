*** Settings ***
Documentation    Testet Keywords und Dokumentation

*** Keywords ***
Personendaten Eingeben
    [Documentation]    Gibt die Daten auf dem *Personendaten* Dialog ein.
    ...
    ...   Vorbedingung:  Der Dialog muss *geöffnet* sein
   
    ...   Examples: 
    ...
    ...   | asd | asd |

    [Arguments]    ${anrede}    ${vorname}    ${name}    ${geburtsdatum}    
    ...    ${strasse}    ${nr}         ${plz}    ${ort}   
    ...     ${telefonnummer_für_rückfragen}    ${email}
    
    Log    ${anrede} ${vorname} ${name}    
    Log    Geburtsdatum: ${geburtsdatum}
    Log    Anschrift:
    Log    ${strasse} ${nr}
    Log    ${plz} ${ort}

*** Test Cases ***
Personendaten prüfen
    [Documentation]    Prüft die valide Eingabe der Personendaten 
    Personendaten Eingeben    Herr    Daniel    Tester    1.1.1999    
    ...    Teststr.    4    11111    Testdorf    0123123    danieltester@test.de

    