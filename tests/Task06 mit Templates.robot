*** Settings ***
Resource    TestAnwendung.resource
Test Template    Valid Login Template

*** Test Cases ***

Valid Login ADMIN    ADMIN    pwd
Valid Login USER1    USER1    pwd
Valid Login USER2    USER2    pwd

*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}
    Anwendung starten
    Benutzer anmelden    ${username}     ${password}    
    Prüfe ob angemeldet
    Anwendung beenden
