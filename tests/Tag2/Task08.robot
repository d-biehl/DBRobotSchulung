*** Settings ***
Name    Task08 - Variablen Beispiele

*** Variables ***
@{A_LIST}                   Hund    Katze    Maus
@{LOG_ARGUMENTS}            Dies ist eine <b><i>Meldung</i></b>    WARN    ${True}
&{LOG_ARGUMENTS_DICT}       message=Dies ist eine <b><i>Meldung</i></b>    level=WARN    html=${True}

&{Kunde1}                   Name=Bernd
...                         Vorname=Tester
...                         Strasse=Teststr. 15
...                         PLZ=12345
...                         Ort=Teststadt

&{Kunde2}                   Name=Klaus
...                         Vorname=Quick
...                         Strasse=Waldstr. 15
...                         PLZ=54321
...                         Ort=Testdorf
...                         Konto=23213434


@{KUNDEN_LISTE}    ${Kunde1}    ${Kunde2}

*** Test Cases ***
First
    [Tags]    regression    tmt:98172312
    Log    ${A_LIST}[0]
    Log    ${A_LIST}[1]
    Log    ${A_LIST}[2]

    FOR    ${index}    IN    @{A_LIST}
        Log    ${index}
    END

    ${A_LIST}[1]    Set Variable    Elefant
    Log Many    @{A_LIST}

    ${A_LIST}[1]    Create List    Hund    Tiger    Fisch
    Log Many    @{A_LIST}

second
    Log    Dies ist eine Meldung
    Log    @{LOG_ARGUMENTS}

third
    [Tags]    regression
    Log    &{LOG_ARGUMENTS_DICT}
    Log Many    &{Kunde1}

vierter
    Kunde erstellen    Tester    Bernd    bklasd    alösdljk    aölsdk  Konto=asd  Betrag=asd
    Kunde erstellen    &{Kunde1}

fünfter
    Log    ${Kunde1}[Name]
    ${Kunde1}[Name][1]    Set Variable    Hallo
    Log    ${Kunde1}[Name]

sechster
    Log Many    @{KUNDEN_LISTE}
    Log    ${KUNDEN_LISTE}[0][Name]
    Log    ${KUNDEN_LISTE}[1][Name]

    FOR  ${kunde}  IN  @{KUNDEN_LISTE}
        Kunde erstellen    &{kunde}
    END
    

*** Keywords ***
Kunde erstellen
    [Arguments]    ${Name}    ${Vorname}    ${Strasse}    ${PLZ}    ${Ort}   &{other}
    Log    Name=${Name}

