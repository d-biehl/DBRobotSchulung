*** Settings ***
Resource    TestAnwendung.resource

Suite Setup    Userdaten einspielen
Suite Teardown    Userdaten zurücksetzen

Test Setup    Anwendung starten
Test Teardown    Anwendung beenden

*** Test Cases ***
Valid Login Admin    
    Benutzer anmelden    ADMIN    password    
    Prüfe ob angemeldet    

Valid Login User1    
    Benutzer anmelden    USER1    password    
    Prüfe ob angemeldet    

Valid Login User2    
    Benutzer anmelden    USER2    password    
    Prüfe ob angemeldet    

Invalid Login     
    Benutzer anmelden    USER3    password    
    Prüfe ob angemeldet
    Log  Hallo Welt    


*** Keywords ***
Userdaten einspielen
    Log  Userdaten eingespielt


Userdaten zurücksetzen
    Log  Userdaten zurückgesetzt

