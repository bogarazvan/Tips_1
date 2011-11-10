Attribute VB_Name = "RSAv1"
'***********************************************
'Author: 
'Date: 3.01.2003
'Synopsis: Modul principal pentru calcularea RSA
'************************************************

Public key(1 To 3) As Double
Public p As Double, q As Double
Public PHI As Double

Public Sub genereazaCheie()     'metoda care-o folosesc pentru a-mi genera cheile, poate fi facuta si functie
'Genereaza cheile pentru E, d, si N
Dim E#, D#, N#
Const PQ_UP As Integer = 9999   'imi setez limita superioara a numerelor aleatorii
Const PQ_LW As Integer = 3170   'imi setez limita inferioara a numerelor aleatorii
Const limita_cheii As Long = 10000000 'setare pentru 64 biti minim
p = 0: q = 0
Randomize
Do Until D > limita_cheii       'ma asigur ca cheile sunt cel putin pe 64 biti
    Do Until esteprim(p) And esteprim(q) ' ma asigur ca p si q sunt nr prime
        p = Int((PQ_UP - PQ_LW + 1) * Rnd + PQ_LW)
        q = Int((PQ_UP - PQ_LW + 1) * Rnd + PQ_LW)
    Loop
    N = p * q
    PHI = (p - 1) * (q - 1)
    E = cmmdc(PHI)              'cel mai mare divizor comun
    D = genereazaEuler(E, PHI) '
Loop
        key(1) = E
        key(2) = D
        key(3) = N
End Sub


Private Function genereazaEuler(E3 As Double, PHI3 As Double) As Double
'genereaza pe d (exponent privat) cu ajutorul alg.Euler
On Error Resume Next
Dim u1#, u2#, u3#, v1#, v2#, v3#, q#
Dim t1#, t2#, t3#, z#, uu#, vv#, inverse#
u1 = 1
u2 = 0
u3 = PHI3
v1 = 0
v2 = 1
v3 = E3
Do Until (v3 = 0)
     q = Int(u3 / v3)
     t1 = u1 - q * v1
     t2 = u2 - q * v2
     t3 = u3 - q * v3

     u1 = v1
     u2 = v2
     u3 = v3

     v1 = t1
     v2 = t2
     v3 = t3
     z = 1
Loop
uu = u1
vv = u2
If (vv < 0) Then
          inverse = vv + PHI3
Else
     inverse = vv
End If
genereazaEuler = inverse
End Function

Private Function cmmdc(nPHI As Double) As Double 'cel mai mare divizor comun dupa algoritmul lui Euclid
'generarea unui numar prim relativ la phi
On Error Resume Next

Dim nE#, Y#
Const N_UP = 99999999       'imi setez limita superioara a lui E
Const N_LW = 10000000       'imi setez limita inferioara a lui E
Randomize
nE = Int((N_UP - N_LW + 1) * Rnd + N_LW)
top:                        'acesta e un label
    X = nPHI Mod nE         'caluleaza restul impartirii lui phi la numarul generat nE
    Y = X Mod nE            'caluleaza restul impartirii lui x la numarul generat nE
    If Y <> 0 And esteprim(nE) Then 'verific daca restul y e dif de 0 si daca numarulk generat e prim
        cmmdc = nE          'daca ambele conditii sint indeplinite atunci am generat numar nE bun
        Exit Function
    Else
        nE = nE + 1         'daca nu, la numarul generat adun 1
    End If
    GoTo top
End Function

Private Function esteprim(lngNumber As Double) As Boolean
'functie care returneaza true daca lngNumber este este prim
On Error Resume Next
Dim lngCount#
Dim lngSqr#
Dim X#
lngSqr = Int(Sqr(lngNumber))            'calculeaza radical din numar
If lngNumber < 2 Then                   'verifica daca numarul e mai mic decit 2
        esteprim = False                'nu e prim deoarece e egal cu 1
        Exit Function
    End If
    lngCount = 2                        'atribuie variabilei lngCount valoarea 2
    esteprim = True                     'seteaza valaoarea lui isprime la true
    If lngNumber Mod lngCount = 0 Then  'verifica daca restul impartirii numarului lngNumber la 2 este 0, daca e 0 atunci numarul e divizibil cu 2, deci nu e prim
        esteprim = False
        Exit Function
    End If
    lngCount = 3                        'atribuie variabilei lngCount valoarea 3

        For X = lngCount To lngSqr Step 2 'verifica pt toate numerele cuprinse in intervalul [lngCount...lngSqr] din doi in doi, daca numarul nostru (lngNumber) e divizibil cu ele
        If lngNumber Mod X = 0 Then
            esteprim = False
            Exit Function
        End If
    Next
End Function

Public Function Mult(ByVal X As Double, ByVal p As Double, ByVal m As Double) As Double
'encripteaza/ decripteaza valori trimise catre functie
'Mult = M^E mod N (encrypt)  unde M = x , E = p, N = m
'Mult = M^D mod N (decrypt)
On Error GoTo error1
    Y = 1
    Do While p > 0
        Do While (p / 2) = Int((p / 2))
            X = nMod((X * X), m)
            p = p / 2
        Loop
        Y = nMod((X * Y), m)
        p = p - 1
    Loop
    Mult = Y
    Exit Function
error1:
Y = 0
End Function

Private Function nMod(X As Double, Y As Double) As Double
'imi inlocuiesc comanda Mod; in loc de z = x Mod y folosesc z = nMod(x,y)
'genereaza formula pt calculul modulo (restul impartirii a doua numere)
On Error Resume Next
Dim z#
z = X - (Int(X / Y) * Y) 'formula de calcul, imi scot intregul
nMod = z
End Function

Public Function encripteaza(tIp As String, EE As Double, eN As Double) As String
On Error Resume Next
Dim encSt As String
encSt = ""
e2st = ""
    If tIp = "" Then Exit Function
    For i = 1 To Len(tIp)
        encSt = encSt & Mult(CLng(Asc(Mid(tIp, i, 1))), EE, eN) & "+" 'imi construiesc sirul de caractere encriptate cu +
    Next i
encripteaza = encSt
End Function

Public Function dec(tIp As String, dD As Double, dN As Double) As String
'imi returnez caract din longuri pt a le putea reprezenta ca numere de ex A = 12345678, B = 23456789 etc..
On Error Resume Next
Dim decSt As String
decSt = ""
For z = 1 To Len(tIp)
    ptr = InStr(z, tIp, "+")
    tok = Val(Mid(tIp, z, ptr))
    decSt = decSt + Chr(Mult(tok, dD, dN))
    z = ptr
Next z
dec = decSt
End Function

