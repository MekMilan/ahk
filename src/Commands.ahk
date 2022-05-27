command(cmd)
{
	path_Funcs = %A_ScriptDir%\Functions\
	path_notepadpp = C:\Program Files (x86)\Notepad++\notepad++.exe
	path_vsCode = C:\Users\User\AppData\Local\Programs\Microsoft VS Code\Code.exe

	if instr(cmd, "g ")
	{
		cmd := strReplace(cmd, "g ", "")
		run, https://www.google.com/search?q=%cmd%
		return
	}
	if instr(cmd, ">")
	{
		cmd := strReplace(cmd, ">")
		run, %cmd%
		return
	}
	if instr(cmd, "y ")
	{
		cmd := strReplace(cmd, "y ")
		run, https://www.youtube.com/results?search_query=%cmd%
		return
	}	
	if instr(cmd, "ahk ")
	{
		cmd := strReplace(cmd, "ahk ")
		run, https://www.google.com/search?q=%cmd% ahk
		return
	}
	if instr(cmd, "onemail ")
	{
		cmd := strReplace(cmd, "onemail ")
		run, https://mail.google.com/mail/u/0/#search/%cmd%
		return
	}
	if instr(cmd, "xml ")
	{
		cmd := strReplace(cmd, "xml ")
		cmd := strReplace(cmd, "-")
		cmd := strReplace(cmd, "/")
		cmd := strReplace(cmd, ".")
		cmd := strReplace(cmd, " ")
		clipboard = %cmd%
		settimer, rmtt, 1000
		tooltip, ! Formatado !
		return
	}
	if instr(cmd, "rot ")
	{
		cmd := StrSplit(cmd, " ")	
		if (cmd[2] == 1)
		{
			title = HP Scan - HP Officejet Pro 8610 (USB)
			IfWinExist, %title%
			{
				WinActivate, %title%
				;click na imagem
				click, 102, 114
				;click no rotate
				click, 723, 188

				click, 101, 264
				click, 723, 188
				sleep, 150
				click, 645, 533
				return
			}
			else
			{
				msgbox, [HP Scan - 8610] Not Found
				return
			}
		}
		else
		{
			msgBox, pass
		}
	}
	if instr(cmd, "update ")
	{
		SHORT_PATH := "\\LEANDRO\.Controle de Conferencia\zzz\scripts"
		cmd := StrSplit(cmd, " ")
		if (cmd[2] == "leandro")
		{
			FileAppend, apenas um update, %SHORT_PATH%\Update_Leandro.txt
			return
		}
		else if (cmd[2] == "marcia")
		{
			FileAppend, apenas um update, %SHORT_PATH%\Update_Marcia.txt
			return
		}
		else if (cmd[2] == "2")
		{
			FileAppend, apenas um update, %SHORT_PATH%\Update_Leandro.txt
			FileAppend, apenas um update, %SHORT_PATH%\Update_Marcia.txt
			return
		}
		else
		{
			msgBox, Nenhum local selecionado !
			return
		}
	}
	if inStr(cmd, "nf ")
	{
		cmd := StrSplit(cmd, " ")
		switch (cmd[2])
		{	
			case "156":
				openFolder("Luiz Felipe dos Santos Ramos\Notas Fiscais")
				return
			case "113", "red":
				openFolder("R & D Terceirização\Notas Fiscais")
				return
			case "46":
				openFolder("ROBERTO FRANCO GREGORIO\Notas Fiscais")
				return
			case "142":
				openFolder("Rafael Deus padaria\Notas Fiscais")
				return
			case "59":
				openFolder("Lorival Rizzo\Notas Fiscais")
				return
			case "115":
				openFolder("Dedim Comercio de Ferragens\Notas Fiscais")
				return
			case "78":
				openFolder("Lusiana castilho Sganzela\Notas Fiscais")
				return
			case "105":
				openFolder("Cristiano Franco Representantes\Notas Fiscais")
				return
			case "150":
				openFolder("G E R S Silvicultura Ltda\Notas Fiscais")
				return
			case "62":
				openFolder("Murilo Ramos Cagnon\Notas Fiscais")
				return
			case "67":
				openFolder("M A R da Silva Servicos Agricolas\Notas Fiscais")
				return
			case "69":
				openFolder("M A F Serviços Medicos\Notas Fiscais")
				return
			case "146":
				openFolder("BRUNO CAVALHEIRO\Notas Fiscais")
				return
			case "310", "nilza":
				openFolder("NILZA CAVALHEIRO\Notas Fiscais")
				return
			case "315", "carvao":
				openFolder("Carvao Pioneiro\Notas Fiscais")
				return
			case "63":
				openFolder("JUNINHO MOTORES E PNEUMATICO\Notas Fiscais")
				return
			case "28":
				openFolder("Equilibrio\Notas Fiscais")
				return
			case "69":
				openFolder("M A F Serviços Medicos\Notas Fiscais")
				return
			case "145":
				openFolder("Jocilene Costa Ramos Rodrigues\Notas Fiscais")
				return
			case "355":
				openFolder("Lavanderia\Notas Fiscais")
				return
			case "135":
				openFolder("Rogerio Troncone\Notas Fiscais")
				return
			case "fab":
				openFolder("Micro Empreendedor Individual\Fabiana Brasil\Notas Fiscais")
				return
			case "yuri":
				openFolder("Micro Empreendedor Individual\YURI BENTIVENHA\Notas Fiscais")
				return
			default:
				msgbox, 4, [NF Opener], % "Command not found !`n`nTyped:  " cmd[2] "`n`nEdit ?"
				ifmsgbox yes
				{
					edit
				}
			return
		}
		return
	}
	if instr(cmd, "f ")
	{
		cmd := StrSplit(cmd, " ")
		switch (cmd[2])
		{
			case "67":
				openFolder("M A R da Silva Servicos Agricolas\Documentos dos Funcionarios Digitalizados\Funcionarios")
				return
			case "150":
				openFolder("G E R S Silvicultura Ltda\Documentos Funcionarios Digitalizado\Funcionarios")
				return
			default:
				msgbox, 4, [Funcionarios], % "Command not found !`n`nTyped:  " cmd[2] "`n`nEdit ?"
				ifmsgbox yes
				{
					edit
				}
			return
		}
		return
	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;[Abrir Pasta de Holerits];;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	if instr(cmd, "h ")
	{
		cmd := StrSplit(cmd, " ")
		switch (cmd[2])
		{
			case "67":
				openFolder("M A R da Silva Servicos Agricolas\Documentos dos Funcionarios Digitalizados\Holerits")
				return
			case "150":
				openFolder("G E R S Silvicultura Ltda\Documentos Funcionarios Digitalizado\Holerits")
				return
			default:
				msgbox, 4, [Holerits], % "Command not found !`n`nTyped:  " cmd[2] "`n`nEdit ?"
				ifmsgbox yes
				{
					edit
				}
			return
		}
		return
	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;[Commands without prefix];;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	if instr(cmd, "")
	{
		switch (cmd)
		{
			case "reset":
				run, %A_ScriptDir%\Statusbar.ahk
				run, %A_ScriptDir%\TilingWM.ahk
				return
			case "log", "logs":
				if (cmd == "logs")
					openWith("sublimetext", "logs\logs.txt")
				else
					run, %A_ScriptDir%\logs\logs.ahk
				return
			case "lower":
				InputBox, input, Input text to lower, , , 384, 101, , , , , 
				StringLower, lowered, input
				clipboard = %lowered%
				return

			case "upper":
				InputBox, input, Input text to UPPER, , , 384, 101, , , , , 
				StringUpper, uppered, input
				clipboard = %uppered%
				return

			case "print", "imprimir":
				send ^p
				winWait, Imprimir
				winActivate, Imprimir
				click, 429, 193
				winWait, HP993750 (HP Ink Tank Wireless 410 series),, 2
				winWait, HP056C09 (HP Ink Tank Wireless 410 series),, 2
					sleep, 300
					click, 430, 609
					sleep, 300
				winActivate, Imprimir
				sleep, 300
				click, 402, 403
				return

			case "todo":
				run, C:\Users\User\Desktop\ToDo.txt
				return

			case "avisos":
				InputBox, aviso, Qual o aviso ?, , , 337, 102, , , , , 
				fileDelete, C:\Users\User\Pictures\avisos.ahk
				fileAppend, msgbox %aviso%, C:\Users\User\Pictures\avisos.ahk
				return

			case "clients", "clientes":
				run, \\LEANDRO\Documentos\Clientes do Equilibrio
				return

			case "win", "wintest":
				run, %A_ScriptDir%\Functions\winTest.ahk
				return

			case "cnpj ma", "cnpj marcia":
				FileAppend, , %path_local%\.Controle de Conferencia\zzz\scripts\cnpj.txt
				return

			case "zz", "zzz":
				openFolder(".Controle de Conferencia\zzz")
				return

			case "mousepos", "pos", "mouse":
				run, %A_ScriptDir%\Functions\getMousePoint.ahk
				return

			case "recorvery", "recor":
				run, C:\Users\User\Desktop\recovery.txt
				return

			case "save", "sendsave":
				if (cmd == "save")
				{
					InputBox, saveCommit, Commit, , , 350, 100, , , , ,
					SAVE_COMMIT = %saveCommit%
					if not errorlevel
					{
						settimer, rmtt, 2000
						tooltip, %SAVE_COMMIT%
						keywait, i, d, T5
						if errorLevel != 1
						{
							send {backspace}
							send %saveCommit%
						}
						else
						{
							setTimer, rmtt, 2000
							tooltip, save canceled !
						}	
					}
				}
				else if (cmd == "sendsave")
				{
					tooltip, SAVE loaded !
					settimer, rmtt, 3000
					keywait, i, d
					{
						send %SAVE_COMMIT%
					}
				}
				return

			case "get":
				wingettitle, title, a
				InputBox, inputUser, Title Name, , , 317, 102, , , , , %title%
				if not errorlevel
				{
					clipboard = %inputUser%
					settimer, rmtt, 3000
					tooltip, %title%
				}
				return

			case "conf":
				openFolder(".Controle de Conferencia")
				return

			case "pass":
				run, %A_ScriptDir%\Functions\atalhos\pass.
				return

			case "gerardias", "srcgerardias":
				if (cmd == "gerardias")
				{
					settimer, rmtt, 3000
					tooltip, GerarDias Loaded ! Press i to start
					keywait, i, d
					{
						send {backspace}
						run, %A_ScriptDir%\Functions\Gerar Dias.ahk
					}
				}
				else
					run, notepad.exe %A_ScriptDir%\Functions\Gerar Dias.ahk
				return
			case "explorer ", "explorer":
				InputBox, path, Path to folder,,, 384, 105
				run, explorer.exe %path%
				return

			case "cons", "srccons":

				path := "Interfaces\Sites.ahk"

				if (cmd == "cons")
					run, %A_ScriptDir%\%path%
				else if (cmd == "srccons")
					openWith("sublimetext", path)
				return

			case "text","txt":
				send {AppsKey}vdd{enter}
				return

			case "emailnfe":
				run, https://mail.google.com/mail/u/0/
				return

			case "ping":
				run cmd.exe /c ping google.com -t
				return

			case "cst5":
				run, %A_ScriptDir%\Functions\CST50.ahk
				return

			case "cst7":
				run, %A_ScriptDir%\Functions\CST70.ahk
				return

			case "winf":
				; cmd to test/find a window
				InputBox, winw, What window ?, , , 237, 103, , , , , %clipboard%
				if errorlevel
				{
					return
				}
				winWait, %winw%,,5
				if errorLevel
				{
					msgBox, ! Couldnt Find !
					return
				}
				else
				{
					msgBox, Found !
					return
				}				
				return

			case "check":
				run, %A_ScriptDir%\texts_files\CheckListRandomThings.txt
				return

			case "recovery", "recor":
				run, C:\Users\User\Desktop\recovery.txt
				winWait, recovery.txt - Bloco de Notas
				{
					winactivate
					send {ctrl down}{end}{ctrl up}
				}
				return

			case "ttt":
				run, C:\Users\User\Desktop\test\makeFolders.bat
				return

			case "noti", "notif":
				InputBox, lines, Notify Creator, , , 420, 101, 470, 248
				if not errorlevel
				{
					fileappend, %lines%`n, Z:\Clientes do Equilibrio\.Controle de Conferencia\zzz\scripts\notify.txt
				}
				return

			case "calcx":
				run, %A_ScriptDir%\calc.xlsx
				return

			case "rot2", "r2":
				title = HP Scan - HP Officejet Pro 8610 (USB)
				IfWinExist, %title%
				{
					WinActivate, %title%
					click, 102, 114
					click, 723, 188
					click, 101, 264
					click, 723, 188
					sleep, 150
					click, 645, 533
					return
				}
				else
				{
					msgbox, [HP Scan - 8610] Not Found
					return
				}
				return

			case "rot1", "r1":
				title = HP Scan - HP Officejet Pro 8610 (USB)
				IfWinExist, %title%
				{
					WinActivate, %title%
					click, 102, 114
					click, 723, 188
					sleep, 150
					click, 645, 533
					return
				}
				else
				{
					msgbox, [HP Scan - 8610] Not Found
					return
				}
				return
				
			case "note":
				run C:\Software\Sublime Text\sublime_text.exe
				return
				
			case "ipmaker":
				run, %A_ScriptDir%\Functions\inputbox maker.ahk
				return

			case "startup", "startmenu":
				;run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
				run, notepad.exe %A_ScriptDir%\Functions\start up.ahk
				return

			case "geren":
				send {ctrl down}{shift down}{esc}{ctrl up}{shift up}
				return

			case "ano":
				run, C:\Users\User\Documents\Anotacoes.docx
				return

			case "notes":
				run, notepad.exe
				return

			case "aver", "edital":
				path = %A_ScriptDir%\Complementos\sumario.txt
				ifWinExist, sumario.txt - Bloco de Notas
					winactivate
				else
					run, %path%,,max
				return

			case "help":
				run, notepad.exe Z:\Clientes do Equilibrio\.Controle de Conferencia\zzz\Ajuda com o Terminal.txt
				return

			case "confs", "srcconfs":

				path := "Interfaces\Confs.ahk"

				if (cmd == "confs")
					run, %A_ScriptDir%\%path%
				else if (cmd == "srcconfs")
					run, notepad.exe %A_ScriptDir%\%path%
				return

			case "tele", "telefone", "fone":
				run, %A_ScriptDir%\texts_files\lista telefonica.txt
				return

			case "das":
				run, http://www8.receita.fazenda.gov.br/SimplesNacional/Aplicacoes/ATSPO/pgmei.app/Identificacao
				return

			case "cnpj", "pj", "srccnpj":

				path := "Interfaces\Cnpjs.ahk"

				if (cmd == "cnpj" or cmd == "pj")
					run, %A_ScriptDir%\%path%
				else if (cmd == "srccnpj")
					openWith("sublimetext", path)
				return

			case "test", "srctest":

				path := "quick_tests\main_test.ahk"

				if (cmd == "test")
					run, %A_ScriptDir%\%path%
				else if (cmd == "srctest")
					openWith("sublimetext", path)
				return

			case "regua":
				run, %A_ScriptDir%\Functions\[Module] Regua.ahk
				run, %A_ScriptDir%\Functions\[Module] Regua-ex.ahk
				return	

			case "tt":
				run, [Function] setToolTip.ahk
				return

			case "senha":
				planilha := "Codigo Senhas Nota Fiscal Serviço Areiopolis.xlsx - Excel"
				site := "https://www.samtributacao.com.br/logon/xindex.php - Pessoal — Microsoft​ Edge"
				
				ifWinExist, %site%
					SetKeyDelay, 200
					winActivate, %planilha%
						send ^c
					
					winActivate, %site%
						click, 745, 481
						send ^v
						send {tab}

					winActivate, %planilha%
					{
						send {right}
						send ^c
					}
					winActivate, %site%
					{
						send ^v
						SetKeyDelay, 50
						send {tab 3}
					}
				return

			case "format":
				InputBox, retirar, Oque remover ?, , , 163, 102, , , , , 
				clipboard := strReplace(%retirar%, "")
				setTimer, rmtt, 3000
				tooltip, %clipboard%
				return

			case "nums":
				run, %A_ScriptDir%\Functions\[Module] numberSender.ahk
				return

			case "nfse":
				run, %A_ScriptDir%\Functions\[Module] NFS-e.ahk
				return

			case "path":
				InputBox, inputUser, Title Name, , , 317, 102, , , , , %clipboard%
				if (errorlevel == 0)
				{
					clipboard = %inputUser%
					settimer, rmtt, 1000
					tooltip, Get: %clipboard%
				}
				return

			case "mods":
				run, %A_ScriptDir%\Interfaces\Check Modules.ahk
				return

			case "fix":
				InputBox, nameWindowToFix, Qual janela arrumar ?, , , 194, 102, , , , ,
				winmove, %nameWindowToFix%,, 80, 80
				return

			case "xml":
				run, [Module] NotasXML.ahk
				return

			case "email", "emails", "srcemails":

				path := "Interfaces\Emails.ahk"

				if (cmd == "email" or cmd == "emails")
					run, %A_ScriptDir%\%path%
				else if (cmd == "srcemails")
					run, notepad.exe %A_ScriptDir%\%path%
				return

			case "luciana":
				run, %A_ScriptDir%\Functions\[email] Luciana Amaro.ahk
				return

			case "calc", "cacl":
				run, calc.exe
				return

			case "src":
				edit
				return

			case "local":
				run, %A_ScriptDir%
				return
			case "notepp":
				run, %notepadpp%
				return
			case "funcs":
				run, %path_Funcs%
				return
			case "clock":
				run, Clock.ahk
				return
			case "data":
				run, %A_ScriptDir%\Interfaces\Data.ahk
				return
			case "docs":
				run, C:\Users\User\Documents
				return
			case "downs":
				run, C:\Users\User\Downloads
				return
			case "mes":
				openFolder(".Controle de Conferencia\.Planilha Fiscal\Planilha do Fiscal do Mes")
				return
			case "veiculos", "veiculo", "veicu":
				openFolder(".Controle de Conferencia\Veiculo Alugados")
				return
			case "notas":
				openFolder(".Controle de Conferencia\.Notas que chegaram depois")
				return
			case "templates":
				run, %A_ScriptDir%\texts_files\templates.txt
				return
			case "mei cnpj":
				openFolder("CNPJs MEI.xlsx")
				return
			case "reload", "rd", "rl", "re":
				reload
				return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;[Pastas das Empresas];;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			case "156", "felipe", "luis felipe":
				openFolder("Luiz Felipe dos Santos Ramos")
				return
			case "113", "red":
				openFolder("R & D Terceirização")
				return
			case "153":
				openFolder("Livia Eduarda G Cavalheiro")
				return
			case "mei":
				openFolder("Micro Empreendedor Individual")
				return
			case "46":
				openFolder("ROBERTO FRANCO GREGORIO")
				return
			case "142":
				openFolder("Rafael Deus padaria")
				return
			case "59":
				openFolder("Lorival Rizzo")
				return
			case "115":
				openFolder("Dedim Comercio de Ferragens")
				return
			case "78":
				openFolder("Lusiana castilho Sganzela")
				return
			case "105":
				openFolder("Cristiano Franco Representantes")
				return
			case "150":
				openFolder("G E R S Silvicultura Ltda")
				return
			case "62":
				openFolder("Murilo Ramos Cagnon")
				return
			case "67":
				openFolder("M A R da Silva Servicos Agricolas")
				return
			case "69":
				openFolder("M A F Serviços Medicos")
				return
			case "146":
				openFolder("BRUNO CAVALHEIRO")
				return
			case "310", "nilza":
				openFolder("NILZA CAVALHEIRO")
				return
			case "315", "carvao":
				openFolder("Carvao Pioneiro")
				return
			case "63":
				openFolder("JUNINHO MOTORES E PNEUMATICO")
				return
			case "28":
				openFolder("Equilibrio")
				return
			case "69":
				openFolder("M A F Serviços Medicos")
				return
			case "145":
				openFolder("Jocilene Costa Ramos Rodrigues")
				return
			case "355":
				openFolder("Lavanderia")
				return
			case "135":
				openFolder("Rogerio Troncone")
				return
			case "fab":
				openFolder("Micro Empreendedor Individual\Fabiana Brasil")
				return
			case "yuri":
				openFolder("Micro Empreendedor Individual\YURI BENTIVENHA")
				return
			case "jaine":
				openFolder("JAINE MORAES MEI")
				return
			case "":
				return
			default:
				msgbox, 4, [Commands], % "Command not found !`n`nTyped:  " cmd "`n`nEdit ?"
				ifmsgbox yes
				{
					edit
				}
			return
		}
		return
	}
	return
}