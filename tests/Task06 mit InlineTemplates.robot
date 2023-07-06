*** Settings ***
Resource    TestAnwendung.resource

*** Test Cases ***

Valid Login
    [Template]    Valid Login Template
    ADMIN    pwd
    USER1    pwd
    USER2    pwd

Invalid Login
    [Template]    Invalid Login Template
    ADMIN1    pwd
    USER3    pwd
    USER4    pwd
    USER5    pwd
    USER6    pwd

*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}
    Anwendung starten
    Benutzer anmelden    ${username}     ${password}    
    Prüfe ob angemeldet
    Anwendung beenden


Invalid Login Template
    [Arguments]    ${username}    ${password}
    Run Keyword And Expect Error   'False' should be true.   Valid Login Template    ${username}  ${password}  
