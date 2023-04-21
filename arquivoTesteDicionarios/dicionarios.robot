*** Settings ***

*** Variables ***
# Tipo lista (dicionarios)
&{MESES}  janeiro=31  fevereiro=29  marco=31

## robot -d ./logs arquivoTesteDicionarios/dicionarios.robot
*** Test Cases ***
Imprimir valores dos meses
    Log To Console  janeiro: ${MESES.janeiro}  fevereiro: ${MESES.fevereiro}  marco: ${MESES.marco} 