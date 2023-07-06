*** Variables ***
${BEDINGUNG}    3
${ANDERE_BEDINGUNG}    79
@{EINE_LISTE}    Wert1  Wert2  Wert3  Wert4

*** Test Cases ***
if anweisung
    do something

for schleifen
    FOR  ${i}  IN  Wert1    Wert2    Wert3
        Log    ${i}
    END

for schleifen in range
    FOR  ${i}  IN RANGE  1    20
        Log    ${i}
    END

for schleifen enumarate
    FOR  ${index}  ${wert}  IN ENUMERATE  Wert1    Wert3    Wert2
        Log    ${index} = ${wert}
    END

for schleifen enumarate über vorhandene liste
    FOR  ${index}  ${wert}  IN ENUMERATE  @{EINE_LISTE}
        Log    ${index} = ${wert}
    END

Exception Handling
    TRY
        Fail  mach was ganz anderes
    EXCEPT    mach was
        Log    mir doch egal
    EXCEPT    mach .* anderes  type=regexp  
        Log    mir nicht egal, aber ok
    EXCEPT    AS  ${e}
        Log  Irgendein Fehler is gekommen:  ${e}
    FINALLY
        Log  Dies wird immer ausgeführt
    END
    log  Ausserhalb des TRY/EXCEPT Blocks


*** Keywords ***
do something
    IF  $BEDINGUNG == '1'
        Log  Mach Was
    ELSE IF  $BEDINGUNG == '2'
        Log  Mach Was mit 2
    ELSE IF  $BEDINGUNG == '3' and ${ANDERE_BEDINGUNG}>80
        Log  Mach Was mit 3
    ELSE
        Log    Mach Was Anderes
        IF  ${ANDERE_BEDINGUNG}
            Log    Und noch was
        END
    END