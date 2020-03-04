#INCLUDE "protheus.ch"
#INCLUDE "TopConn.ch"
#INCLUDE "TBICONN.ch"
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'

User Function MyFunction(cAlias,nREG,nOpcao)
  Local CANCELAR
  Local cBAIRRO
  Local cCep
  Local cCFunc
  Local cCidade
  Local cCpf
  Local cDados
  Local cEmail
  Local cEstado
  Local cInfo
  Local CnAME
  Local cTelefone
  Local dData
  local oData
  Local ESTADOS
  Local getBairro
  Local getCep
  Local getCidade
  Local GetCPF
  Local getNome
  Local getTelefone
  Local MenuSexo
  Local nenuSexo := 1
  Local oGet4
  Local oGroup1
  Local oRadMenu2
  Local nRadMenu2 := 1
  Local oSay4
  Local oSay6
  Local SALVAR
  LOCAL cANCELAR
  local cEnd
  local getEnd0
  Local oMultiGe1
  local Bob
  local bRead

//VARIAVEIS QUE ARMAZENAM AS INFOS DOS GETS DAS TELAS
  private dDate := CTOD("")
  private cetBairro := space(30)
  private cetCep := space(8)
  private cetCidade := space(60)
  private cetCPF := space(11)
  private cetNome := space(60)
  private cetTelefone := space(15)
  private getName := space(60)
  private cetEnd :=space(60)
  private cMultiGe1 := space(120)
  private nSTADOS := 1
  private nenuSexo := 1

//BREAD VARIAVEL QUE BLOQUEIA A EDIÇÃO DOS GETS , PARA A OPÇÃO VISUALIZAR E PESQUISAR
  bRead:={||nOpcao ==3 .OR. nOpcao==4}

//CHAMADA DE FUNÇOES DETERMINADA PELA ESCOLHA DO BOTAO DO USUARIO
  if nOpcao != 3
    u_Carregar()
  endif
  if nOpcao == 5
    u_Delet01()
  endif

