#include 'protheus.ch'
#include 'parmtype.ch'

user function Estrutura()
    local nNum:=10
    local nNum2:=20

    if(nNum>nNum2)
        msgalert("N1 maior que N2")
    
    elseif (nNum<nNum2)
        msgalert("N1 menor que N2")

    endif
RETURN



user function DoCase()
    
    local oError := ErrorBlock({|e|ChecErro(e)}) //Para exibir um erro mais amigável
    Local cData := ""
    Local nRetorno := 0
    cRetorno := FWInputBox("Informe o texto", "")

    MsgInfo(cRetorno)
    
    
    
    Do CASE
    
    case cData == "20/12/1986"
    alert("Nao é natal"+cData)

    case cData=="25/12/1986"
    alert("Entao ehhhh natall")

    otherwise 
    msgalert("Nao sei que dia eh hoje ! ")

    endcase
RETURN