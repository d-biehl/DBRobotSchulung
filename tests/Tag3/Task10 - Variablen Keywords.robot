*** Variables ***
${KUNDENNUMMER}     Invalid


*** Test Cases ***
Kunde Anlegen
    ${kundennummer}    Set Variable    109283712098
    Set Suite Variable    ${KUNDENNUMMER}

Zweiter
    IF    $KUNDENNUMMER == 'Invalid'    Fail    Ungültige Kundennummer
    Log    ${KUNDENNUMMER}

Dritter
    ${a_list}    Create List    Hund    Katze    Maus
    ${a_dict}    Create Dictionary    name=Tester    vorname=Bernd

