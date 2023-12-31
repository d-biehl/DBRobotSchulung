*** Settings ***
Resource    TestAnwendung.resource
Test Tags    login    regression


*** Test Cases ***
Valid Login Admin
    [Setup]    Anwendung starten
    [Teardown]    Anwendung beenden
    [Tags]    smoke
    Benutzer anmelden    ADMIN    password    
    Prüfe ob angemeldet

Valid Login User1
    [Setup]    Anwendung starten
    Benutzer anmelden    USER1    password    
    Prüfe ob angemeldet
    [Teardown]    Anwendung beenden

Valid Login User2
    [Tags]    smoke
    [Setup]    Anwendung starten
    Benutzer anmelden    USER2    password    
    Prüfe ob angemeldet
    [Teardown]    Anwendung beenden

Invalid Login 
    [Setup]    Anwendung starten
    Benutzer anmelden    USER3    password    
    Prüfe ob angemeldet
    Log  Hallo Welt
    [Teardown]    Anwendung beenden
