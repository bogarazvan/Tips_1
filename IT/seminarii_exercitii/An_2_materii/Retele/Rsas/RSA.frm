VERSION 5.00
Begin VB.Form RSA 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "RSA"
   ClientHeight    =   7080
   ClientLeft      =   4485
   ClientTop       =   2100
   ClientWidth     =   4620
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7080
   ScaleWidth      =   4620
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdEncrypt 
      Appearance      =   0  'Flat
      Caption         =   "Encripteaza stringul"
      Height          =   435
      Left            =   0
      TabIndex        =   23
      Top             =   6240
      Width           =   2190
   End
   Begin VB.CommandButton cmdDecrypt 
      Appearance      =   0  'Flat
      Caption         =   "Decripteaza stringul"
      Height          =   435
      Left            =   2400
      TabIndex        =   19
      Top             =   6240
      Width           =   2055
   End
   Begin VB.TextBox Text10 
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   18
      Top             =   5160
      Width           =   4470
   End
   Begin VB.TextBox Text9 
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   17
      Top             =   3720
      Width           =   4470
   End
   Begin VB.TextBox Text3 
      Height          =   555
      Left            =   0
      TabIndex        =   16
      Top             =   2880
      Width           =   4470
   End
   Begin VB.Frame Frame1 
      Caption         =   "Creeaza - (Cheia publica-Cheia privata)"
      Height          =   2535
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4575
      Begin VB.TextBox txtPhi 
         Height          =   315
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Phi = (P-1) * ( Q-1)"
         Top             =   1095
         Width           =   1005
      End
      Begin VB.TextBox txtQ 
         Height          =   315
         Left            =   1485
         Locked          =   -1  'True
         TabIndex        =   10
         Top             =   495
         Width           =   1005
      End
      Begin VB.TextBox txtP 
         Height          =   315
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "R"
         Top             =   495
         Width           =   1005
      End
      Begin VB.TextBox txtD 
         Height          =   315
         Left            =   2520
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "D = Opusul lui E"
         Top             =   2040
         Width           =   1005
      End
      Begin VB.TextBox txtN 
         Height          =   315
         Left            =   1320
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "N = P * Q"
         Top             =   2040
         Width           =   1005
      End
      Begin VB.TextBox txtE 
         Height          =   315
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   3
         Top             =   2040
         Width           =   1005
      End
      Begin VB.CommandButton cmdKeyGen 
         Caption         =   "&GenereazaChei"
         Height          =   360
         Left            =   2760
         TabIndex        =   2
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label Label15 
         Caption         =   "N  =  P * Q"
         Height          =   255
         Left            =   1485
         TabIndex        =   15
         Top             =   1200
         Width           =   1635
      End
      Begin VB.Label Label14 
         Caption         =   "Phi  =  (P-1) * (Q-1)"
         Height          =   255
         Left            =   1485
         TabIndex        =   14
         Top             =   945
         Width           =   1635
      End
      Begin VB.Label Label13 
         Caption         =   "(Phi)"
         Height          =   270
         Left            =   120
         TabIndex        =   13
         Top             =   840
         Width           =   885
      End
      Begin VB.Label Label12 
         Caption         =   "(Q)"
         Height          =   270
         Left            =   1485
         TabIndex        =   12
         Top             =   225
         Width           =   885
      End
      Begin VB.Label Label10 
         Caption         =   "'D' Cheia pt. decriptare:"
         Height          =   435
         Left            =   2520
         TabIndex        =   8
         Top             =   1560
         Width           =   1125
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label3 
         Caption         =   "'N' Modulus:"
         Height          =   345
         Left            =   1320
         TabIndex        =   6
         Top             =   1680
         Width           =   1095
      End
      Begin VB.Label Label2 
         Caption         =   "'E' Cheia pt encriptare:"
         Height          =   435
         Left            =   120
         TabIndex        =   5
         Top             =   1560
         Width           =   1260
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000005&
         X1              =   30
         X2              =   4455
         Y1              =   1530
         Y2              =   1530
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000003&
         X1              =   15
         X2              =   4440
         Y1              =   1515
         Y2              =   1515
      End
      Begin VB.Label Label1 
         Caption         =   "(P)"
         Height          =   270
         Left            =   135
         TabIndex        =   1
         Top             =   225
         Width           =   885
      End
   End
   Begin VB.Label Label6 
      Caption         =   "String decriptat:"
      Height          =   255
      Left            =   0
      TabIndex        =   22
      Top             =   4920
      Width           =   1935
   End
   Begin VB.Label Label5 
      Caption         =   "String encriptat:"
      Height          =   255
      Left            =   0
      TabIndex        =   21
      Top             =   3480
      Width           =   1815
   End
   Begin VB.Label Label4 
      Caption         =   "String pentru encriptat:"
      Height          =   255
      Left            =   0
      TabIndex        =   20
      Top             =   2640
      Width           =   1815
   End
   Begin VB.Menu mnuExit 
      Caption         =   "&Iesire"
   End
   Begin VB.Menu mnuAbout 
      Caption         =   "&Despre..."
   End
End
Attribute VB_Name = "RSA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim E, D, N As Double

Private Sub cmdDecrypt_Click()
    If Text3 = "" Then
        MsgBox "Stringul nu poate fi decriptat deoarece nu a fost introdul stringul pentru encriptat", vbOKOnly, "Eroare:"
        Exit Sub
        Else
Text10 = dec(Text9, key(2), key(3))
End If
End Sub

Private Sub cmdEncrypt_Click()
If Text3 = "" Then
    MsgBox "Va rog introduceti un string pentru a fi encriptat", vbOKOnly, "Eroare:"
Exit Sub
Else
    Text9 = encripteaza(Text3, key(1), key(3))
End If
End Sub

Private Sub cmdKeyGen_Click()
genereazaCheie
                        txtP = p      'P
                        txtQ = q      'Q
                        txtPhi = PHI  'PHI
                        txtE = key(1) 'E
                        txtD = key(2) 'D
                        txtN = key(3) 'N
                        Text4 = txtE
                        Text5 = txtN
                        Text6 = txtN
                        Text7 = txtD
End Sub

Private Sub mnuAbout_Click()
frmAbout.Show vbModal
End Sub

Private Sub mnuExit_Click()
Unload Me
End Sub

Private Sub mnuView_Click()
frmView.Show vbModal
End Sub
