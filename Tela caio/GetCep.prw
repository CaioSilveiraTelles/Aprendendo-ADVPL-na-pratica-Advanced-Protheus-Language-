#include 'protheus.ch'
#INCLUDE "APWEBSRV.CH"
//-- Location Data -- //
User Function GETCPF(cCEP)
    Local aHead 	 := {"Content-Type: application/json"}
    Local nTimeOut	 := 200
    Local aLocData	 := {}
    Local cWSReturn	 := ""
    Local cGetHeader := ""
    Local oJson
    PRIVATE cUrl     := "viacep.com.br/ws/" + cCEP + "/json/"
    if (ValidLoc(cCep, cUrl))
        cWSReturn := HttpGet(cUrl,, nTimeOut, aHead, @cGetHeader)
        if !FWJsonDeserialize(cWSReturn, @oJson)
            alert("Ocorreu erro no processamento do Json.")
            return nil
        elseif AttIsMemberOf(oJson,"ERRO")
            alert("CEP inexistente na base de dados.")
            return nil
        else
            aadd(aLocData, DecodeUTF8(oJson:logradouro))
            aadd(aLocData, DecodeUTF8(oJson:bairro))
            aadd(aLocData, DecodeUTF8(oJson:localidade))
            aadd(aLocData, DecodeUTF8(oJson:uf))
        endif
        MSGINFO( "INFORMACOES LOCALIZADAS COM SUCESSO" )
    endif
Return aLocData
//-- Validate Location --//
Static Function ValidLoc(cCep,cUrl)
    Local lRet := .F.
    if Empty(Alltrim(cCep)) // Valida se o conteudo passado está vazio.
        alert("Favor informar o CEP.")
        Return (lRet)
    elseif Len(Alltrim(cCep)) < 8 // Valida se o CEP informado tem menos de 8 digitos.
        alert("O CEP informado não contem a quantidade de dígito correta, favor informe um CEP válido.")
        Return (lRet)
    elseif At("-",cCep,) > 0 //Validar se o CEP está separado por "-".
        if Len(StrTran(AllTrim(cCep),"-")) == 8 //Valida se o CEP tratado tem 8 digitos.
            cUrl += StrTran(AllTrim(cCep),"-")+"/json/"
            lRet := .T.
        else
            alert("O CEP informado não contem a quantidade de dígito correta, favor informe um CEP válido.")
            Return (lRet)
        endif
    else
        cUrl += AllTrim(cCep)+"/json/"
        lRet := .T.
    endif
Return (lRet)