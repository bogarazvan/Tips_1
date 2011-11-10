VERSION 5.00
Begin VB.Form frmView 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Despre cum functioneaza RSA"
   ClientHeight    =   9015
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5340
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9015
   ScaleWidth      =   5340
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Height          =   375
      Left            =   1920
      TabIndex        =   1
      Top             =   8400
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H80000000&
      ForeColor       =   &H00000000&
      Height          =   8175
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "frmView.frx":0000
      Top             =   120
      Width           =   5175
   End
End
Attribute VB_Name = "frmView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdOK_Click()
Unload Me
End Sub

