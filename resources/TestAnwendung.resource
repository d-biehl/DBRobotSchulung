
*** Variables ***
${ANGEMELDET}    ${False}
@{VALID_USERS}    ADMIN    USER1    USER2


*** Keywords ***
Anwendung starten
    Log    Anwendung gestartet
    
Anwendung fehlgeschlagen
    Fail    Geht nicht
    
Benutzer anmelden
    [Arguments]    ${username}    ${password}
    
    IF  $username in $VALID_USERS
        Log    Benutzer ${username} angemeldet
        Set Test Variable  ${ANGEMELDET}  ${True}
    ELSE
        Log    Benutzer ${username} Anmeldung verweigert
        Set Test Variable  ${ANGEMELDET}  ${False}
    END 

    [Teardown]    Log    TearDown from Keyword   

Prüfe ob angemeldet
    Should Be True    ${ANGEMELDET}

Anwendung beenden
    Log  Anwendung beendet
