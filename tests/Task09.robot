*** Settings ***
Library   Dialogs

*** Variables ***
${QUESTION}    What's your name?
${EXPECTED_ANSWER}    Daniel

*** Test Cases ***

Get Input and Verify correct answer
    ${answer}    Dialogs.Get Value From User    ${QUESTION}   
    Should Be Equal    ${answer}    ${EXPECTED_ANSWER}

Get Input and Verify wrong answer
    ${answer}    Dialogs.Get Value From User    ${QUESTION}
    Should Not Be Equal    ${answer}    ${EXPECTED_ANSWER}

