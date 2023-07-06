*** Settings ***
Resource    TestAnwendung.resource
Test Template    Valid Login Template
Test Setup      Anwendung starten
Test Teardown     Anwendung beenden

*** Test Cases ***

Valid Login ADMIN    ADMIN    pwd
Valid Login USER1    USER1    pwd
Valid Login USER2    USER2    pwd

*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}

    Benutzer anmelden    ${username}     ${password}    
    Prüfe ob angemeldet
    
