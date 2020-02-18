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

user function Contador ()
    local nCount:=0
    //local oError := ErrorBlock({|e|ChecErro(e)}) //Para exibir um erro mais amigável
    Local cNum :=""
    while valtype(cNum)!="N" .OR. cNum==0
        cNum := FWInputBox("Informe o numero", "")
        cNum :=val(cNum)
    end

    for nCount := 1 to 9
        nCount += cNum
    next
    Alert("Valor:"+cValtochar(nCount))


//xConteudo := (cxAlias)->( FieldGet(nAux) ) 
//If ValType( xConteudo ) == "C"
RETURN



user function Vetor1()





    /**
    AADD() -PERMITE ADICIONAR ITEM EM UM ARRAY JA EXISTENTE
    AINS()-PERMITE ADICIONAR UM ELEMENTO EM QUALQUER POSIÇÃO DO ARRAY
    ACLONE()- REALIZA A COPIA DE UM ARRAY PRA OUTRO
    ADEL()- PERMITE A EXCLUSÃO DE UM ELEMENTO DE ARRAY 
    ASIZE()-REDEFINE A ESTRUTURA DE UM ARRAY
    LEN()- RETORNA A QUANTIDADE DE ELEMENTOS DE UM ARRAY
    **/
    local nCount2:=1
    Local aVetor:={10,20,30}
        
        AADD(aVetor,40)
        Alert(len(aVetor))
        
        AINS(aVetor,2)
        aVetor[2]:= 24
        Alert(aVetor[2])
        
        aVetor2:=Aclone(aVetor)
    for nCount2 := -1  to len(aVetor2)
            alert(aVetor2[nCount2])
    next
return


user function BlocoX()
   //Bloco de codigos//
   local bBloco :=  {|cMsg| Alert(cMsg)}
        Eval(bBloco,"Ola mundo")

return

user Function BANCODADOS()
   local aArea:= SB1->(GetArea()) 
   local cMSG :=""

   DbselectArea("SB1")
   SB1->(DbsetOrder(1))
   SB1->(DbGoTop())

    IF SB1->(DbSeek(FWXFILIAL("SB1")+"000002"))
        Alert(SB1->B1_DESCCCCC)
    ENDIF

    RestArea(aArea)


RETURN
