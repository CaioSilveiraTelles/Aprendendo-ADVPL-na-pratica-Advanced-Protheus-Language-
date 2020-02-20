#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'
#INCLUDE "TopConn.ch"
#INCLUDE "TBICONN.ch"


user function dbRoutines()
    Local cTAlias := "SB1"
    Local cTittle := "AX - Cadastro"
    Local cVldExc := ".T."
    Local cVldAlt := ".T."
    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" USER "ADMIN" PASSWORD "" MODULO "FAT"
    AxCadastro(cTAlias, CTittle, cVldExc, cVldAlt)
return

user function BANCO01()
    
    local aArea
    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM"
    aArea := SB1->(GetArea())
    //local cMsg:=""
    
    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    if SB1->(dbSeek(FWXFILIAL("SB1")+ "000002"))
        conout(SB1->B1_DESC)
    endif 

    RestArea(aArea)
return

user function Banco02()
    local aArea
    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "COM"
    aArea := SB1->(GetArea())
    local cMsg:=""
    
    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    cMsg:=Poscione(   "SB1" , ; 
                        1, ; 
                             FWXFILIAL("SB1")+"PROD001, ; 
                             "B1_DESC")                      

    Alert("Descrição Produto : "+ cMsg, "AVISO")



    RestArea(aArea)
return

user function BANCO03()
    local aARea:= SB1->(GetArea())
    local cQuery:=""
    local aDados:= ()

    cQuery := " Select "
    cQuery += " B1_COD AS CODIGO,  "
    cQuery += "B1_DESC AS DESCRICAO "
    cQuery += " FROM "
    cQuery += " "+ RETSQLName("SB1")+
    cQuery += "WHERE"
    cQuery += "B1_MSQL !='1' "


    TCQUERY cQUERY New Alias "TMP"

    while != TMP->(Eof())
        AADD(aDados, TMP->CODIGO)
        AADD(aDados, TMP->DESCRICAO)
        TMP-> (DbSkip() )
    ENDDO
    
    Alert(len(aDados))

        for nCount := 1 to len(aDados)
            MsgInfo(aDados[nCount])
        
        Next nCount

        TMP->(DbCloseArea() )
        RestArea(aArea)