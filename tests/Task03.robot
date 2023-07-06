*** Settings ***
Library   String  


*** Test Cases ***
Prüfe auf Title Case
    Should Be Title Case    Ein Großer Buchstabe Am Anfang
    String.Should Be Lower Case    ein großer buchstabe am anfang
