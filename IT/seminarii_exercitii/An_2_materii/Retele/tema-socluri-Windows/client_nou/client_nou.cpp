#include <stdio.h>
#include <conio.h>
#include <windows.h>
#include <Winsock.h> //!!
void main()
{
	WORD wVersionRequested;
	WSADATA wsaData;
	int err;
	wVersionRequested = MAKEWORD( 1, 1 );
	err = WSAStartup( wVersionRequested, &wsaData );
	if ( err != 0 ) 
	{
		return;
	}	
	if ( LOBYTE( wsaData.wVersion ) != 1 ||
		HIBYTE( wsaData.wVersion ) != 1 ) 
	{
		WSACleanup( );
		return;
	}
u_short port=2025;
SOCKET s;
s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	if(s==INVALID_SOCKET)
	{
		DWORD err = WSAGetLastError();
		printf("eroare socket: %d", err);
		exit(1);
	}
	//secvenþã tipicã pentru definirea structurii sockaddr_in este:
struct sockaddr_in in_addr;
	memset((char*)&in_addr, 0, sizeof(in_addr));//În codul de mai
//sus, funcþia memset() iniþializeazã cu 0 structura in_addr.
	in_addr.sin_family = PF_INET;
	in_addr.sin_port = htons(port);
	unsigned char cc[4];cc[0]=172;cc[1]=25;cc[2]=8;cc[3]=57;
	memcpy(&(in_addr.sin_addr), cc, 4);
	if(connect(s, (struct sockaddr*)&in_addr,
		sizeof(sockaddr)) == SOCKET_ERROR)
	{
		DWORD err = WSAGetLastError();
	printf("eroare connect: %d", err);
	exit(1);
	}
//Funcþia void *memset( void *dest, int c, size_t count ); încarcã caracterul c în
//zona de memorie de dimensiune count care începe la adresa dest. 
	
	printf("connect ok\n\nintroduceti sirul de caractere: ");
	char buf[10],c;
	int i=0;
	while (i<10&&(c=getchar())!='\n')
	buf[i++]=c;
	buf[i++]='\0';
	if(send(s, buf, 10, 0) == SOCKET_ERROR)
	{
		DWORD err = WSAGetLastError();
		printf("eroare send: %d", err);
		exit(1);
	}
closesocket(s);
printf("success!\n");
getch();
}