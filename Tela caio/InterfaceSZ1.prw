//PROJETO TABELA
#include 'protheus.ch'

USER Function Tabela01()

Local oDlg
Local oGroup1
local aSexos :={}
Local aEstados := {}
Local oSay1, oSay2 , oSay3 , oSay4 , oSay5 , oSay6 , oSay7 ,oSay8 , oSay9
Local oGet1, oGet2, oGet3 , oGet4 , oGet5 , oGet6 , oGet7 , oGet8 . oGet9

Local cVarNome := space(50)
Local cVarEnd := space(50)
Local dVarDate := date(8)
local cVarBairro:= space(30)
local cVarCidade := space(30)
local cVarCEP :=space(8)
local cVarTel := space(15)
local cVarEmail:= space(60)
local cVarCpf := space(11)

local cVarCombo

local oEstados 
Local oSexo
Local nVarRadio := 1
Local oBtnBar,oBtnBar1
Local oButton1
Local oBmpBtn1

//Data pelo sistema
SET CENTURY ON
SET DATE BRITISH

//estados
aadd(aEstados,"AC")
aadd(aEstados,"AL")
aadd(aEstados,"AP")
aadd(aEstados,"AM")
aadd(aEstados,"BA")
aadd(aEstados,"CE")
aadd(aEstados,"ES")
aadd(aEstados,"GO")
aadd(aEstados,"MA")
aadd(aEstados,"MT")
aadd(aEstados,"MS")
aadd(aEstados,"MG")
aadd(aEstados,"PA")
aadd(aEstados,"PB")
aadd(aEstados,"PR")
aadd(aEstados,"PE")
aadd(aEstados,"PI")
aadd(aEstados,"RJ")
aadd(aEstados,"RN")
aadd(aEstados,"RS")
aadd(aEstados,"RO")
aadd(aEstados,"RR")
aadd(aEstados,"SC")
aadd(aEstados,"SP")
aadd(aEstados,"SE")
aadd(aEstados,"TO")
aadd(aEstados,"DF")

//Sexos
aadd(aSexos,"Masculino")
aadd(aSexos,"Feminino")
aadd(aSexos,"Não especificar")


DEFINE DIALOG oDlg TITLE "Cadastramento de Funcionario" FROM 0,0 TO 800,1000 PIXEL
oDlg:lEscClose := .F.

@ 05,05 GROUP oGroup1 TO 300,800 LABEL "Entrada de Dados" OF oDlg  PIXEL

//NOME
@ 18,15 SAY oSay1 PROMPT "DIGITE SEU NOME:" SIZE 40,20 OF oDlg  PIXEL
@ 18,45 GET oGet1 VAR cVarNome PICTURE "!@" SIZE 80,12 OF oDlg  PIXEL

//DATA
@ 38,15 SAY oSay2 PROMPT "Dia do Cadastramento" SIZE 40,20 OF oDlg  PIXEL
@ 38,55 GET oGet2 VAR dVarDate SIZE 80,12 OF oDlg  PIXEL

//ENDEREÇO
@ 60,15 SAY oSay3 PROMPT "DIGITE SEU ENDERECO:" SIZE 40,20 OF oDlg  PIXEL
@ 60,50 GET oGet3 VAR cVarEnd PICTURE "!@" SIZE 80,12 OF oDlg  PIXEL

//bairro
@ 105,15 SAY oSay4 PROMPT "DIGITE SEU BAIRRO:" SIZE 30,12 OF oDlg  PIXEL
@ 120,50 GET oGet4 VAR cVarBairro PICTURE "!@" SIZE 80,12 OF oDlg  PIXEL

//cidade 
@ 135,15 SAY oSay5 PROMPT "DIGITE SUA CIDADE:" SIZE 30,12 OF oDlg  PIXEL
@ 145,50 GET oGet5 VAR cVarCidade PICTURE "!@" SIZE 80,12 OF oDlg  PIXEL

//cep
@ 160,15 SAY oSay6 PROMPT "DIGITE SEU CEP:" SIZE 30,12 OF oDlg  PIXEL
@ 170,50 GET oGet6 VAR cVarCEP PICTURE "!@" SIZE 80,12 OF oDlg  PIXEL


//Estados
@ 18,160 SAY oSay10 PROMPT "Selecione seu estado:" SIZE 30,15 OF oDlg  PIXEL
@ 18,200 COMBOBOX oEstados VAR cVarCombo ITEMS aEstados SIZE 80,12 OF oDlg  PIXEL

//Sexo
@ 200,15 RADIO oSexo VAR nVarRadio ITEMS "Masculino","Feminino","Não especificar" SIZE 40,36 OF oDlg  PIXEL

//telefone
@ 225,15 SAY oSay7 PROMPT "DIGITE SEU TELEFONE:" SIZE 30,12 OF oDlg  PIXEL
@ 240,50 GET oGet7 VAR cVarTEL PICTURE "!@" SIZE 80,12 OF oDlg  PIXEL

//email
@ 260,15 SAY oSay8 PROMPT "DIGITE SEU email:" SIZE 30,12 OF oDlg  PIXEL
@ 280,50 GET oGet8 VAR cVarEmail PICTURE "!@" SIZE 80,12 OF oDlg  PIXEL

//cpf
@ 300,15 SAY oSay9 PROMPT "DIGITE SEU CPF:" SIZE 30,12 OF oDlg  PIXEL
@ 315,50 GET oGet9 VAR cVarCPF PICTURE "!@" SIZE 80,12 OF oDlg  PIXEL


  ACTIVATE DIALOG oDlg CENTERED

return

