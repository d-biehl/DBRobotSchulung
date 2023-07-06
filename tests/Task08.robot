*** Variables ***
@{A_LIST}       Hund    Katze    Maus


*** Test Cases ***
First
    Log    ${A_LIST}[0]
    Log    ${A_LIST}[1]
    Log    ${A_LIST}[2]

    FOR    ${index}    IN    @{A_LIST}
        Log    ${index}
    END

    ${A_LIST}[1][1][1][1]    Set Variable    Elefant
    Log Many    @{A_LIST}

    ${a_new_list}[1][1][1]    Create List    Hund    Tiger    Fisch
    Log Many    @{a_new_list}
