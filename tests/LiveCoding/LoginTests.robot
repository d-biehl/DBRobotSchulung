*** Settings ***
Library             Browser    show_keyword_call_banner=${True}

Suite Setup         Run Keywords    
...    New Browser    browser=${BROWSER}    headless=${HEADLESS}    slowMo=0s    
...    AND    New Context    recordVideo={'dir': ${{repr($OUTPUT_DIR+'/video')}}}

Suite Teardown      Close Context
Test Template       Valid Login Template
Test Tags    weblogin

*** Variables ***
${BROWSER}      chromium
${HEADLESS}     True


*** Test Cases ***
Login mit schulung01    schulung01    @RBTFRMWRK@
Login mit schulung02    schulung02    @RBTFRMWRK@


*** Keywords ***
Valid Login Template
    [Arguments]    ${username}    ${password}
    Anwendung starten
    Benutzer anmelden    ${username}    ${password}
    Prüfe ob angemeldet
    [Teardown]    Anwendung beenden

Invalid Login Template
    [Arguments]    ${username}    ${password}
    Anwendung starten
    Benutzer anmelden    ${username}    ${password}
    Prüfe ob Fehlermeldung vorhanden    Unbekannter Benutzer
    [Teardown]    Anwendung beenden

Anwendung starten
    New Page    http://car.keyword-driven.de
    Get Title    should be    CarConfigurator

Benutzer anmelden
    [Arguments]    ${username}    ${password}
    Type Text    id=input_username    ${username}
    Type Text    id=input_password    ${password}
    Click    id=button_login

Prüfe ob angemeldet
    Get Url    ==    http://car.keyword-driven.de/list

Prüfe ob Fehlermeldung vorhanden
    [Arguments]    ${meldung}
    Get Text  id=Fehlermeldung    ==    ${meldung}

Anwendung beenden
    Click    xpath=//nav//a[text()="Logout"]
