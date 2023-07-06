*** Settings ***
Resource    TestAnwendung.resource
Test Template    Valid Login Template
Library    DataDriver

*** Test Case ***
Login with user ${username} and password ${password}    Default    UserData

*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}
    Anwendung starten
    Benutzer anmelden    ${username}     ${password}    
    Prüfe ob angemeldet
    Anwendung beenden