//CRIAÇÃO DA TELA PRINCIPAL
  DEFINE MSDIALOG oDlg TITLE "CADASTRAMENTO GERAL FUNCIONARIO" FROM -143, 000  TO 500, 500 COLORS 0, 16777215 PIXEL
  @ 023, 006 SAY cCpf PROMPT "DIGITE SEU CPF" SIZE 047, 007 OF oDlg COLORS 0, 16777215 PIXEL
  @ 033, 005 MSGET oGetCPF VAR cetCPF SIZE 050, 010  Picture "@R 999.999.999-99" Valid ValidaCpf(cetCPF) WHEN bRead OF oDlg COLORS 0, 16777215 PIXEL
  @ 007, 003 SAY cDados PROMPT "DADOS CADASTRAIS FUNCIONARIOS" SIZE 098, 010 OF oDlg COLORS 0, 16777215 PIXEL
  @ 060, 004 MSGET oDate VAR dDate SIZE 071, 009 WHEN bRead OF oDlg COLORS 0, 16777215 PIXEL
  @ 048, 002 SAY dData PROMPT "DATA DE NASCIMENTO" SIZE 061, 007 OF oDlg COLORS 0, 16777215 PIXEL
  @ 072, 004 SAY CnAME PROMPT "DIGITE SEU NOME:" SIZE 053, 007 OF oDlg COLORS 0, 16777215 PIXEL
  @ 086, 004 MSGET getNome VAR cetNome SIZE 100, 010 WHEN bRead OF oDlg COLORS 0, 16777215 PIXEL
  @ 150, 003 SAY cCidade PROMPT "DIGITE SUA CIDADE" SIZE 049, 008 OF oDlg COLORS 0, 16777215 PIXEL
  @ 165, 003 MSGET getCidade VAR cetCidade SIZE 100, 010 OF oDlg COLORS 0, 16777215 PIXEL
  @ 123 ,004 SAY cBAIRRO PROMPT "DIGITE SEU BAIRRO" SIZE 053, 008 OF oDlg COLORS 0, 16777215 PIXEL
  @ 135, 004 MSGET getBairro VAR cetBairro SIZE 100, 010 WHEN bRead OF oDlg COLORS 0, 16777215 PIXEL
  @ 076, 123 SAY cEstado PROMPT "SELECIONE SEU ESTADO" SIZE 067, 013 OF oDlg COLORS 0, 16777215 PIXEL
  @ 087, 121 MSCOMBOBOX ESTADOS VAR nSTADOS ITEMS {"AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG ","PA","PB","PR","PE","PI ","RJ","RN","RS","RO","RR","SC","SP","SE"} SIZE 072, 010  OF oDlg COLORS 0, 16777215 PIXEL
  @ 194, 006 RADIO MenuSexo VAR nenuSexo ITEMS "MASCULINO","FEMININO","NÃO ESPECIFICAR" SIZE 059, 028   OF oDlg COLOR 0, 16777215 PIXEL
  @ 182, 003 SAY oSay4 PROMPT "SELECIONE SUA ORIENTAÇÃO SEXUAL" SIZE 105, 007 OF oDlg COLORS 0, 16777215 PIXEL
  @ 110, 004 MSGET getCep VAR cetCep SIZE 040, 011 PICTURE "@R 99999-999" valid checkCEP(cetCep)  WHEN bRead  OF oDlg COLORS 0, 16777215 PIXEL
  @ 230, 003 SAY cEND PROMPT "DIGITE SEU ENDERcO:" SIZE 080, 020 OF oDlg COLORS 0, 16777215 PIXEL
  @ 240, 005 MSGET getnd VAR cetEnd SIZE 100, 010  WHEN bRead OF oDlg COLORS 0, 16777215 PIXEL
  @ 009, 124 SAY oSay6 PROMPT "INFORMACOES DE CONTATO" SIZE 079, 006 OF oDlg COLORS 0, 16777215 PIXEL
  @ 021, 127 SAY cEmail PROMPT "DIGITE SEU EMAIL" SIZE 061, 007 OF oDlg COLORS 0, 16777215 PIXEL
  @ 031, 123 MSGET oGet4 VAR getName SIZE 090, 010 WHEN bRead  OF oDlg COLORS 0, 16777215 PIXEL
  @ 098, 004  SAY cCep PROMPT "DIGITE SEU CEP" SIZE 054, 011 OF oDlg COLORS 0, 16777215 PIXEL
  @ 051, 120 SAY cTelefone PROMPT "DIGITE SEU TELEFONE" SIZE 061, 007 OF oDlg COLORS 0, 16777215 PIXEL
  @ 061, 122 MSGET getTelefone VAR cetTelefone PICTURE "@R (99)99999-9999 "SIZE 090, 010   WHEN bRead OF oDlg COLORS 0, 16777215 PIXEL
  @ 107, 128 SAY cInfo PROMPT "INFORMACOES ADICIONAIS" SIZE 073, 007 OF oDlg COLORS 0, 16777215 PIXEL
  @ 122, 119 SAY cCFunc PROMPT "FUNCIONARIO NOVO OU ATUALIZACAO" SIZE 103, 008 OF oDlg COLORS 0, 16777215 PIXEL
  @ 139, 124 RADIO oRadMenu2 VAR nRadMenu2 ITEMS "NOVO","ATUALIZACAO" SIZE 092, 019 WHEN bRead OF oDlg COLOR 0, 16777215 PIXEL
  @ 160, 135 SAY BOb PROMPT "OBSERVACOES:" SIZE 090, 044 OF oDlg COLORS 0, 16777215 PIXEL
  @ 167, 135 GET oMultiGe1 VAR cMultiGe1 OF oDlg MULTILINE SIZE 092, 044  WHEN bRead COLORS 0, 16777215 HSCROLL PIXEL

   oDlg:lEscClose := .F.

//CASO A OPÇÃO SEJA ALTERAR OU INCLUIR , OS BOTOES FICARAM DISPONIVEIS
  if (nOpcao == 3) .or. (nOpcao == 4)
        bAction1 := {||U_SZ1MOD(cetCPF,dDate ,cetNome,cetCidade ,cetBairro, nSTADOS,nenuSexo,cetEnd,getName,cetTelefone,cetCep,nRadMenu2 ,cMultiGe1,)}
        bAction2 := {||CancelarRR()}
        salvar:= tButton():new( 290,05,"SALVAR" , oDlg,bAction1, 037, 012 ,,,,.T.)
        cancelar:= tButton():new(292,200,"CANCELAR" ,oDLg,bAction2 , 037, 012 ,,,,.T.)
  ENDIF
  
  ACTIVATE MSDIALOG oDlg CENTERED
