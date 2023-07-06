*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}    chromium
${HEADLESS}    False

*** Test Cases ***
Login mit korrekten Daten
    New Browser   browser=${BROWSER}     headless=${HEADLESS}
    New Page    http://car.keyword-driven.de
    Get Title    should be      CarConfigurator   
    Type Text  id=input_username  schulung01
    Type Text  id=input_password  @RBTFRMWRK@
    Click  id=button_login
    Get Url  ==  http://car.keyword-driven.de/list
    Click  xpath=//nav//a[text()="Logout"]
    