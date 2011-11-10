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
		int soclu;
		u_short port=2025;
		SOCKET s;
		s = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);//apel tipic pentru crearea unui soclu Windows
		if(s==INVALID_SOCKET)
		{
		DWORD err = WSAGetLastError();
		printf("eroare socket: %d", err);
		exit(1);
		}
		//secvenþã tipicã pentru definirea structurii sockaddr_in este:
		sockaddr_in in_addr;
		memset((char*)&in_addr, 0, sizeof(in_addr));//funcþia memset() iniþializeazã cu 0 structura in_addr.
		in_addr.sin_family = PF_INET;
		in_addr.sin_port = htons(port);
		unsigned long* l = (unsigned long*)&in_addr.sin_addr;
		*l = INADDR_ANY;
//	Conectarea la nume este realizatã prin intermediul funcþiei
		soclu = bind(s, (struct sockaddr*)&in_addr,
		sizeof(sockaddr_in));
		if(soclu==SOCKET_ERROR)
		{
			DWORD err = WSAGetLastError();
			printf("eroare bind: %d", err);
			exit(1);
		}
	soclu = listen(s, SOMAXCONN);
	if(soclu==SOCKET_ERROR)
	{
		DWORD err = WSAGetLastError();
		printf("eroare bind: %d", err);
		exit(1);
	}//Funcþia accept() realizeazã blocarea soclului dacã în coada listen() nu
	//existã nici o cerere. 
	SOCKET ns = accept(s, NULL, NULL);
	if(ns == INVALID_SOCKET)
	{
		DWORD err = WSAGetLastError();
		printf("eroare accept: %d", err);
		exit(1);
	}

	printf(" accept OK\n");
	char buf[10];
	memset(buf, 0, sizeof(buf));
	if(recv(ns, buf, 10, 0)==SOCKET_ERROR)
	{
	DWORD err = WSAGetLastError();
	printf("eroare recv: %d", err);
	exit(1);
	}
	closesocket(ns);
	closesocket(s);
	printf("am citit: %s\n", buf);
	getch();
}