RETURN


//FUNÇÃO QUE FECHA A TELA , CASO O BUTTON CANCELAR SEJA ACIONADO
static function CancelarRR()
  if MSGYESNO( "Deseja cancelar?")
    Odlg:End()
  endif

Return

//FUNÇÃO QUE VALIDA O CPF E CASO EXISTA TRÁS AS INFOS DO BANCO PARA A TELA
static Function ValidaCpf(cCpf)
  if u_BuscaCpf(cCpf)
    dDate         :=  SZ1->Z1_DATA
    cetNome       :=  SZ1->Z1_NOME
    cetCidade     :=  SZ1->Z1_CIDADE
    cetBairro     :=  SZ1->Z1_BAIRRO
    nSTADOS       :=  SZ1->Z1_ESTADO
    nenuSexo      :=  SZ1->Z1_SEXO
    cetEnd        :=  SZ1->Z1_END
    getName       :=  SZ1->Z1_EMAIL
    cetCep        :=  SZ1->Z1_CEP
    cetTelefone   :=  SZ1->Z1_TEL
    nRadMenu2     :=  SZ1->Z1_ATIVO
    cMultiGe1     :=  SZ1->Z1_OBS
  ENDIF

return .T.

//função que busca um CPF DIGITADO , NO BANCO DE DADOS
user function BuscaCPF(cCpf)
  local lRet := .F.

  DbSelectArea("SZ1")
  SZ1->(dbSetOrder(1))
  SZ1->(dbGoTop())
  lRet := SZ1->(DBSEEK(XFILIAL("SZ1") + cCpf))

return lRet

//FUNÇÃO QUE ARMAZENA INFOS DO CEP VIA WEB NOS CAMPOS DA TELA
static function CheckCep(cetCep)
  local aInfos := {}
  aInfos:=u_GETCEP(cetCep)

  cetEnd :=aInfos[1]
  cetBairro:=aInfos[2]
  cetCidade:=aInfos[3]
  nSTADOS:=aInfos[4]
return


//FUNÇÃO QUE CARREGA OS DADOS DO BANCO PARA EXIBIR NA TELA
user function Carregar()
    
        dDate         :=  SZ1->Z1_DATA
        cetNome       :=  SZ1->Z1_NOME
        cetCidade     :=  SZ1->Z1_CIDADE
        cetBairro     :=  SZ1->Z1_BAIRRO
        nSTADOS       :=  SZ1->Z1_ESTADO
        nenuSexo      :=  SZ1->Z1_SEXO
        cetEnd        :=  SZ1->Z1_END
        getName       :=  SZ1->Z1_EMAIL
        cetCep        :=  SZ1->Z1_CEP
        cetTelefone   :=  SZ1->Z1_TEL
        nRadMenu2     :=  SZ1->Z1_ATIVO
        cMultiGe1     :=  SZ1->Z1_OBS
        cetCPF        :=  SZ1->Z1_CPF
  

return


//FUNÇÃO QUE DELETA INFOS DO BANCO
user function Delet01()

//SELECIONAMOS A TABEA/ÁREA
  dbSelectArea("SZ1")
  dbSetOrder(1)

  if !(dbSeek(xFilial("SZ1")+Z1_CPF))
    Alert("Este registro não existe,"+Chr(13)+Chr(10)+"portanto não pode ser DELETADO!","ATENÇÃO!")
    dbCloseArea("SZ1")
  else
//GRAVA DELEÇÃO NO BANCO DE DADOS	
    IF MsgYesNo("Tem certeza que quer DELETAR o registro?", "ATENÇÃO" )
      dbSelectArea("SZ1")
      RecLock("SZ1",.F.)

      dbDelete() //função responsável pela deleção lógica
      MsUnlock()

      MsgInfo("Registro DELETADO com sucesso!","AVISO!")
    ELSE
      MsgInfo("Deleção abortada pelo usuário!","AVISO!")
    ENDIF
  ENDIF

  dbCloseArea("SZ1")
return
